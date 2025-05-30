pkgname=llama-swap

_fragment=tag=v123

pkgver=123
pkgrel=1
pkgdesc='Model swapping for llama.cpp (or any local OpenAPI compatible server)'

arch=(x86_64)
url="https://github.com/mostlygeek/$pkgname"
license=('MIT')

makedepends=(git go)

source=(
	"git+$url.git#$_fragment"
	llama-swap.service
)
sha256sums=('5ce7a1940e21c251afd9150de921735035b9e31863ef1c2845fc2a728f8d4e1c'
            '0fe45b16f9a1378db90aad386205b0ff1446055bd27866c7ce757d6b3ae76fe0')

pkgver() {
	git -C $pkgname describe --first-parent --tags | sed 's/^v//; s/-/+/g'
}

prepare() {
	go -C $pkgname mod vendor
}

build() {
	cd $pkgname

	export CGO_CPPFLAGS="$CPPFLAGS"
	export CGO_CFLAGS="$CFLAGS"
	export CGO_CXXFLAGS="$CXXFLAGS"
	export CGO_LDFLAGS="$LDFLAGS"

	local GOBUILDOPTS=(
		-v
		-trimpath
		-mod=readonly
		-modcacherw
		-buildmode=pie
		-ldflags="
        	-linkmode=external
        	-X main.version=$pkgver
        	-X main.commit=$(git rev-parse --short HEAD)
        	-X main.date=$(date -u +%Y-%m-%dT%H:%M:%SZ)
        "
	)

	go build "${GOBUILDOPTS[@]}"
}

package() {
	cd $pkgname

	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
	install -Dm644 -t "$pkgdir/etc/llama-swap" config.example.yaml
	install -Dm644 -t "$pkgdir/usr/lib/systemd/system" ../llama-swap.service
	install -Dm755 -t "$pkgdir/usr/bin" llama-swap
}
