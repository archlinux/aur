# Maintainer: Flaviu Tamas <me@flaviutamas.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Felix Golatofski <contact@xdfr.de>

# Upstream tests have multiple issues including race conditions, using external
# binaries, differing results based on unrelated system directories, etc.
# See https://github.com/nushell/nushell/issues/7951
# See https://github.com/nushell/nushell/issues/8404
BUILDENV+=(!check)

_pkgname=nushell
pkgname=$_pkgname-git
pkgver=0.76.0.r134.gc7583ec
pkgrel=2
pkgdesc='A new type of shell'
arch=('x86_64' 'i686' 'armv6h' 'armv7h')
url='https://www.nushell.sh'
_url="https://github.com/$_pkgname/$_pkgname"
license=('MIT')
depends=('openssl' 'libxcb' 'curl' 'bzip2')
makedepends=('git' 'cargo')
conflicts=("$_pkgname")
provides=("$_pkgname=$pkgver")
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
