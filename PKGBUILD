# Maintainer: Robin Krahl <robin.krahl@ireas.org>
pkgname=nitrocli
pkgver=0.2.4
pkgrel=1
pkgdesc="Command-line interface for Nitrokey devices"
arch=('x86_64')
url="https://github.com/d-e-s-o/nitrocli"
license=('GPL3')
depends=('libnitrokey>=3.4.1' 'gnupg')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz"::https://github.com/d-e-s-o/nitrocli/archive/v${pkgver}.tar.gz)
sha512sums=('2b7493018f3c754e1b61a780171e38799d1fbda42d552e15aae819d33e3bd2b88d3b43aadc114c5cbd005c1479a6a66ff1289c4a5be5e63688f3f649b7c0a3a2')

prepare() {
	cd "$pkgname-$pkgver"
	# Configure cargo not to put the srcdir in the binary
	mkdir -p .cargo
	cat <<EOF > .cargo/config
[build]
rustflags = ["--remap-path-prefix", "$srcdir=/usr/share/cargo/registry/$pkgname"]
EOF
}

build() {
	cd "$pkgname-$pkgver/nitrocli"
	export USE_SYSTEM_LIBNITROKEY=1
	cargo build --release
}

package() {
	cd "$pkgname-$pkgver/nitrocli"
	install -Dm755 target/release/nitrocli "$pkgdir"/usr/bin/nitrocli
	install -Dm644 doc/nitrocli.1 "$pkgdir"/usr/share/man/man1/nitrocli.1
}
