# Maintainer: Pierre Neidhardt <ambrevar@gmail.com>

_pkgname=demlo
pkgname=$_pkgname-git
pkgver=2018.01.29.g8a86514
pkgrel=1
pkgdesc="A dynamic and extensible music library organizer"
arch=("i686" "x86_64")
url="https://github.com/Ambrevar/demlo/"
license=("MIT")
depends=("ffmpeg" "lua" "taglib")
makedepends=("go" "git")
optdepends=("chromaprint: Internet tagging")
source=("git+https://github.com/Ambrevar/$_pkgname.git")
md5sums=('SKIP')
_gourl="github.com/ambrevar/$_pkgname"

pkgver() {
	cd "$srcdir"
	git log -1 --format="%cd.g%h" --date=short | sed 's/-/./g'
}

prepare() {
	## Move source extracted folder to its proper location in the GOPATH.
	cd "$srcdir"
	rm -rfv "src/$_gourl"
	mkdir -p "src/github.com/ambrevar"
	cp -a "$_pkgname" "src/$_gourl"
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

	install -Dm644 "src/$_gourl/config.lua" "$pkgdir/usr/share/$_pkgname/config.lua"

	cd "src/$_gourl"
	for i in scripts/*; do
		install -Dm644 "$i" "$pkgdir/usr/share/$_pkgname/$i"
	done
	for i in actions/*; do
		install -Dm644 "$i" "$pkgdir/usr/share/$_pkgname/$i"
	done

	install -Dm644 completion/$_pkgname.fish "$pkgdir/usr/share/fish/vendor_completions.d/$_pkgname.fish"
}
