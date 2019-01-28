# Maintainer: Robin Krahl <robin.krahl@ireas.org>
pkgname=nitrocli
pkgver=0.2.3
pkgrel=1
pkgdesc="Command-line interface for Nitrokey devices"
arch=('x86_64')
url="https://github.com/d-e-s-o/nitrocli"
license=('GPL3')
depends=('libnitrokey>=3.4.1' 'gnupg')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz"::https://github.com/d-e-s-o/nitrocli/archive/v${pkgver}.tar.gz)
sha512sums=('b777fb634961f9c7c677f78743176df32a170da5793c53c8c46f8ff9f62fa51e616ac12b5b589f3531285d194996b130b313d77c02762c2aa97c7919b7b2e0de')

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
	cargo build --release --frozen
}

package() {
	cd "$pkgname-$pkgver/nitrocli"
	install -Dm755 target/release/nitrocli "$pkgdir"/usr/bin/nitrocli
	install -Dm644 doc/nitrocli.1 "$pkgdir"/usr/share/man/man1/nitrocli.1
}
