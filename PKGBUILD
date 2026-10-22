# Maintainer: Aethar <elliott.ashby88@gmail.com>

pkgname=onon-git
_pkgname=onon
pkgver=0.9.4.r0.g49e499b
pkgrel=2
pkgdesc="A quiet reader for the keyboard, built on MuPDF and configured with Lua"
arch=('x86_64')
url="https://github.com/Aethar01/onon"
license=('AGPL-3.0-only')
depends=('sdl3' 'libmupdf' 'gtk3')
makedepends=('go' 'git' 'pkgconf')
provides=("$_pkgname")
conflicts=("$_pkgname")
replaces=('gopdf-git')
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$_pkgname"
	export GOPATH="$srcdir/gopath"
	export GOFLAGS="-modcacherw"
	go mod download -x
}

build() {
	cd "$_pkgname"
	export GOPATH="$srcdir/gopath"
	export CGO_CPPFLAGS="$CPPFLAGS"
	export CGO_CFLAGS="$CFLAGS"
	export CGO_CXXFLAGS="$CXXFLAGS"
	export CGO_LDFLAGS="$LDFLAGS"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	go build -ldflags "-linkmode=external -X onon/internal/config.Version=$pkgver" -o onon .
}

package() {
	cd "$_pkgname"
	install -Dm755 onon "$pkgdir/usr/bin/onon"
	install -Dm644 onon.desktop "$pkgdir/usr/share/applications/onon.desktop"
	install -Dm644 assets/onon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/onon.svg"
	install -Dm644 assets/onon.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/onon.png"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
