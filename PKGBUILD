# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
pkgname=encodarr-runner
pkgver=0.2.2
pkgrel=1
pkgdesc="Client software for encoding media files to a user-defined format."
arch=("x86_64")
url="https://github.com/BrenekH/encodarr#readme"
license=("MPL2")
depends=("glibc" "ffmpeg")
makedepends=("go")
source=("encodarr-$pkgver.tar.gz"::"https://github.com/BrenekH/encodarr/archive/$pkgver.tar.gz")
sha256sums=('2e72a4563fbaab00a16c5dbc8523cc226530654fd648274e3c89b2666d6c04b3')

build() {
	cd "encodarr-$pkgver/runner"

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
	  -ldflags "-X 'github.com/BrenekH/encodarr/runner/options.Version=$pkgver' -linkmode external -extldflags \"${LDFLAGS}\"" \
	  -o encodarr-runner cmd/EncodarrRunner/main.go

	# Clean up Go caches
	go clean -modcache
	go clean -cache
}

check() {
	cd "encodarr-$pkgver/runner"

	export ENCODARR_CONFIG_DIR=$(mktemp -d)

	go test ./...

	./encodarr-runner --version

	rm -rf "${ENCODARR_CONFIG_DIR}"
}

package() {
	cd "encodarr-$pkgver/runner"

	install -Dm755 encodarr-runner "$pkgdir/usr/bin/encodarr-runner"
}
