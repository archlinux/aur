# Maintainer: Felix Barz <skycoder42.de@gmx.de>
pkgname=qt5-datasync
pkgver=3.0.1
pkgrel=3
pkgdesc="A simple offline-first synchronisation framework, to synchronize data of Qt applications between devices"
arch=('i686' 'x86_64')
url="https://github.com/Skycoder42/QtDataSync"
license=('BSD')
depends=('qt5-base' 'qt5-tools' 'qt5-jsonserializer>=2.1.0' 'qt5-backgroundprocess>=1.5.0' 'qt5-websockets')
makedepends=('git' 'qpm')
_pkgfqn=$pkgname-$pkgver
source=("$_pkgfqn::git+https://github.com/Skycoder42/QtDataSync.git#tag=$pkgver")
md5sums=('SKIP')

prepare() {
  mkdir -p build

  cd "$_pkgfqn/src/3rdparty"
  qpm install
}

build() {
  cd build

  qmake -r "../$_pkgfqn/"
  make
}

package() {
  cd build
  make INSTALL_ROOT="$pkgdir" install

  # Drop QMAKE_PRL_BUILD_DIR because reference the build dir
  find "$pkgdir/usr/lib" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;

  install -D -m644 "../$_pkgfqn/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
