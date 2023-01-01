# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=hilbish
pkgver=2.0.1
pkgrel=1
pkgdesc="The flower shell for Lua users"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/rosettea/hilbish"
license=('MIT')
depends=('lua-lunacolors' 'lua-succulent' 'lua-inspect')
makedepends=('go')
install="$pkgname.install"
options=('!emptydirs')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('9adb3ed5efd4f4c5719f152379a7fa081bfcb563f2edea3b90162a49f20b32e2')

prepare() {
	cd "Hilbish-$pkgver"
	go mod download
}

build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

	cd "Hilbish-$pkgver"
	go build -ldflags "-linkmode=external -X main.dataDir=/usr/share/hilbish"
}

check() {
	cd "Hilbish-$pkgver"
	go test ./...
}

package() {
	## do not use the taskfile, install everything manually
	cd "Hilbish-$pkgver"
	install -Dv "$pkgname" -t "$pkgdir/usr/bin/"
	install -dv "$pkgdir/usr/share/hilbish/"
	cp -av libs docs emmyLuaDocs nature .hilbishrc.lua "$pkgdir/usr/share/hilbish/"
	install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
