# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=coyim
pkgver=0.3.8
pkgrel=2
pkgdesc="A safe and secure chat client"
arch=('i686' 'x86_64')
depends=('cairo' 'glib2' 'gtk3' 'pango')
makedepends=('git' 'go' 'pkg-config')
url="https://coy.im"
license=('GPL3')
options=('!strip' '!emptydirs')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/twstrike/coyim/tar.gz/v$pkgver)
sha256sums=('30a86c6c83a8b2d8e0e7966a41fd20e8dcdf3a27ff819d9e363771f867f804ef')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Building...'
  export GTK_VERSION=$(pkg-config --modversion gtk+-3.0 | tr . _ | cut -d '_' -f 1-2)
  export GOPATH="$srcdir"
  export TMPDIR=/tmp
  go get -v -u -tags "gtk_${GTK_VERSION}" github.com/gotk3/gotk3/...
  go get -v -u github.com/twstrike/coyim/...
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing license...'
  install -Dm 644 LICENSE* -t "$pkgdir/usr/share/licenses/$pkgname"

  msg2 'Installing documentation...'
  install -Dm 644 *.md -t "$pkgdir/usr/share/doc/$pkgname"

  msg2 'Installing...'
  install -Dm 755 "$srcdir/bin/coyim" -t "$pkgdir/usr/bin"
}
