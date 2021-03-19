#Maintainer: Dmytro Aleksandrov <alkersan@gmail.com>

pkgname=rpi-imager
pkgver=1.6
pkgrel=2
pkgdesc="Raspberry Pi Imaging Utility"
depends=('curl' 'libarchive' 'qt5-base' 'qt5-declarative' 'qt5-quickcontrols2' 'qt5-svg' 'qt5-tools')
makedepends=('gcc' 'make' 'cmake')
arch=('x86_64' 'aarch64')
url="https://github.com/raspberrypi/rpi-imager"
license=("Apache")

source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
  "remove_update_checking.patch"
)

sha256sums=('811f9c261f82f75eefb9129570c47ff6653c1e9af08d9ed0b877261b4d184685'
            'eaffe8e2f1a958575d746b06460f39157427e894fb13bd78264a0d443cdeaf2f')

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
