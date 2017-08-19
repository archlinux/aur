# Maintainer: Felix Barz <skycoder42.de@gmx.de>
pkgname=qt5-datasync
pkgver=3.0.2
pkgrel=2
pkgdesc="A simple offline-first synchronisation framework, to synchronize data of Qt applications between devices"
arch=('i686' 'x86_64')
url="https://github.com/Skycoder42/QtDataSync"
license=('BSD')
depends=('qt5-base' 'qt5-jsonserializer>=2.1.0' 'qt5-backgroundprocess>=1.5.0' 'qt5-websockets')
makedepends=('qt5-tools' 'git' 'qpm')
optdepends=("repkg: Automatically rebuild the package on dependency updates")
_pkgfqn=$pkgname-$pkgver
source=("$_pkgfqn::git+https://github.com/Skycoder42/QtDataSync.git#tag=$pkgver"
		'qt5-datasync.rule')
sha256sums=('SKIP'
            '9bfb38bb6338775f16514f5958c4aef3f55a4132253b0ae1a6ac1ace398a99c4')

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
  install -D -m644 "../${pkgname}.rule" "$pkgdir/etc/repkg/rules/${pkgname}.rule"
}
