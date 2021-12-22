# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
pkgname=smartreboot
pkgver=0.0.1
pkgrel=1
pkgdesc="Reboot a machine without interrupting ongoing work."
arch=("x86_64")
url="https://github.com/BrenekH/smartreboot#readme"
license=("GPL3")
depends=("glibc")
makedepends=("go")
source=("smartreboot-$pkgver.tar.gz"::"https://github.com/BrenekH/smartreboot/archive/$pkgver.tar.gz")
sha256sums=('f10d40e34e68acec372b1674e5568cde6c5f925b8421d3a67ce6ffbc4b93c8ac')

build() {
	cd "smartreboot-$pkgver"

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
	  -ldflags "-X 'main.Version=$pkgver' -linkmode external -extldflags \"${LDFLAGS}\"" \
	  -o build/smartreboot cmd/cli/main.go

	go build \
	  -trimpath \
	  -buildmode=pie \
	  -mod=readonly \
	  -modcacherw \
	  -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
	  -o build/smartrebootd cmd/daemon/main.go

	# Clean up Go caches
	go clean -modcache
	go clean -cache
}

check() {
	cd "smartreboot-$pkgver"

	go test ./...

	./build/smartreboot --version
}

package() {
	cd "smartreboot-$pkgver"

	make DESTDIR=$pkgdir install

	# Remove unnecessary debian reboot required script
	rm $pkgdir/etc/smartreboot/rebootchecks/00-debian-reboot-required
}
