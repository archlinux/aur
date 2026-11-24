# Maintainer: Aethar <elliott.ashby88@gmail.com>

pkgname=onon
pkgver=0.14.20
pkgrel=2
pkgdesc="A quiet reader for the keyboard, built on MuPDF and configured with Lua"
arch=('x86_64')
url="https://github.com/Aethar01/onon"
license=('AGPL-3.0-only')
depends=('sdl3' 'libmupdf' 'gtk3' 'glslang')
makedepends=('go' 'pkgconf')
conflicts=('onon-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('c999264ba5f4834466900fcefccead63d0cb54ccc96b7963d590251496fd8728')

prepare() {
	cd "$pkgname-$pkgver"
	export GOPATH="$srcdir/gopath"
	export GOFLAGS="-modcacherw"
	go mod download -x
}

build() {
	cd "$pkgname-$pkgver"
	export GOPATH="$srcdir/gopath"
	export CGO_CPPFLAGS="$CPPFLAGS"
	export CGO_CFLAGS="$CFLAGS"
	export CGO_CXXFLAGS="$CXXFLAGS"
	export CGO_LDFLAGS="$LDFLAGS"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	go build -ldflags "-linkmode=external -X onon/internal/config.Version=$pkgver -X onon/internal/config.InstallMethod=aur" -o onon .
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 onon "$pkgdir/usr/bin/onon"
	install -Dm644 onon.desktop "$pkgdir/usr/share/applications/onon.desktop"
	install -Dm644 assets/onon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/onon.svg"
	install -Dm644 assets/onon.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/onon.png"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
