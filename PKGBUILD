# Maintainer: James Willson <jsdoublel@gmail.com>
pkgname=nw
pkgver=0.2.6
pkgrel=1
pkgdesc="A TUI utility for selecting films to watch from Letterboxd"
arch=('x86_64' 'aarch64')
url="https://github.com/jsdoublel/nw"
license=('GPL-3.0-or-later')
depends=()
makedepends=('go>=1.25.4')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('5081b4ba1d9dffcb766d7d7a56b0d10b3837466a7a2708e2696e247fce25e8be')

prepare() {
	cd "$pkgname-$pkgver"
	GOPATH="$srcdir/gopath" GOFLAGS="-modcacherw" go mod download
}

build() {
	cd "$pkgname-$pkgver"
	CGO_CPPFLAGS="${CPPFLAGS}" CGO_CFLAGS="${CFLAGS}" \
		CGO_CXXFLAGS="${CXXFLAGS}" CGO_LDFLAGS="${LDFLAGS}" \
		GOPATH="$srcdir/gopath" CGO_ENABLED=1 \
		GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw" \
		go build -ldflags="-linkmode=external -s -w" -o "$pkgname" .
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
