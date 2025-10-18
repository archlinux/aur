pkgname=mcp-devtools

: "${_fragment:=tag=v0.40.10}"

pkgver=0.40.10
pkgrel=1
pkgdesc='A modular MCP server that provides commonly used developer tools for AI coding agents'

arch=(x86_64 aarch64)
url="https://github.com/sammcj/$pkgname"
license=('Apache-2.0')

makedepends=(git go)

source=(
	"git+$url.git#$_fragment"
)
sha256sums=('3dff22fb39aaf4b590c4d43f6fc5770bce098f35cf13802cb28080d117e8491e')

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
