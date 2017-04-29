# Maintainer: Michael Schubert <mschu.dev at gmail>
# Contributor: Mikkel Oscar Lyderik <mikkeloscar at gmail dot com>
pkgname=git-lfs
pkgver=2.1.0
pkgrel=1
pkgdesc="An open source Git extension for versioning large files"
arch=('i686' 'x86_64' 'armv7h')
url="https://${pkgname}.github.com"
license=('MIT')
makedepends=('go' 'ruby-ronn')
depends=('git')
install=${pkgname}.install
source=("https://github.com/github/$pkgname/archive/v$pkgver.tar.gz")
sha1sums=('e4abf79be0ffd30e0c8d3b5e5779a93d7e9808b8')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  GOPATH="$srcdir" go get -v -d

  # setup local gopath
  ln -sf "$srcdir"/$pkgname-$pkgver/tools/longpathos \
    "$srcdir"/src/github.com/git-lfs/git-lfs/tools/longpathos 
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
