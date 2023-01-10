# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
pkgname=pjs
pkgver=0.1.0
pkgrel=1
pkgdesc="A basic CLI for regularly updating your project's status."
arch=("x86_64")
url="https://github.com/bashbunni/pjs#readme"
license=()
depends=("glibc")
makedepends=("go" "gcc")
source=("pjs-$pkgver.tar.gz"::"https://github.com/bashbunni/pjs/archive/v$pkgver.tar.gz")
sha256sums=('68c7ff4e64ab110eb1445ece2da5b67d9d99d7c4a20f9e534c2f685252b9843b')

build() {
	cd "pjs-$pkgver"

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
	  -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
	  -o pjs main.go

	# Clean up Go caches
	go clean -modcache
	go clean -cache
}

check() {
	cd "pjs-$pkgver"

	go test ./...
}

package() {
	cd "pjs-$pkgver"

	install -Dm755 pjs "$pkgdir/usr/bin/pjs"
}
