#Maintainer: Dmytro Aleksandrov <alkersan@gmail.com>

pkgname=rpi-imager
pkgver=1.7.1
pkgrel=1
pkgdesc="Raspberry Pi Imaging Utility"
depends=('curl' 'libarchive' 'qt5-base' 'qt5-declarative' 'qt5-quickcontrols2' 'qt5-svg' 'qt5-tools')
optdepends=('dosfstools: SD card bootloader support')
makedepends=('gcc' 'make' 'cmake')
arch=('x86_64' 'aarch64')
url="https://github.com/raspberrypi/rpi-imager"
license=("Apache")

source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
  "remove_update_checking.patch"
)

sha256sums=('57c4b1d53a3c5f84fe9a653c07d9c5ea2d5941356c536d6d434d1ff6133b587d'
            '2b6350b28f2528e9dc572d56a6ad56b2d5263fbd4f55ce8f9da13d0984a1cf20')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch --strip=1 --input="$srcdir/remove_update_checking.patch"
}

build() {
  rm -rf build
  cmake -B build -S "${pkgname}-${pkgver}" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr'

  make -C build
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
