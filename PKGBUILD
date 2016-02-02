# Maintainer: Andreas B. Wagner <AndreasBWagner@pointfree.net>
pkgname=go-fuse
pkgver=1264.8c85ded
pkgrel=6
pkgdesc="native bindings for the FUSE kernel module"
arch=('i686' 'x86_64')
url="https://github.com/hanwen/go-fuse"
license=('BSD')
depends=('go' 'fuse')
makedepends=('git')
options=('!strip' '!emptydirs')
_gourl=github.com/hanwen/$pkgname

pkgver() {
  cd "$srcdir/src/$_gourl"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "$srcdir"
  GOPATH="$(pwd)" go get -d -fix -v -x ${_gourl}/tree/master/...
}

#check() {
#  cd "$srcdir/src"
#  GOPATH="$GOPATH:$srcdir" go test -v -x ${_gourl}/...
#}

package() {
  cd "$srcdir"
  export GOPATH="usr/lib/go/site/"
  mkdir -p $srcdir/{pkg,src}
  mkdir -p "$pkgdir/$GOPATH"
  cp -Rv --preserve=timestamps "$srcdir"/{src,pkg} "$pkgdir/$GOPATH"
  find "$pkgdir" -depth -type d -name .git -exec rm -r {} \;

  for f in LICENSE COPYING; do
    if [ -e "$srcdir/src/$_gourl/$f" ]; then
      install --preserve-timestamps -Dm644 "$srcdir/src/$_gourl/$f" "$pkgdir/usr/share/licenses/$pkgname/$f"
    fi
  done
}

# vim:set ts=2 sw=2 et:
