# Maintainer: Felix Barz <skycoder42.de@gmx.de>
pkgname=keepassxc-client-library
pkgver=1.0.0
pkgrel=1
pkgdesc="A C++ library to access the browser-plugin-API of KeePassXC to retrieve or create entries"
arch=('i686' 'x86_64')
url="https://github.com/Skycoder42/keepassxc-client-library"
license=('BSD')
depends=('qt5-base' 'libsodium')
makedepends=('git' 'qt5-tools' 'pkgconfig')
optdepends=("repkg: Automatically rebuild the package on dependency updates")
_pkgfqn=$pkgname-$pkgver
source=("$_pkgfqn::git+https://github.com/Skycoder42/keepassxc-client-library.git#tag=$pkgver"
		'clientflags.patch'
		"$pkgname.rule")
sha256sums=('SKIP'
            '739d2c8bb3b6637369ebf42a10bdf846f15c6432453b844f9761d3009d00e01f'
            '5c26037370478a522a91354fd1f5504790ec9a1bf46523c433ca1ea4348b4a6f')

prepare() {
  cd "$_pkgfqn"
  git apply ../clientflags.patch
  git submodule update --init --recursive
  cd ..
  mkdir -p build
}

build() {
  cd build

  qmake 'CONFIG+=install_demo' 'PREFIX=/usr' "../$_pkgfqn/"
  make
}

package() {
  cd build
  make INSTALL_ROOT="$pkgdir" install

  install -D -m644 "../$_pkgfqn/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 "../${pkgname}.rule" "$pkgdir/etc/repkg/rules/system/${pkgname}.rule"
}
