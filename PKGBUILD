# Maintainer: Hans-Nikolai Viessmann <hans AT viess DOT mn>
pkgname=cscs-key
pkgver=1.1.0
pkgrel=1
pkgdesc="Command-line tool to manage SSH keys for the Swiss National Supercomputing Centre (CSCS)"
arch=('i686' 'x86_64' 'armv7h')
url="https://docs.cscs.ch/access/ssh/"
license=('BSD-3-Clause')
depends=('glibc' 'libgcc')
makedepends=('cargo')
source=("https://github.com/eth-cscs/cscs-key/archive/refs/tags/v${pkgver}.tar.gz"
        'LICENSE')
sha256sums=('f604d03a49e122712727864ff9fd903c18a9868bf7e280d71fd9d6b7c7728c16'
            'f9b6367856a47fc17f611997484cee634ce407ad340822e3a1677487c5b7c6a5')

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
	# see https://github.com/briansmith/ring/issues/1444#issuecomment-5217008291
	CFLAGS+=' -ffat-lto-objects'
  CXXFLAGS+=' -ffat-lto-objects'
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
	install -Dm0644 -t "$pkgdir/usr/share/licenses/cscs-key/" '../LICENSE'
}
