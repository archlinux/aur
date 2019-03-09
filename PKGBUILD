# Maintainer: Felix Barz <skycoder42.de@gmx.de>
pkgname=conflip
pkgver=2.1.2
pkgrel=2
pkgdesc="A tool to synchronize settings/configurations across multiple machines"
arch=('i686' 'x86_64')
url="https://github.com/Skycoder42/Conflip"
license=('BSD')
depends=('qt5-base' 'qt5-jsonserializer' 'qt5-svg' 'qt5-service>=2.0.0' 'qt5-mvvmcore')
makedepends=('qt5-tools' 'git' 'qpmx-qpmsource' 'dconf')
optdepends=("dconf: Adds support for synchronizing DConf based settings"
			"repkg: Automatically rebuild the package on dependency updates")
_pkgfqn=$pkgname-$pkgver
source=("$_pkgfqn::git+https://github.com/Skycoder42/Conflip.git#tag=$pkgver"
		"qtservice.patch"
		"$pkgname.rule")
sha256sums=('SKIP'
            '8fb8bd09d87bcf6419a98f7cd6718a23bc3de86440bed84a67d8deaaf233a04c'
            '0f7a68d179bf5e1c6817a2be8705f0521db4856af8eabdb25707a2e612f097a6')

prepare() {
  mkdir -p build

  cd "$_pkgfqn"
  git apply ../qtservice.patch
  echo "INSTALL_HEADERS = /usr/include" > install.pri
}

build() {
  cd build

  qmake "CONFIG+=no_auto_lupdate" "../$_pkgfqn/"
  make qmake_all
  make
  make lrelease
}

package() {
  cd build
  make INSTALL_ROOT="$pkgdir" install

  # license
  cd "../$_pkgfqn"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 "../${pkgname}.rule" "$pkgdir/etc/repkg/rules/system/${pkgname}.rule"
}
