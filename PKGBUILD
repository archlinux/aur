# Maintainer: Robin Krahl <robin.krahl@ireas.org>
pkgname=nitrocli
pkgver=0.3.0
pkgrel=1
pkgdesc="Command-line interface for Nitrokey devices"
arch=('x86_64')
url="https://github.com/d-e-s-o/nitrocli"
license=('GPL3')
depends=('libnitrokey>=3.4.1' 'gnupg')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz"::https://github.com/d-e-s-o/nitrocli/archive/v${pkgver}.tar.gz)
sha512sums=('cf5b5fb815dc773050ec6b11a16165ee03a1717dbdea3c67de0106ca688d06cd9cfd2e2a4363fe22c97ad6a083a46ddcf2020aa5d5103a5a58be13c38c5d6d5a')

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
