pkgname=llama-swap

: "${_fragment:=tag=v179}"

pkgver=179
pkgrel=1
pkgdesc='Model swapping for llama.cpp (or any local OpenAPI compatible server)'

arch=(x86_64 aarch64)
url="https://github.com/mostlygeek/$pkgname"
license=('MIT')

makedepends=(
	git
	go
	# deno
	pnpm
)

source=(
	"git+$url.git#$_fragment"
	llama-swap.service
)
sha256sums=('4cee5f2dc7900436cb55ce0c5e4ab45bd268eba17c30f79569ad5f16c1b2a200'
            '8f247fec3e347c212006415e23260a4851ccc435ea3fe0b2c7eaed12b49c406c')

pkgver() {
	git -C "$pkgname" describe --first-parent --tags | sed 's/^v//; s/-/+/g'
}

prepare() {
	cd "$pkgname"
	go mod vendor

	cd ui
	# deno install --npm
	pnpm install
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

	# deno task --cwd=ui build
	pnpm -C ui run build
	go build "${build_opts[@]}"
}

package() {
	cd "$pkgname"

	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
	install -Dm644 -t "$pkgdir/etc/llama-swap" config.example.yaml
	install -Dm644 -t "$pkgdir/usr/lib/systemd/system" ../llama-swap.service
	install -Dm755 -t "$pkgdir/usr/bin" llama-swap
}
