# Maintainer: Giuseppe <giuscri@gmail.com>

pkgname=gokey-git
pkgver=r15.05f83bb
pkgrel=1
pkgdesc="A simple vaultless password manager in Go"
arch=('x86_64')
url="https://github.com/cloudflare/gokey"
license=('BSD')
depends=('go')
options=('!strip' '!emptydirs')
_gourl=github.com/cloudflare/gokey/cmd/gokey

pkgver() {
  cd "$srcdir/src/$_gourl"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  GOPATH="$srcdir" go get -d -fix -v ${_gourl}
}

build() {
  GOPATH="$srcdir" go install -v -x ${_gourl}
}

check() {
  GOPATH="$GOPATH:$srcdir" go test -v -x ${_gourl}
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -p -m755 "$srcdir/bin/"* "$pkgdir/usr/bin"

  mkdir -p "$pkgdir/$GOPATH"
  cp -Rv --preserve=timestamps "$srcdir/"{src,pkg} "$pkgdir/$GOPATH"

  for f in LICENSE COPYING LICENSE.* COPYING.*; do
    if [ -e "$srcdir/src/$_gourl/$f" ]; then
      install -Dm644 "$srcdir/src/$_gourl/$f" \
        "$pkgdir/usr/share/licenses/$pkgname/$f"
    fi
  done
}

# vim:set ts=2 sw=2 et:
