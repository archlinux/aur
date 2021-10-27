# Maintainer: Robin Krahl <robin.krahl@ireas.org>
pkgname=rusty-man
pkgver=0.5.0
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
)
validpgpkeys=('28B13CD28267111859622B686D533958F070C57C')
sha512sums=(
	'ccac1b28a0dc93685843ac12c1b2382da93f440dd6421e4c46d1908da3705198935d9946f39fe1c7600e60b63663cb4c8bb9507647e071c8f7950c494f0929c4'
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
