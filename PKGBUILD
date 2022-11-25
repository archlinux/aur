# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=pomerium-cli
pkgver=0.20.0
pkgrel=1
pkgdesc='CLI component for Pomerium'
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/pomerium/cli"
license=('Apache')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('518188484e89cf35678a44ce4b050279b3e58273f466e93e5883c646dbe51353')

prepare() {
	cd "cli-$pkgver"
	mkdir -p build
	go mod download
}

build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

	cd "cli-$pkgver"
	local _PKG="${url#https://}"
	go build \
		-o build \
		-ldflags "-linkmode external -extldflags \"${LDFLAGS}\"
			-X $_PKG/version.ProjectName=$pkgname -X $_PKG/version.ProjectURL=$_PKG" \
			"./cmd/$pkgname"
}

check() {
	cd "cli-$pkgver"
	go test \
		-ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
		./...
}

package() {
	cd "cli-$pkgver"
	install -Dv "build/$pkgname" -t "$pkgdir/usr/bin/"
}
