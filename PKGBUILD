# Maintainer: Jean Lucas <jean@4ray.co>
# Contributor: Arthur Țițeică / arthur dot titeica with gmail

_pkgname=morty
_gourl=github.com/asciimoo/morty

pkgname=morty-git
pkgver=0.2.0+r32+g74a0548
pkgrel=2
pkgdesc='Web content sanitizer/proxy (git)'
arch=(i686 x86_64)
url="https://$_gourl"
license=(AGPL3)
provides=(morty)
conflicts=(morty)
depends=(glibc)
makedepends=(git go)
source=(git+$url
        morty.service)
sha512sums=('SKIP'
            'b967d4aebbf869d5867c39ef50cc286c01b0c2ec7fdda4d4d92771a99847c85a3218cedd4bd55797d46ffa2f8a23e547a8326fb9a530214b544d1366c0232190')
_goroot='/usr/lib/go'

pkgver() {
  export GOROOT="$srcdir/build/go"
  export GOPATH="$srcdir/build"
  cd "$GOPATH/src/${_gourl}"
  git describe --tags | sed 's#v##;s#-#+#g;s#+#+r#'
}

prepare() {
  export GOROOT="$_goroot"

  msg2 'Prepare GO build enviroment'
  sudo rm -rf build
  mkdir -p build/go
  cd build/go

  for f in "$GOROOT/"*; do
    ln -s "$f"
  done

  rm pkg && mkdir pkg && cd pkg

  for f in "$GOROOT/pkg/"*; do
    ln -s "$f"
  done

  export GOROOT="$srcdir/build/go"
  export GOPATH="$srcdir/build"

  mkdir -p "$GOPATH/src/${_gourl%/$_pkgname}"
  mv "$srcdir/$_pkgname" "$GOPATH/src/${_gourl}"
}

build() {
  export GOROOT="$srcdir/build/go"
  export GOPATH="$srcdir/build"
  cd "$GOPATH/src/${_gourl}"
  go fix
  go build .
}

package() {
  install -Dm 644 morty.service -t "$pkgdir"/usr/lib/systemd/system

  cd "$GOPATH/src/${_gourl}" 

  install -D morty -t "$pkgdir"/usr/bin

  install -Dm 644 README.md -t "$pkgdir"/usr/share/doc/morty
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/morty
}
