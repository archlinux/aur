# Maintainer: Thomas Gläßle <t_glaessle@gmx.de>
_pkgname=tty-server
_source=github.com/elisescu/tty-server
pkgname=tty-server-git
pkgver=2020_01_09..7c5547d
pkgrel=1
pkgdesc="Server side for tty-share"
arch=('any')
url="https://${_source}"
license=('GPL2')
depends=()
makedepends=('go-pie' 'dep') # 'npm'

provides=("$_pkgname")
source=("$_pkgname::git+git://${_source}")
md5sums=('SKIP')


pkgver() {
  cd "$srcdir/$_pkgname"
  git log -1 --format='%cd..%h' --date=short | tr - _
}

prepare() {
  export GOPATH="$srcdir/gopath"

  mkdir -p "$srcdir/gopath/src/${_source%/*}"
  ln -rTsf "$srcdir/$_pkgname" "$srcdir/gopath/src/${_source}"
  cd "$srcdir/gopath/src/${_source}"
  dep ensure
}

build() {
  export GOPATH="$srcdir/gopath"
  cd "$srcdir/gopath/src/${_source}"

  # Included in repo:
  # make assets_bundle.go

  go build \
    -trimpath \
    -ldflags "-X main.version=$(pkgver) --extldflags $LDFLAGS" \
    -o $_pkgname
}

package() {
  cd "$srcdir/gopath/src/${_source}"

  mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/share/licenses/$_pkgname"
  install -m755 tty-server "$pkgdir/usr/bin"
  install -m644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
