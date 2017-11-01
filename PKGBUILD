# Maintainer: Michael Schubert <mschu.dev at gmail>
# Contributor: Mikkel Oscar Lyderik <mikkeloscar at gmail dot com>
pkgname=git-lfs
pkgver=2.3.4
pkgrel=1
pkgdesc="An open source Git extension for versioning large files"
url="https://git-lfs.github.com/"
arch=('i686' 'x86_64' 'armv7h')
license=('MIT')
makedepends=('go' 'ruby-ronn')
depends=('git>=1.8.5')
install=${pkgname}.install
source=($pkgname-$pkgver.tar.gz::https://github.com/github/$pkgname/archive/v$pkgver.tar.gz)
sha1sums=('145d49542e9dfdec91a2bb0c52c037c67551a447')

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
