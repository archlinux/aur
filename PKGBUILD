# Maintainer: emersion <contact emersion fr>

_pkgname=matcha
pkgname=matcha-git
pkgver=0.1.0.r0.gb8269e1
pkgrel=1
pkgdesc="A read-only web interface for Git repositories"
arch=('x86_64' 'i686')
url="https://github.com/emersion/matcha"
license=('MIT')
makedepends=('go' 'npm')
options=('!strip' '!emptydirs')
source=('matcha::git+https://github.com/emersion/matcha')
md5sums=('SKIP')
_gourl=github.com/emersion/matcha

pkgver() {
  cd "$srcdir/matcha"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//'
}

build() {
  GOPATH="$srcdir" go get -ldflags "-X $_gourl.publicDir=/usr/share/webapps/$_pkgname" ${_gourl}/cmd/matcha
  (cd "$srcdir/src/$_gourl/public" && npm install)
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -p -m755 "$srcdir/bin/"* "$pkgdir/usr/bin"

  mkdir -p "$pkgdir/usr/share/webapps/$_pkgname"
  cp -R "$srcdir/src/$_gourl/public/"* "$pkgdir/usr/share/webapps/$_pkgname"

  install -Dm644 "$srcdir/src/$_gourl/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
