# vim:ts=4:sw=4:expandtab

_pkgname=huestacean
pkgname=${_pkgname}-git
pkgver=v2.6.r4.g8419b52
pkgrel=1
pkgdesc="Philips Hue control app for desktop with screen syncing"
arch=('any')
url="https://github.com/BradyBrenot/huestacean"
license=('Apache')
depends=('qt5-base' 'qt5-quickcontrols2')
makedepends=('git' 'cmake')
provides=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/BradyBrenot/huestacean")
md5sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${_pkgname}"
    git submodule sync
    git submodule update --init --recursive

    mkdir -p build
    cd build
    cmake ..
    make all
}

package() {
    cd "${_pkgname}/build"

    # https://github.com/BradyBrenot/huestacean/issues/93
    # make DESTDIR="${pkgdir}" install

    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
