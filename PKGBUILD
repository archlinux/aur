pkgname=mcphost

_fragment=tag=v0.10.0

pkgver=0.10.0
pkgrel=1
pkgdesc='A CLI host application that enables Large Language Models (LLMs) to interact with external tools through the Model Context Protocol (MCP)'

arch=(x86_64)
url="https://github.com/mark3labs/$pkgname"
license=('MIT')

makedepends=(git go)

source=(
	"git+$url.git#$_fragment"
)
sha256sums=('9cd5bb0096317de954b111bcfe4f479864494c4ac416dce8b29627beb34f1360')

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
		-ldflags="-linkmode=external"
	)

	go build "${GOBUILDOPTS[@]}"
}

package() {
	cd $pkgname

	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
	install -Dm755 -t "$pkgdir/usr/bin" $pkgname
}
