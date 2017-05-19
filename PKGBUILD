# Maintainer: Pierre Neidhardt <ambrevar@gmail.com>

_pkgname=demlo
pkgname=$_pkgname
pkgver=3.6.1
pkgrel=2
pkgdesc="A dynamic and extensible music library organizer"
arch=("i686" "x86_64")
url="http://ambrevar.bitbucket.io/demlo/"
license=("MIT")
depends=("ffmpeg" "lua" "taglib")
makedepends=("go" "git")
optdepends=("chromaprint: Internet tagging")
source=("$_pkgname-$pkgver.tar.gz::https://bitbucket.org/ambrevar/$_pkgname/get/v$pkgver.tar.gz")
md5sums=('f896145d1e864a6f1213cc9fdc0bc112')
_gourl="bitbucket.org/ambrevar/$_pkgname"

prepare() {
	## Move source extracted folder to its proper location in the GOPATH.
	cd "$srcdir"
	rm -rfv "src/$_gourl"
	mkdir -p "src/bitbucket.org/ambrevar"
	mv "ambrevar-$_pkgname-43ff65e2c498" "src/$_gourl"
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
	install -Dm755 "bin/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 "src/$_gourl/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

	install -Dm644 "src/$_gourl/${_pkgname}rc" "$pkgdir/usr/share/$_pkgname/${_pkgname}rc"

	cd "src/$_gourl"
	for i in scripts/*; do
		install -Dm644 "$i" "$pkgdir/usr/share/$_pkgname/$i"
	done
	for i in actions/*; do
		install -Dm644 "$i" "$pkgdir/usr/share/$_pkgname/$i"
	done

	install -Dm644 completion/demlo.fish "$pkgdir/usr/share/fish/vendor_completions.d/demlo.fish"
}
