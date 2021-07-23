# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
pkgname=encodarr-runner
pkgver=0.2.0
pkgrel=1
pkgdesc="Client software for encoding media files to a user-defined format."
arch=("x86_64")
url="https://github.com/BrenekH/encodarr#readme"
license=("MPL2")
depends=("glibc" "ffmpeg")
makedepends=("go")
source=("encodarr-$pkgver.tar.gz"::"https://github.com/BrenekH/encodarr/archive/$pkgver.tar.gz")
sha256sums=('8bb0a508b2d1745c8ad25380cecd86049fc7d82e04282204116db37bc451cf3f')

build() {
	cd "encodarr-$pkgver/runner"

	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"

	go build \
	  -trimpath \
	  -buildmode=pie \
	  -mod=readonly \
	  -modcacherw \
	  -ldflags "-X 'github.com/BrenekH/encodarr/runner/options.Version=$pkgver' -linkmode external -extldflags \"${LDFLAGS}\"" \
	  -o encodarr-runner cmd/EncodarrRunner/main.go
}

check() {
	cd "encodarr-$pkgver/runner"

	go test ./...

	./encodarr-runner --version
}

package() {
	cd "encodarr-$pkgver/runner"

	install -Dm755 encodarr-runner "$pkgdir/usr/bin/encodarr-runner"
}
