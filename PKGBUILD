# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
pkgname=encodarr-controller
pkgver=0.3.1
pkgrel=1
pkgdesc="Server software for encoding media files to a user-defined format."
arch=("x86_64")
url="https://github.com/BrenekH/encodarr#readme"
license=("MPL2")
depends=("glibc" "mediainfo")
makedepends=("go")
source=("encodarr-$pkgver.tar.gz"::"https://github.com/BrenekH/encodarr/archive/$pkgver.tar.gz")
sha256sums=('5342452554f0a0915ad19dc4dff2ac8ef28573bc655c8be2119a87efc3ff66ee')

build() {
	cd "encodarr-$pkgver/controller"

	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"

	# Store go caches in temp dirs (for those times when the home directory is locked down)
	export GOMODCACHE="$(mktemp -d)"
	export GOCACHE="$(mktemp -d)"

	go build \
	  -trimpath \
	  -buildmode=pie \
	  -mod=readonly \
	  -modcacherw \
	  -ldflags "-X 'github.com/BrenekH/encodarr/controller/globals.Version=$pkgver' -linkmode external -extldflags \"${LDFLAGS}\"" \
	  -o encodarr-controller cmd/main.go

	# Clean up Go caches
	go clean -modcache
	go clean -cache
}

check() {
	cd "encodarr-$pkgver/controller"

	export ENCODARR_CONFIG_DIR=$(mktemp -d)

	go test ./...

	./encodarr-controller --version

	rm -rf "${ENCODARR_CONFIG_DIR}"
}

package() {
	cd "encodarr-$pkgver/controller"

	install -Dm755 encodarr-controller "$pkgdir/usr/bin/encodarr-controller"
}
