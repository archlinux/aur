# Maintainer: Robin Krahl <robin.krahl@ireas.org>
pkgname=nitrocli
pkgver=0.3.4
pkgrel=1
pkgdesc="Command-line interface for Nitrokey devices"
arch=('x86_64')
url="https://github.com/d-e-s-o/nitrocli"
license=('GPL3')
depends=('libnitrokey>=3.5' 'gnupg')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz"::https://github.com/d-e-s-o/nitrocli/archive/v${pkgver}.tar.gz)
sha512sums=('c12113729d92f0a8cff1a45cec07b01c6e47caa034aee789e169a0d20567ca0e365c9eba7e901d93ba9a839dc24c8d603551fd245461eb3ea5e5ed96fd74acb7')

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
