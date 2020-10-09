# Maintainer: Robin Krahl <robin.krahl@ireas.org>
pkgname=rusty-man
pkgver=0.4.0
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
	"$pkgname-$pkgver.tar.gz.asc"::https://git.sr.ht/~ireas/rusty-man/refs/v${pkgver}/rusty-man-v${pkgver}.tar.gz.asc
)
validpgpkeys=('28B13CD28267111859622B686D533958F070C57C')
sha512sums=(
	'284a3a8abb32d43b45dc4797d90c785223aa2d4ba76a55280dafe82f32bf27e585a2d094beac4f5674b9de670cfd07d46b065d0bc0492f4910bc939f8225a387'
	'f93fa1a3ba7dc526206b53cb120c4485160951a381ad1637ec6a8e96ecce4d03b2ba8d31d50035262eb1c8f91ec9d0f16b9227073046518d1540970e1ff4126b'
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
