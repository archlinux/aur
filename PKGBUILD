pkgname=mcp-devtools

: "${_fragment:=tag=v0.40.3}"

pkgver=0.40.3
pkgrel=1
pkgdesc='A modular MCP server that provides commonly used developer tools for AI coding agents'

arch=(x86_64 aarch64)
url="https://github.com/sammcj/$pkgname"
license=('Apache-2.0')

makedepends=(git go)

source=(
	"git+$url.git#$_fragment"
)
sha256sums=('0726e66531224776db8d9b960ee5b95dc0a7a3b7de3bba939afa4c88cbb97774')

pkgver() {
	git -C "$pkgname" describe --first-parent --tags | sed 's/^v//; s/-/+/g'
}

prepare() {
	cd "$pkgname"
	go mod vendor
}

build() {
	cd "$pkgname"

	local BUILD_OPTS=(
		-v
		-trimpath
		-mod=vendor
		-buildmode=pie
		-ldflags="
			-linkmode external
			-extldflags \"${LDFLAGS}\"
			-X main.Version=\"$pkgver\"
			-X main.Commit=\"$(git rev-parse --short HEAD)\"
			-X main.BuildDate=\"$(date -u +%Y-%m-%dT%H:%M:%SZ)\"
		"
		# -tags sbom_vuln_tools
	)

	go build "${BUILD_OPTS[@]}"
}

package() {
	cd "$pkgname"

	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
	install -Dm755 -t "$pkgdir/usr/bin" "$pkgname"
}
