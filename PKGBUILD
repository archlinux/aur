# Maintainer: Flaviu Tamas <me@flaviutamas.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Felix Golatofski <contact@xdfr.de>

_pkgname=nushell
pkgname=$_pkgname-git
pkgver=0.77.0.r6.g24ee381
pkgrel=1
pkgdesc='A new type of shell'
arch=('x86_64' 'i686' 'armv6h' 'armv7h')
url='https://www.nushell.sh'
_url="https://github.com/$_pkgname/$_pkgname"
license=('MIT')
depends=('libcrypto.so' 'libssl.so' 'zlib')
makedepends=('cargo' 'git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
install=nushell.install
source=("${pkgname%-git}::git+$_url.git")
sha256sums=('SKIP')

prepare() {
	cd "${pkgname%-git}"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

pkgver() {
	cd "${pkgname%-git}"
	git describe --long --abbrev=7 --tags HEAD |
		sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${pkgname%-git}"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	CFLAGS+=" -ffat-lto-objects"
	cargo build --release --frozen --workspace --features=extra,dataframe
}

check() {
	cd "${pkgname%-git}"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --workspace --features=extra,dataframe
}

package() {
	cd "${pkgname%-git}"
	find target/release \
		-maxdepth 1 \
		-executable \
		-type f \
		-name "nu*" \
		-exec install -Dm0755 -t "$pkgdir/usr/bin/" {} +
	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
