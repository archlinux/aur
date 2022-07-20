# Maintainer: Cody Schafer <aur@codyps.com>
# Maintainer: Jake <aur@ja-ke.tech>
# Contributor: Thomas Krug <t.krug@elektronenpumpe.de>

# epoch 0: up to 1.11
# epoch 1: 1.2.0
epoch=1
pkgname=dsview
pkgver=1.2.0
pkgrel=1
pkgdesc="Client software that supports the DreamSourceLab logic analyzer"
arch=('i686' 'x86_64')
url="http://www.dreamsourcelab.com/"
license=('GPL3')
depends=('hicolor-icon-theme' 'qt5-base' 'fftw' 'python')
makedepends=('cmake' 'ninja' 'boost')

source=(
  "DSView-$pkgver.tar.gz::https://github.com/DreamSourceLab/DSView/archive/v${pkgver}.tar.gz"
)
sha384sums=('076ba3d9cdf5d598ca8a4ad75194f2b9a30c62ac3591df0cbeb9c33c32d380cdf5e9deb3cf644b129d66f3b46b26a530')

prepare() {
  sed -i 's#MODE="0666"#TAG+="uaccess"#' \
    "DSView-${pkgver}/DSView/DreamSourceLab.rules"
}

build() {
    cmake -B build -S "DSView-${pkgver}" \
        -GNinja \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build

    ln -s "DSView" "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:
