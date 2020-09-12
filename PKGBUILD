# Maintainer: Robin Krahl <robin.krahl@ireas.org>
pkgname=rusty-man
pkgver=0.3.0
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
	'd52b2b111d3c037885cb1fa75344246636ed80250a7b8e10caf2457c9f1f9eab881e8cdff029871a363650b01a09d96149718868c8f49b4077f3fdb01cfa250c'
	'e93947159a9b511504e04630e2170688c845c5bccaa219369e1126d6164c680c1a89fa70061877721d67e13168ceb95ad33fbb205f57804ffcb222a8d45e4d85'
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
