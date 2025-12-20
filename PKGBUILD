# Maintainer: Simon Legner <Simon.Legner@gmail.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=aur-out-of-date
pkgver=3.2.0
pkgrel=2
pkgdesc='Determines out-of-date AUR packages'
arch=(x86_64 i686)
url="https://github.com/simon04/$pkgname"
license=(GPL-3.0-only)
makedepends=(go)
_archive="$pkgname-$pkgver"
source=("https://github.com/simon04/$pkgname/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('d4d3f95cfcf3e9de0357ccb5c99524bb0f3b508cdcf5a42baa058305e0a8f4a8')

prepare() {
	cd "$_archive"
	go mod download
}

build() {
	cd "$_archive"
	go build \
		-trimpath \
		-buildmode=pie \
		-mod=readonly \
		-modcacherw \
		-ldflags "-linkmode external -extldflags \"$LDFLAGS\""
}

check() {
	cd "$_archive"
	go test $(go list ./...)
}

package() {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "$pkgname"
}
