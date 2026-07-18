# Maintainer: willker <wz.willker[at]gmail[dot]com>

pkgname=cfproxy-rs
pkgver=0.1.1
pkgrel=1
pkgdesc="基于 Cloudflare Workers/Pages 的 Telegram Socks5 代理服务器"
url="https://github.com/achyuki/cfproxy-rs"
license=('MIT')
arch=('x86_64' 'aarch64')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c78579a20fa23c676565698c6e1d3fbf2816439c39726413bb1c92773ae1282e')
options=('!lto')

prepare() {
	cd $pkgname-$pkgver
	cargo fetch --locked --target host-tuple
}

build() {
	cd $pkgname-$pkgver
	cargo build --frozen --release
}

package() {
	install -Dm644 $pkgname.service -t "$pkgdir/usr/lib/systemd/system"
	cd $pkgname-$pkgver
	install -Dm755 target/release/cfproxy-rs -t "$pkgdir/usr/bin"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 config_full.json "$pkgdir/etc/cfproxy-rs/config.json"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
