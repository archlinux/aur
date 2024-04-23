# Maintainer: Jat <chat@jat.email>

_pkgname='pulseaudio-module-xrdp'
pkgname="${_pkgname}-git"
pkgver=0.7.r10.g791dc3f
pkgrel=1
pkgdesc='PulseAudio modules for xrdp. Git version, devel branch.'
arch=('i686' 'x86_64' 'armv6h' 'armv7l' 'aarch64')
url='https://github.com/neutrinolabs/pulseaudio-module-xrdp'
license=('LGPL-2.1')
depends=('pulseaudio' 'xrdp')
makedepends=('git' 'meson' 'check' 'doxygen' 'perl-xml-parser')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
install="${_pkgname}.install"

_pulseaudio_ver="$(pulseaudio --version | awk '{print $NF}')"
: "${_pulseaudio_ver:=17.0}"

source=(
    "git+${url}.git#branch=devel"
    "https://freedesktop.org/software/pulseaudio/releases/pulseaudio-${_pulseaudio_ver}.tar.xz")
sha256sums=(
    'SKIP'
    "$(curl -fs "${source[1]}.sha256sum" | awk '{print $1}')"
)

pkgver() {
    cd "$srcdir/$_pkgname"

    _tag=$(git tag -l --sort -v:refname | sed '/rc[0-9]*/d' | head -n1)
    _rev=$(git rev-list --count "$_tag"..HEAD)
    _hash=$(git rev-parse --short HEAD)
    printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//; s/-/_/'
}

prepare() {
    cd "${srcdir}/pulseaudio-${_pulseaudio_ver}"

    meson build
}

build() {
    cd "${srcdir}/${_pkgname}"

    sed -i '\#-I $(PULSE_DIR)/src#a -I $(PULSE_DIR)/build \\' src/Makefile.am

    ./bootstrap
    ./configure "PULSE_DIR=${srcdir}/pulseaudio-${_pulseaudio_ver}"
    make
}

package() {
    cd "${srcdir}/${_pkgname}"

    make DESTDIR="$pkgdir" install
}
