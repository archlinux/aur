# Maintainer: Michael Schubert <mschu.dev at gmail>
# Contributor: Mikkel Oscar Lyderik <mikkeloscar at gmail dot com>
pkgname=git-lfs
pkgver=1.4.4
pkgrel=1
pkgdesc="An open source Git extension for versioning large files"
arch=('i686' 'x86_64' 'armv7h')
url="https://${pkgname}.github.com"
license=('MIT')
makedepends=('go' 'ruby-ronn')
depends=('git')
install=${pkgname}.install
source=("https://github.com/github/$pkgname/archive/v$pkgver.tar.gz")
sha1sums=('68a201a0ca9dd69f65f18fa0801cf098b497dd5b')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  # setup local gopath
  mkdir -p "$srcdir"/src/github.com/github/
  ln -sf "$srcdir"/$pkgname-$pkgver "$srcdir"/src/github.com/github/$pkgname

  GOPATH="$srcdir" go get -v -d
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  GOPATH="$srcdir" go run script/*.go -cmd build

  # build man pages
  ronn docs/man/*.ronn
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 bin/$pkgname "$pkgdir"/usr/bin/$pkgname

  install -d "$pkgdir"/usr/share/man/man1
  install -Dm644 docs/man/*.1 "$pkgdir"/usr/share/man/man1
}
