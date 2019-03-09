# Maintainer: Felix Barz <skycoder42.de@gmx.de>
pkgname=keepass-transfer
pkgver=3.0.0
pkgrel=3
pkgdesc="A collection of tools to securely transfer passwords to your browser"
arch=('i686' 'x86_64')
url="https://github.com/Skycoder42/KeepassTransfer"
license=('BSD')
depends=('qt5-base' 'qt5-svg' 'qt5-mvvmwidgets' 'qt5-service>=2.0.0' 'keepassxc-client-library' 'keepassxc')
makedepends=('git' 'qt5-tools' 'pkgconfig' 'qpmx-qpmsource')
optdepends=("repkg: Automatically rebuild the package on dependency updates"
			"keepassxc: Import credentials from KeePassXC for easy password transfers")
_pkgfqn=$pkgname-$pkgver
source=("$_pkgfqn::git+https://github.com/Skycoder42/KeepassTransfer.git#tag=$pkgver"
		"qtservice.patch"
		"$pkgname.rule")
sha256sums=('SKIP'
            '3859a5e32b3dc273d11901126a8e7a428c081bc84fe9ea3c167a898c87f87cb0'
            '96c8f9d011469d30acef0b5009283747c0b339a013baf02d58d578b00585e153')

prepare() {
  cd "$_pkgfqn"
  git apply ../qtservice.patch
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
