pkgname=llama-swap

: "${_fragment:=tag=v176}"

pkgver=176
pkgrel=1
pkgdesc='Model swapping for llama.cpp (or any local OpenAPI compatible server)'

arch=(x86_64 aarch64)
url="https://github.com/mostlygeek/$pkgname"
license=('MIT')

makedepends=(git go deno)

source=(
	"git+$url.git#$_fragment"
	llama-swap.service
)
sha256sums=('a66f50f154665dfe82c6d8a2082633600039ae4987220598f1406ba0dfc8d04c'
            '8f247fec3e347c212006415e23260a4851ccc435ea3fe0b2c7eaed12b49c406c')

pkgver() {
	git -C "$pkgname" describe --first-parent --tags | sed 's/^v//; s/-/+/g'
}

prepare() {
	cd "$pkgname"
	go mod vendor

	cd ui
	deno install --npm
}

build() {
	cd "$pkgname"

	local build_opts=(
		-v
		-trimpath
		-mod=vendor
		-buildmode=pie
		-ldflags="
			-linkmode external
			-extldflags \"${LDFLAGS}\"
			-X main.version=\"$pkgver\"
			-X main.commit=\"$(git rev-parse --short HEAD)\"
			-X main.date=\"$(date -u +%Y-%m-%dT%H:%M:%SZ)\"
		"
	)

	deno task --cwd=ui build
	go build "${build_opts[@]}"
}

package() {
	cd "$pkgname"

	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
	install -Dm644 -t "$pkgdir/etc/llama-swap" config.example.yaml
	install -Dm644 -t "$pkgdir/usr/lib/systemd/system" ../llama-swap.service
	install -Dm755 -t "$pkgdir/usr/bin" llama-swap
}
