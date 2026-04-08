# Maintainer: Hans-Nikolai Viessmann <hans AT viess DOT mn>
pkgname=cscs-key
pkgver=1.0.0
pkgrel=1
pkgdesc="Command-line tool to manage SSH keys for the Swiss National Supercomputing Centre (CSCS)"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://docs.cscs.ch/access/ssh/"
license=('LicenseRef-unknown')
depends=('glibc' 'libgcc' 'openssl')
makedepends=('cargo')
source=('https://github.com/eth-cscs/cscs-key/archive/refs/tags/1.0.0.tar.gz')
sha256sums=('d31d72e6355b0e98fc2a6376b188e6ae91d0988c0d292e6d9a13fe8c324d6391')

# Use debug
export CARGO_PROFILE_RELEASE_DEBUG=2 CARGO_PROFILE_RELEASE_STRIP=false

# Use LTO
export CARGO_PROFILE_RELEASE_LTO=true CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target host-tuple
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -d "$pkgdir/usr/share/licenses/cscs-key/"
	echo "license unknown or not set" > "$pkgdir/usr/share/licenses/cscs-key/LICENSE"
}
