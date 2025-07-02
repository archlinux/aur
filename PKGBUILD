pkgname=llama-swap

_fragment=tag=v136

pkgver=136
pkgrel=1
pkgdesc='Model swapping for llama.cpp (or any local OpenAPI compatible server)'

arch=(x86_64 aarch64)
url="https://github.com/mostlygeek/$pkgname"
license=('MIT')

makedepends=(git go pnpm)

source=(
	"git+$url.git#$_fragment"
	llama-swap.service
)
sha256sums=('38917d43dff135ceb81fffe4dd73590d427bce3faf9b5ec13e66ae3a36d52e07'
            'b4546cefb0c4255e432c6bd95143ae19735068951945d233011b02caecc641ff')

pkgver() {
	git -C "$pkgname" describe --first-parent --tags | sed 's/^v//; s/-/+/g'
}

prepare() {
	cd "$pkgname"
	go mod vendor
	pnpm -C ui install
}

build() {
	cd "$pkgname"

	export CGO_CPPFLAGS="$CPPFLAGS"
	export CGO_CFLAGS="$CFLAGS"
	export CGO_CXXFLAGS="$CXXFLAGS"
	export CGO_LDFLAGS="$LDFLAGS"

	local BUILD_OPTS=(
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

	pnpm -C ui build
	go build "${BUILD_OPTS[@]}"
}

package() {
	cd "$pkgname"

	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
	install -Dm644 -t "$pkgdir/etc/llama-swap" config.example.yaml
	install -Dm644 -t "$pkgdir/usr/lib/systemd/system" ../llama-swap.service
	install -Dm755 -t "$pkgdir/usr/bin" llama-swap
}
