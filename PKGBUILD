# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=libcutefish
pkgver=0.7
pkgrel=2
pkgdesc="System library for Cutefish applications"
arch=('x86_64')
url="https://github.com/cutefishos/libcutefish"
license=('GPL')
depends=('bluez-qt' 'kscreen' 'modemmanager-qt' 'networkmanager-qt' 'qt5-quickcontrols2'
         # via dbus:
         'accountsservice')
makedepends=('extra-cmake-modules' 'ninja' 'qt5-tools')
source=("https://github.com/cutefishos/libcutefish/archive/$pkgver/$pkgname-$pkgver.tar.gz"
         libkscreen-5.27.patch)
sha512sums=('a6a83f10f7e3309ce1cbf4cb607328cb7448364ae66af1f36e8dd41ae1682a70fd9dccf18b84f205e7445d27a7b81e9d14d5f5eae383cc20fdbb81e7ee08fae6'
            '1a197f3b04b51162468b3882bd14af5962766c578c26a16ff31467f5479f1102094c20c47ce7c57c93644ad36454ea6012b16ac8ccef74c2b45ed3dc52f64597')

prepare() {
# Fix build with libkscreen 5.27
  sed -e 's|CMAKE_CXX_STANDARD 14|CMAKE_CXX_STANDARD 17|' -i $pkgname-$pkgver/CMakeLists.txt
  patch -d $pkgname-$pkgver -p1 < libkscreen-5.27.patch
}

build() {
  cd $pkgname-$pkgver

  cmake -GNinja -DCMAKE_INSTALL_PREFIX=/usr .
  ninja
}

package() {
  cd $pkgname-$pkgver
  DESTDIR="$pkgdir" ninja install
}
