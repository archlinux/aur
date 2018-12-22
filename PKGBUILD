# Maintainer: Felix Barz <skycoder42.de@gmx.de>
pkgname=keepass-transfer
pkgver=3.0.0
pkgrel=1
pkgdesc="A collection of tools to securely transfer passwords to your browser"
arch=('i686' 'x86_64')
url="https://github.com/Skycoder42/KeepassTransfer"
license=('BSD')
depends=('qt5-base' 'qt5-svg' 'qt5-mvvmwidgets' 'qt5-service' 'keepassxc-client-library' 'keepassxc')
makedepends=('git' 'qt5-tools' 'pkgconfig' 'qpmx-qpmsource')
optdepends=("repkg: Automatically rebuild the package on dependency updates"
			"keepassxc: Import credentials from KeePassXC for easy password transfers")
_pkgfqn=$pkgname-$pkgver
source=("$_pkgfqn::git+https://github.com/Skycoder42/KeepassTransfer.git#tag=$pkgver"
		"$pkgname.rule")
sha256sums=('SKIP'
            '1b8b79d7dea81de3866da764c67e12b80ffe66064acdcbcf53b9f2fac55c2e21')

prepare() {
  cd "$_pkgfqn"
  git submodule update --init --recursive
  cd ..
  mkdir -p build
}

build() {
  cd build

  qmake 'CONFIG+=no_webapp' \
		'CONFIG+=no_quick' \
		'CONFIG+=no_auto_lupdate' \
		'PREFIX=/usr' \
		"../$_pkgfqn/"
  make
  make lrelease
}

package() {
  cd build
  make INSTALL_ROOT="$pkgdir" install

  install -D -m644 "../$_pkgfqn/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 "../${pkgname}.rule" "$pkgdir/etc/repkg/rules/system/${pkgname}.rule"
}
