# Maintainer: Adrian <adrian@mxlinux.org>

pkgname=mx-tools
pkgver=26.11
pkgrel=1
pkgdesc="MX Tools - Dashboard application launcher for various MX tools"
arch=('x86_64')
url="https://mxlinux.org"
license=('GPL-3.0-or-later')
depends=('qt6-base' 'qt6-declarative' 'qt6-svg')
makedepends=('cmake' 'ninja' 'qt6-declarative' 'qt6-tools')
source=("https://github.com/MX-Linux/mx-tools/archive/refs/tags/26.11.tar.gz")
sha256sums=('0632851a564b84211c0fd786310a44c10236bc7ade3b31bafc0072a1a650b663')

_srcdir="${pkgname}-${pkgver#v}"

build() {
    cd "${srcdir}/${_srcdir}"

    cmake -G Ninja \
        -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DMX_TOOLS_INSTALL_MENU=ON \
        -DPROJECT_VERSION_OVERRIDE="${pkgver}"

    cmake --build build --parallel
}

package() {
    cd "${srcdir}/${_srcdir}"

    # CMake installs the application's files; only Arch's own locations are added here.
    DESTDIR="${pkgdir}" cmake --install build
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    gzip -c debian/changelog > "${pkgdir}/usr/share/doc/${pkgname}/changelog.gz"
}
