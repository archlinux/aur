pkgname=mcpls
pkgver=0.3.8
pkgrel=1
url="https://github.com/bug-ops/mcpls"
pkgdesc="Universal MCP to LSP bridge - expose Language Server Protocol capabilities as MCP tools for AI agents"
arch=(x86_64 aarch64)
license=(Apache-2.0 MIT)
: "${_fragment:=tag=v0.3.8}"
source=("git+$url.git#$_fragment")
makedepends=(git cargo)
md5sums=('c2a0ec5f5c90d7d30203f71a2a7173fb')

pkgver() {
	cd "$pkgname"
	git describe --tags | sed 's/^v//; s/-/+/g'
}

prepare() {
	cd "$pkgname"
	cargo fetch --locked --target host-tuple
}

build() {
	cd "$pkgname"
	cargo build --frozen --release
}

package() {
	cd "$pkgname"
	install -Dm0755 -t "$pkgdir/usr/bin" target/release/mcpls
	install -Dm0644 -t "$pkgdir/usr/share/$pkgname/examples" examples/mcpls.toml
	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname" docs/user-guide/*.md
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE-{APACHE,MIT}
}
