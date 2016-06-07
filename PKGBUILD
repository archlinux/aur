# Maintainer: Pierre Neidhardt <ambrevar@gmail.com>

_pkgname=demlo
pkgname=$_pkgname
pkgver=3.0
pkgrel=1
pkgdesc="A dynamic and extensible music library organizer"
arch=("i686" "x86_64")
url="http://ambrevar.bitbucket.org/$_pkgname/"
license=("MIT")
depends=("ffmpeg" "lua51" "taglib")
makedepends=("go")
optdepends=("chromaprint: Internet tagging")
source=("$_pkgname-$pkgver.tar.bz2::https://bitbucket.org/ambrevar/$_pkgname/get/v$pkgver.tar.bz2")
md5sums=("52fcaa90c8ff3c7b635c84f3f1fc4d77")
_gourl="bitbucket.org/ambrevar/$_pkgname"

prepare() {
	## Move source extracted folder to its proper location in the GOPATH.
	cd "$srcdir"
	rm -rfv "src/$_gourl"
	mkdir -p "src/bitbucket.org/ambrevar"
	mv "ambrevar-$_pkgname-b1d0003d6506" "src/$_gourl"
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

	install -Dm644 "src/$_gourl/${_pkgname}rc" "$pkgdir/usr/share/$_pkgname/${_pkgname}rc"

	cd "src/$_gourl"
	for i in scripts/*; do
		install -Dm644 "$i" "$pkgdir/usr/share/$_pkgname/$i"
	done
}
