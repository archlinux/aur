# Maintainer: Pierre Neidhardt <ambrevar@gmail.com>

pkgname=demlo
pkgver=3.6.3
pkgrel=1
pkgdesc="A dynamic and extensible music library organizer"
arch=("i686" "x86_64")
url="http://ambrevar.bitbucket.io/demlo/"
license=("MIT")
depends=("ffmpeg" "lua" "taglib")
makedepends=("go" "git")
optdepends=("chromaprint: Internet tagging")
source=("$pkgname-$pkgver.tar.gz::https://github.com/ambrevar/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('40c7b936b0cf036a0c12ba46807631bf')
_gourl="github.com/ambrevar/$pkgname"

prepare() {
	## Move source extracted folder to its proper location in the GOPATH.
	cd "$srcdir"
	rm -rfv "src/$_gourl"
	mkdir -p "src/github.com/ambrevar"
	mv "$pkgname-$pkgver" "src/$_gourl"
}

build() {
	case "$CARCH" in
	x86_64) GOARCH=amd64 ;;
	i686) GOARCH=386 ;;
	esac

	export GOPATH="$srcdir"
	go get -v -x -d github.com/aarzilli/golua/lua
	cd "$srcdir"/src/github.com/aarzilli/golua/lua
	git checkout lua5.3
	go install -v -x -tags llua
	go get -v -x -ldflags "-X main.version=$pkgver" "$_gourl"
}

check() {
	GOPATH="$srcdir" go test -v -x "$_gourl"
}

package() {
	cd "$srcdir"
	install -Dm755 "bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "src/$_gourl/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	install -Dm644 "src/$_gourl/${pkgname}rc" "$pkgdir/usr/share/$pkgname/${pkgname}rc"

	cd "src/$_gourl"
	for i in scripts/*; do
		install -Dm644 "$i" "$pkgdir/usr/share/$pkgname/$i"
	done
	for i in actions/*; do
		install -Dm644 "$i" "$pkgdir/usr/share/$pkgname/$i"
	done

	install -Dm644 completion/demlo.fish "$pkgdir/usr/share/fish/vendor_completions.d/demlo.fish"
}
