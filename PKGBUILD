# Maintainer: awh

pkgname=pup-git
_gitname="pup"
_gourl="github.com/ericchiang/pup"
pkgver=r97.b058f91
pkgrel=1
epoch=1
pkgdesc="Parsing HTML at the command line"
arch=('i686' 'x86_64')
url="https://github.com/EricChiang/pup"
license=('MIT')
provides=('pup')
conflicts=('pup')
makedepends=('git' 'go')
source=('git://github.com/EricChiang/pup.git')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	GOPATH="$srcdir" go get -fix -v -x ${_gourl}
}

check() {
	GOPATH="$GOPATH${GOPATH+:}$srcdir" go test -v -x ${_gourl}
}

package() {
	mkdir -p "$pkgdir/usr/bin"
	install -p -m755 "$srcdir/bin/"* "$pkgdir/usr/bin"

	# Package license (if available)
	for f in LICENSE COPYING LICENSE.* COPYING.*; do
		if [ -e "$srcdir/src/$_gourl/$f" ]; then
			install -Dm644 "$srcdir/src/$_gourl/$f" \
				"$pkgdir/usr/share/licenses/$_gitname/$f"
		fi
	done
}
