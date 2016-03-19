# Maintainer: Yuexuan Gu <lastavengers@outlook.com>

pkgname=ricin-git
_pkgname=Ricin
_submodule=tox-vapi
pkgver=0.452.b519ec3
pkgrel=1
pkgdesc="Lightweight and Fully-Hackable Tox client powered by Vala & Gtk3"
url="https://github.com/RicinApp/Ricin"
arch=('i686' 'x86_64')
license=('GPL3')
makedepends=('meson' 'ninja' 'vala')
depends=('gtk3' 'toxcore' 'glib2' 'json-glib' 'libsoup' 'libnotify' 'libconfig')
source=("git+https://github.com/RicinApp/Ricin.git"
        "git+https://github.com/RicinApp/tox-vapi.git")
sha256sums=('SKIP' 'SKIP')
provides=('ricin')
conflicts=('ricin')

prepare() {
    cd "${srcdir}/${_pkgname}"
    git submodule init
    git config submodule.${_submodule}.url $srcdir/${_submodule}
    git submodule update
    echo 'compile: ./build/' >> Makefile
    echo '	type ninja-build 2>/dev/null && ninja-build -C build || ninja -C build' >> Makefile
}

pkgver() {
    cd "${srcdir}/${_pkgname}"
    echo "0.$(git rev-list --count HEAD).$(git describe --always)"
}

build() {
    cd "${srcdir}/${_pkgname}"
    mkdir build
    meson.py . build
    make compile
}

package() {
    install -Dm755 "${srcdir}/${_pkgname}/build/${_pkgname}" "${pkgdir}/usr/bin/ricin"
}
