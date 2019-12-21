# Maintainer: Bastien Traverse <firstname at lastname dot email>

pkgname=primitive
pkgver=r150.673f57e
pkgrel=1
pkgdesc='Reproducing images with geometric primitives'
arch=('i686' 'x86_64')
url="https://github.com/fogleman/primitive"
license=('MIT')
makedepends=('go' 'git')
provides=("$pkgname")
conflicts=("$pkgname")
source=("$pkgname::git+$url.git")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
# Support both current absence of tags and possible future addition
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
	unset GOBIN
	GOPATH="$srcdir" go get -v -gcflags "-trimpath $GOPATH/src" \
	  "${url#https://}"
}

package() {
	install -D "$srcdir/bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "$srcdir/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -d "$pkgdir/usr/share/$pkgname"
	cp -r "$srcdir/$pkgname"/{bot,examples,scripts} "$pkgdir/usr/share/$pkgname"
	find "$pkgdir/usr/share/$pkgname" -type f -name *.py -exec chmod +x {} \;
}

