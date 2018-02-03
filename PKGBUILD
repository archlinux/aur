# Maintainer: Felix Barz <skycoder42.de@gmx.de>
pkgname=qt5-datasync-legacy
pkgver=3.1.0
pkgrel=2
pkgdesc="A simple offline-first synchronisation framework, to synchronize data of Qt applications between devices"
arch=('i686' 'x86_64')
url="https://github.com/Skycoder42/QtDataSync"
license=('BSD')
depends=('qt5-base' 'qt5-jsonserializer>=2.1.0' 'qt5-backgroundprocess>=1.5.0' 'qt5-websockets' 'qt5-datasync>=4.0.0')
makedepends=('qt5-tools' 'git' 'qpm')
optdepends=("repkg: Automatically rebuild the package on dependency updates")
_pkgfqn=$pkgname-$pkgver
source=("$_pkgfqn::git+https://github.com/Skycoder42/QtDataSync.git#tag=$pkgver"
		"${pkgname}.rule")
sha256sums=('SKIP'
            '9bfb38bb6338775f16514f5958c4aef3f55a4132253b0ae1a6ac1ace398a99c4')

prepare() {
  mkdir -p build

  cd "$_pkgfqn/src/3rdparty"
  qpm install
}

build() {
  cd build

  qmake "../$_pkgfqn/"
  make qmake_all
  make
}

package() {
  cd build

  make INSTALL_ROOT="$pkgdir" install
  rm -rf "$pkgdir/usr/include"
  rm -rf "$pkgdir/usr/lib/cmake"
  rm -rf "$pkgdir/usr/lib/pkgconfig"
  rm -rf "$pkgdir/usr/lib/qt"
  rm -rf "$pkgdir/usr/lib/libQt5DataSync.prl"
  rm -rf "$pkgdir/usr/lib/libQt5DataSync.so"
  rm -rf "$pkgdir/usr/share/doc"
  mv "$pkgdir/usr/bin/qdatasyncserver" "$pkgdir/usr/bin/qdatasyncserver-legacy"

  install -D -m644 "../$_pkgfqn/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 "../${pkgname}.rule" "$pkgdir/etc/repkg/rules/${pkgname}.rule"
}
