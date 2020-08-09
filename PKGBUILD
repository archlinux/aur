# Maintainer: Robin Krahl <robin.krahl@ireas.org>
pkgname=rusty-man
pkgver=0.1.3
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
	'105f891be935d77ef09da736bbaa9ba448c40a67b9fdda25f05a96f325529e2f6508999813687e48f46a9ff6faf791486b8ac1a9c2e273580968f09ed52e9fbe'
	'ca407cefc740920fed0f0c53d31170760442924895c36c6cf6483d263d623e52b307650b3072582bb536d9e52abd1f6970eb2261c05e14dbd18e8a6857efde7c'
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
