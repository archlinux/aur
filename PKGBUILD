pkgname=llama-swap

: "${_fragment:=tag=v154}"

pkgver=154
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
sha256sums=('6465b17150337b9fd7a3c8d96ccdaf6bc79c4104bb3df5d8c3e4234e1a48c5b4'
            'd2831c1b96875b12ec3140841175cd0039ca9bf9b73e71bfdf198b85a8cc858e')

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

	export CGO_CPPFLAGS=$CPPFLAGS
	export CGO_CFLAGS=$CFLAGS
	export CGO_CXXFLAGS=$CXXFLAGS
	export CGO_LDFLAGS=$LDFLAGS
	export GOPATH=$srcdir

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
