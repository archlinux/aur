# Maintainer: James Willson <jsdoublel@gmail.com>
pkgname=nw
pkgver=0.2.4
pkgrel=1
pkgdesc="A TUI utility for selecting films to watch from Letterboxd"
arch=('x86_64' 'aarch64')
url="https://github.com/jsdoublel/nw"
license=('GPL-3.0-or-later')
depends=()
makedepends=('go>=1.25.4')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('0d6537ece6f7e44c14ffabd45f7201da821b70b95bf2968e4030d48c95cb986d')

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
