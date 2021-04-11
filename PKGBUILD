# Maintainer: Robin Krahl <robin.krahl@ireas.org>
pkgname=nitrocli
pkgver=0.4.0
pkgrel=1
pkgdesc="Command-line interface for Nitrokey devices"
arch=('x86_64')
url="https://github.com/d-e-s-o/nitrocli"
license=('GPL3')
depends=('libnitrokey>=3.5' 'gnupg')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz"::https://github.com/d-e-s-o/nitrocli/archive/v${pkgver}.tar.gz)
sha512sums=('6c41f301b49ee75e6c1e4aedb8e79ee4ee3b3cfa187d08bef7507f47583475a1da7af04d02ce932b08f58799711c4dc13d3a9fea59cebce8db68b811186c3a4e')

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
	cargo run --bin=shell-complete --release bash > nitrocli.bash
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 target/release/nitrocli "$pkgdir"/usr/bin/nitrocli
	install -Dm644 doc/nitrocli.1 "$pkgdir"/usr/share/man/man1/nitrocli.1
	install -Dm644 nitrocli.bash "$pkgdir"/usr/share/bash-completion/completions/nitrocli
}
