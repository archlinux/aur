pkgname=mkcert-git
pkgver=r22.073ee25
pkgrel=1
pkgdesc="A simple zero-config tool to make locally-trusted development certificates with any names you'd like."
arch=('x86_64' 'i686')
source=("git://github.com/FiloSottile/${pkgname%-git}.git")
url="https://github.com/FiloSottile/mkcert"
license=('BSD')
depends=('go')
makedepends=('git')
options=('!strip' '!emptydirs')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
_gourl=github.com/FiloSottile/mkcert
sha1sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
  GOPATH="$srcdir" go get -fix -v -x ${_gourl}
}

check() {
  GOPATH="$GOPATH:$srcdir" go test -v -x ${_gourl}
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -p -m755 "$srcdir/bin/"* "$pkgdir/usr/bin"

  #mkdir -p "$pkgdir/$GOPATH"
  #cp -Rv --preserve=timestamps "$srcdir/"src "$pkgdir/$GOPATH"
  #cp -Rv --preserve=timestamps "pkg/" "$pkgdir/$GOPATH"

  # Package license (if available)
  for f in LICENSE COPYING LICENSE.* COPYING.*; do
    if [ -e "$srcdir/src/$_gourl/$f" ]; then
      install -Dm644 "$srcdir/src/$_gourl/$f" \
        "$pkgdir/usr/share/licenses/$pkgname/$f"
    fi
  done
}
