_pkgname=gopacket
pkgname=gopacket-git
pkgver=20150922.702_63a65fa
pkgrel=1
pkgdesc="Provides packet processing capabilities for Go"
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('go' 'git')
_gourl=("github.com/google/gopacket")
GOPATH="/usr/lib/go"

pkgver() {
	cd "$srcdir/$_pkgname"
	local date=$(git log -1 --format="%cd" --date=short | sed s/-//g)
	local count=$(git rev-list --count HEAD)
	local commit=$(git rev-parse --short HEAD)
	echo "$date.${count}_$commit"
}

build() {
  GOPATH="$srcdir" go get -fix -v -x ${_gourl}
}

package() {
  mkdir -p "$pkgdir/$GOPATH"
  cp -Rv --preserve=timestamps "$srcdir/"{src,pkg} "$pkgdir/$GOPATH"

  # Package license (if available)
  for f in LICENSE COPYING LICENSE.* COPYING.*; do
    if [ -e "$srcdir/src/$_gourl/$f" ]; then
      install -Dm644 "$srcdir/src/$_gourl/$f" \
        "$pkgdir/usr/share/licenses/$_pkgname/$f"
    fi
  done
}
