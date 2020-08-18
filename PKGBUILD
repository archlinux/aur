# Maintainer: Robin Krahl <robin.krahl@ireas.org>
pkgname=rusty-man
pkgver=0.2.0
pkgrel=1
pkgdesc="Command-line viewer for rustdoc documentation"
arch=('x86_64')
url="https://sr.ht/~ireas/rusty-man"
license=('MIT')
depends=('gcc-libs')
optdepends=('rust-docs: Rust standard library documentation')
makedepends=('cargo')
source=(
	"$pkgname-$pkgver.tar.gz"::https://git.sr.ht/~ireas/rusty-man/archive/v${pkgver}.tar.gz
	"$pkgname-$pkgver.tar.gz.asc"::https://git.sr.ht/~ireas/rusty-man/refs/v${pkgver}/v${pkgver}.tar.gz.asc
)
validpgpkeys=('28B13CD28267111859622B686D533958F070C57C')
sha512sums=(
	'29b92d2c98926ff482357e9ccd2bb68c5e5eeeb97d1ba3431519ffeef7145c97a5597c1240cbe682d29ad2733d1092d07ccce9d1b9af3f66edc98dc6afeab810'
	'48ba3a7cb3388796e2e2d4778c4b6543d1d847c8f1811dc9b08102b70a6a19da2fba7d28196dc7c66859953033aed60198c6d7d94a5df0381d1263918236bc19'
)

prepare() {
	cd "$pkgname-v$pkgver"
	# Configure cargo not to put the srcdir in the binary
	mkdir -p .cargo
	cat <<EOF > .cargo/config
[build]
rustflags = ["--remap-path-prefix", "$srcdir=/usr/share/cargo/registry/$pkgname"]
EOF
}

build() {
	cd "$pkgname-v$pkgver"
	cargo build --release --locked
}

package() {
	cd "$pkgname-v$pkgver"
	install -Dm755 target/release/rusty-man "$pkgdir"/usr/bin/rusty-man
	install -Dm644 LICENSES/MIT.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
