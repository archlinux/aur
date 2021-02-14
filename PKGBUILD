# Maintainer: Robin Krahl <robin.krahl@ireas.org>
pkgname=nitrocli
pkgver=0.3.5
pkgrel=1
pkgdesc="Command-line interface for Nitrokey devices"
arch=('x86_64')
url="https://github.com/d-e-s-o/nitrocli"
license=('GPL3')
depends=('libnitrokey>=3.5' 'gnupg')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz"::https://github.com/d-e-s-o/nitrocli/archive/v${pkgver}.tar.gz)
sha512sums=('f0c87650d07953fa795c86715d2122e22ece3db9e05f472c1d8ca67060291d06186a239dfec2285c6894e68a0e1eff1cf22ae6630fd4e72436e1b8a1c9999c2d')

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
	cd "$pkgname-$pkgver"
	export USE_SYSTEM_LIBNITROKEY=1
	cargo build --release
	cargo run --bin=shell-complete > nitrocli.bash
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 target/release/nitrocli "$pkgdir"/usr/bin/nitrocli
	install -Dm644 doc/nitrocli.1 "$pkgdir"/usr/share/man/man1/nitrocli.1
	install -Dm644 nitrocli.bash "$pkgdir"/usr/share/bash-completion/completions/nitrocli
}
