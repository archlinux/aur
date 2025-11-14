pkgname=mcp-devtools

: "${_fragment:=tag=v0.50.0}"

pkgver=0.50.0
pkgrel=1
pkgdesc='A modular MCP server that provides commonly used developer tools for AI coding agents'

arch=(x86_64 aarch64)
url="https://github.com/sammcj/$pkgname"
license=('Apache-2.0')

makedepends=(git go)

source=(
	"git+$url.git#$_fragment"
)
sha256sums=('864f1ffd6e808201ad76c62a1ab82407c6d5c594332207cc10b895ea3b29bdd2')

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
