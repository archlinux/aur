pkgname=mcp-devtools

: "${_fragment:=tag=v0.27.0}"

pkgver=0.27.0
pkgrel=1
pkgdesc='A modular MCP server that provides commonly used developer tools for AI coding agents'

arch=(x86_64 aarch64)
url="https://github.com/sammcj/$pkgname"
license=('Apache-2.0')

makedepends=(git go)

source=(
	"git+$url.git#$_fragment"
)
sha256sums=('5b96d1f7c3391b34aeac0fac79339d6ece0b7f75215381dd6414921df446faef')

pkgver() {
	git -C "$pkgname" describe --first-parent --tags | sed 's/^v//; s/-/+/g'
}

prepare() {
	cd "$pkgname"
	go mod vendor
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
			-X main.Version=$pkgver
			-X main.Commit=$(git rev-parse --short HEAD)
			-X main.BuildDate=$(date -u +%Y-%m-%dT%H:%M:%SZ)
		"
	)

	go build "${BUILD_OPTS[@]}"
}

package() {
	cd "$pkgname"

	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
	install -Dm755 -t "$pkgdir/usr/bin" "$pkgname"
}
