# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Maintainer: Gyro7 <gyro@sach1.tk>

pkgname=mangodl-git
pkgver=1.5.r1.ga3f98e6
pkgrel=1
pkgdesc="CLI tool for downloading manga"
arch=('x86_64')
url="https://github.com/Gyro7/mangodl"
license=('GPL3')
depends=('glibc')
makedepends=('git' 'go')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	git -C "$pkgname" describe --long --tags | awk -F '-' '{printf "%s.r%s.%s", $2, $4, $5}' | sed 's/^v//'
}

prepare() {
	cd "$pkgname"
	mkdir -p build
}

build() {
	export CGO_LDFLAGS="${LDFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	cd "$pkgname"
	go build -o build .
}

check() {
	cd "$pkgname"
	go test ./...
}

package() {
	cd "$pkgname"
	install -D build/mangodl -t "$pkgdir/usr/bin/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
