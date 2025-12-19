pkgname=mcphost

: "${_fragment:=tag=v0.32.0}"

pkgver=0.32.0
pkgrel=1
pkgdesc='A CLI host application that enables Large Language Models (LLMs) to interact with external tools through the Model Context Protocol (MCP)'

arch=(x86_64 aarch64)
url="https://github.com/mark3labs/$pkgname"
license=('MIT')

makedepends=(git go)

source=(
	"git+$url.git#$_fragment"
)
sha256sums=('d2ca94781fa75285073e4a7027b86db1f482b3bedd18a1e314e46fa2495d0765')

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
