# Maintainer: Peter Mattern <pmattern at arcor dot de>
# Contributor: Helder Bertoldo <helder.bertoldo@gmail.com>

_pkgname=tuner
pkgname="${_pkgname}"-git
pkgver=2.2.0.beta.2.r15.g23b6895
pkgrel=1
pkgdesc="Minimalist radio station player geared towards RadioBrowser"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/tuner-labs/${_pkgname}"
license=('GPL-3.0-only')
depends=('gtk3' 'libgee' 'gst-plugins-good')
optdepends=('gst-libav: play AAC[+] streams')
makedepends=('git' 'meson' 'vala')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git#branch=development"
        'dont-update-gsettings-schemas-at-build-time.patch')
sha256sums=('SKIP'
            '47d34ddd90fe5e7e03d4102317d1bfcb627521e4cd2b658b4e92f7577cf38b4a')

pkgver() {
    cd "${_pkgname}"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${_pkgname}"
    for p in "${srcdir}"/*.patch
    do
        echo "Applying patch $(basename "${srcdir}"/${p})"
        patch -p1 -i "${p}"
    done
}

build() {
    arch-meson "${_pkgname}" 'build'
    meson compile -C 'build'
}

package() {
    DESTDIR="${pkgdir}" meson install -C 'build'
    cd "${pkgdir}"/usr/bin/
    ln -s io.github.tuner_labs.tuner tuner
}
