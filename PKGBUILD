# Maintainer: Robin Krahl <robin.krahl@ireas.org>
pkgname=nitrocli
pkgver=0.3.3
pkgrel=1
pkgdesc="Command-line interface for Nitrokey devices"
arch=('x86_64')
url="https://github.com/d-e-s-o/nitrocli"
license=('GPL3')
depends=('libnitrokey>=3.5' 'gnupg')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz"::https://github.com/d-e-s-o/nitrocli/archive/v${pkgver}.tar.gz)
sha512sums=('5d0999fb363e746758a2047b311025c5d7b0a57f0b4da255e276a61824333098585bce4e7d5f602a2cfce60eda0cc2ce5de2d6410b6eb817653e3ef5232f7d43')

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
