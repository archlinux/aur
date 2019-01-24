# Maintainer: Felix Barz <skycoder42.de@gmx.de>
pkgname=repkg
pkgver=1.4.0
pkgrel=1
pkgdesc="A tool to manage rebuilding of AUR packages based on their dependencies"
arch=('i686' 'x86_64')
url="https://github.com/Skycoder42/$pkgname"
license=('BSD')
depends=('qt5-base' 'pacman' )
makedepends=('qt5-tools' 'git' 'qdep')
optdepends=("yay: The recommended frontend for the AUR to use with repkg")
source=("$pkgname-$pkgver::git+https://github.com/Skycoder42/$pkgname.git#tag=$pkgver"
		"$pkgname.rule")
sha256sums=('SKIP'
            '1b52eef5216017cfb4b399df1775950db544550a68a542053efe00eb8ef34911')

prepare() {
  mkdir -p build
}

build() {
  cd build

  qmake "../$pkgname-$pkgver/"
  make
}

package() {
  cd build
  make INSTALL_ROOT="$pkgdir" install

  cd "../$pkgname-$pkgver"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 "../${pkgname}.rule" "$pkgdir/etc/repkg/rules/system/${pkgname}.rule"
}
