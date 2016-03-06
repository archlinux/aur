# Maintainer: Michael Schubert <mschu.dev at gmail>
# Contributor: Mikkel Oscar Lyderik <mikkeloscar at gmail dot com>
pkgname=git-lfs
pkgver=1.1.2
pkgrel=1
pkgdesc="An open source Git extension for versioning large files"
arch=('i686' 'x86_64')
url="https://${pkgname}.github.com"
license=('MIT')
makedepends=('go' 'ruby-ronn')
depends=('git')
install=${pkgname}.install
source=("https://github.com/github/$pkgname/archive/v$pkgver.tar.gz")
sha1sums=('24c90274f7287949ada49fd95e8234ec5a111c83')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  # setup local gopath
  mkdir -p "$srcdir"/src/github.com/github/
  ln -s "$srcdir"/$pkgname-$pkgver "$srcdir"/src/github.com/github/$pkgname

  GO15VENDOREXPERIMENT=0 GOPATH="$srcdir" go get -v -d
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  GO15VENDOREXPERIMENT=0 GOPATH="$srcdir" go run script/*.go -cmd build

  # build man pages
  ronn docs/man/*.ronn
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 bin/$pkgname "$pkgdir"/usr/bin/$pkgname

  install -d "$pkgdir"/usr/share/man/man1
  install -Dm644 docs/man/*.1 "$pkgdir"/usr/share/man/man1
}

# vim:set ts=2 sw=2 et:
