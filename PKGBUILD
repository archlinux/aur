pkgname=mcphost

: "${_fragment:=tag=v0.31.3}"

pkgver=0.31.3
pkgrel=1
pkgdesc='A CLI host application that enables Large Language Models (LLMs) to interact with external tools through the Model Context Protocol (MCP)'

arch=(x86_64 aarch64)
url="https://github.com/mark3labs/$pkgname"
license=('MIT')

makedepends=(git go)

source=(
	"git+$url.git#$_fragment"
)
sha256sums=('02bd5e6fd0538a8efbe0c9d58faa0f93d4dd0f7d26267364044723d66e8cdcee')

pkgver() {
	git -C "$pkgname" describe --first-parent --tags | sed 's/^v//; s/-/+/g'
}

prepare() {
	go -C "$pkgname" mod vendor
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
		-buildmode=pie
		-mod=vendor
		-ldflags="-linkmode=external"
	)

	go build "${BUILD_OPTS[@]}"
}

package() {
	cd "$pkgname"

	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
	install -Dm755 -t "$pkgdir/usr/bin" "$pkgname"
}
