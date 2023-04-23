# Maintainer: kballen <ken@kballentine.net>

_pkgname=pulseaudio-module-xrdp
pkgname="${_pkgname}-git"
pkgver=0.7.r0.gf4b5d14
pkgrel=1
pkgdesc="PulseAudio modules for xrdp"
arch=('i686' 'x86_64')
url="https://github.com/neutrinolabs/pulseaudio-module-xrdp"
license=('LGPL')
depends=('pulseaudio' 'xrdp')
makedepends=('git' 'meson' 'check' 'doxygen' 'perl-xml-parser')
install="${_pkgname}.install"
conflicts=('pulseaudio-module-xrdp')
provides=('pulseaudio-module-xrdp')

_pulseaudio_ver=$(pulseaudio --version | awk '{print $NF}')
: "${_pulseaudio_ver:=16.1}"

source=("git+https://github.com/neutrinolabs/${_pkgname}.git#branch=devel"
        "https://freedesktop.org/software/pulseaudio/releases/pulseaudio-${_pulseaudio_ver}.tar.xz")
sha256sums=('SKIP'
            "$(curl -fs "${source[1]}.sha256sum" | awk '{print $1}')")

pkgver() {
    cd "$srcdir/$_pkgname"

    git describe --long --tags | sed -E 's,^[^0-9]*,,;s,([0-9]*-g),r\1,;s,-,.,g'
}


prepare() {
    cd "$srcdir/pulseaudio-${_pulseaudio_ver}"

    meson build
}

build() {
    cd "$srcdir/${_pkgname}"

    sed -i '\#-I $(PULSE_DIR)/src#a -I $(PULSE_DIR)/build \\' src/Makefile.am

    ./bootstrap
    ./configure "PULSE_DIR=$srcdir/pulseaudio-${_pulseaudio_ver}"
    make
}

package() {
    cd "$srcdir/${_pkgname}"

    make DESTDIR="$pkgdir" install
}
