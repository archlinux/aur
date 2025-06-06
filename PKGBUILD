pkgname=llama-swap

_fragment=tag=v125

pkgver=125
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
sha256sums=('a0e9077e50a1f96e03335e63759221f59fd2e6e5ac6452153b9c86e39224f83e'
            'b4546cefb0c4255e432c6bd95143ae19735068951945d233011b02caecc641ff')

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

	go build "${BUILD_OPTS[@]}"
}

package() {
	cd $pkgname

	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
	install -Dm644 -t "$pkgdir/etc/llama-swap" config.example.yaml
	install -Dm644 -t "$pkgdir/usr/lib/systemd/system" ../llama-swap.service
	install -Dm755 -t "$pkgdir/usr/bin" llama-swap
}
