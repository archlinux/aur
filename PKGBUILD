# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=treefrog-framework
pkgver=1.23.0
pkgrel=1
pkgdesc="High-speed C++ MVC Framework for Web Application"
arch=('x86_64')
url="https://github.com/treefrogframework/treefrog-framework"
license=('BSD')
depends=('qt5-declarative' 'libmongoc')
makedepends=('qt5-tools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/treefrogframework/treefrog-framework/archive/v$pkgver.tar.gz")
sha512sums=('21149ff6226fde4463a016f544bf50a2af3e897aa843057d4611d752bf366a8ba5aad1e7f3cb2900fe597aebd95019a319e0b4c7f806111dca20fbb189d4644e')

prepare() {
  cd $pkgname-$pkgver
  rm -r 3rdparty

  sed -i 's|LIBS += ../3rdparty/mongo-c-driver/libmongoc.a|LIBS += -lmongoc-1.0\nINCLUDEPATH += /usr/include/libbson-1.0 /usr/include/libmongoc-1.0|' src/corelib.pro
  sed -i 's|exit $RET||' configure
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  
  cd src
  make
}

package() {
  cd $pkgname-$pkgver/src
  make INSTALL_ROOT="$pkgdir" install

  install -Dm644 ../copyright "$pkgdir"/usr/share/licenses/$pkgname/copyright
}
