# Maintainer: John Ramsden <johnramsden [at] riseup [dot] net>

pkgname=zectl-git
_pkgname=${pkgname%-git}
pkgver=r114.45f9dc4
pkgrel=1
pkgdesc="ZFS Boot Environment manager"
url="http://github.com/johnramsden/${_pkgname}"
arch=('any')
license=('MIT')
depends=('zfs')
makedepends=('make' 'cmake')
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/johnramsden/${_pkgname}#branch=master")
sha256sums=(SKIP)

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}"
    mkdir build && cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DPLUGINS_DIRECTORY=/usr/share/zectl/libze_plugin
    make
}

package() {
    cd "${srcdir}/${_pkgname}/build"
    make DESTDIR="${pkgdir}" install
    install -Dm644 "${srcdir}/${_pkgname}/docs/zectl.8" "${pkgdir}/usr/share/man/man8/zectl.8"
    install -Dm644 "${srcdir}/${_pkgname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
}
