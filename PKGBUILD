#Maintainer: Dmytro Aleksandrov <alkersan@gmail.com>

pkgname=rpi-imager
pkgver=1.6.2
pkgrel=1
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

sha256sums=('32f7fcd732ed8b707e862f51311c846b13a9dfb805cc6d901c601e2e5c2ec2d7'
            '8569a55e3a98ea955dc95a7492e3e45db25c7e6a53660f8ba971b8fefb7b0e1e')

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
