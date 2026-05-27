# Maintainer: James Willson <jsdoublel@gmail.com>
pkgname=nw
pkgver=0.3.3
pkgrel=1
pkgdesc="A TUI utility for selecting films to watch from Letterboxd"
arch=('x86_64' 'aarch64')
url="https://github.com/jsdoublel/nw"
license=('GPL-3.0-or-later')
depends=()
makedepends=('go>=1.25.4')
source=( "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
	"$pkgname.desktop")
sha256sums=('1b7ae6d7b61f4386f0871492ea10d68f717000eaf9f392bcd4a5c59412c49731'
            'accc32248ec043a67b664a7869dac1b25dc0193e36ae59b87c54fc565668cad7')

prepare() {
	cd "$pkgname-$pkgver"
	GOPATH="$srcdir/gopath" GOFLAGS="-modcacherw" go mod download
}

build() {
	cd "$pkgname-$pkgver"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOPATH="$srcdir/gopath"
	export CGO_ENABLED=1
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	go build -ldflags="-linkmode=external -s -w -X github.com/jsdoublel/nw/internal/app.Version=v$pkgver" -o "$pkgname" .
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
