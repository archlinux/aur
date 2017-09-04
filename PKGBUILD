# Maintainer: Pierre Neidhardt <ambrevar@gmail.com>

_pkgname=hsync
pkgname=$_pkgname
pkgver=1.3
pkgrel=4
pkgdesc="A filesystem hierarchy synchronizer"
arch=("i686" "x86_64")
url="http://ambrevar.bitbucket.io/hsync/"
license=("MIT")
makedepends=("go")
source=("$pkgname-$pkgver.tar.bz2::https://github.com/Ambrevar/$_pkgname/archive/v$pkgver.tar.gz")
sha1sums=('d0689132d001c9c4c2f8e20d6481f5133516aa17')
_gourl="github.com/ambrevar/$_pkgname"

prepare() {
	## Move source extracted folder to its proper location in the GOPATH.
	cd "$srcdir"
	rm -rfv "src/$_gourl"
	mkdir -p "src/github.com/ambrevar"
	mv "$_pkgname-$pkgver" "src/$_gourl"
}

build() {
	case "$CARCH" in
	x86_64) GOARCH=amd64 ;;
	i686) GOARCH=386 ;;
	esac

	GOPATH="$srcdir" go get -v -x -ldflags "-X main.version=$pkgver" "$_gourl"
}

check() {
	GOPATH="$srcdir" go test -v -x "$_gourl"
}

package() {
	cd "$srcdir"
	install -Dm755 "bin/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 "src/$_gourl/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
