# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=limabean-harvest
pkgver=0.2.4
pkgrel=1
pkgdesc='Beancount importer with transaction pairing across accounts '
arch=(x86_64 i686)
url="https://github.com/tesujimath/$pkgname"
license=(MIT Apache-2.0)
depends=(java-runtime
         gcc-libs # libgcc_s.so ld-linux-x86-64
         glibc) # libc.so libm.so
makedepends=(cargo
             clojure
             git)
_archive="$pkgname-$pkgver"
source=("$url/archive/$pkgver/$_archive.tar.gz")
sha256sums=('65a10af63a473eb2951de9336e7bd5056b3c3459e7bef2ebf06b9f0748127e3f')

prepare() {
	cd "$_archive"
	pushd rust
	cargo fetch --locked --target host-tuple
	pushd ../clj
	clojure -P -T:build jar
}

_srcenv() {
	cd "$_archive"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	export CFLAGS+=' -ffat-lto-objects'
	export LIMABEAN_HARVEST_UBERJAR="/usr/lib/$_archive-standalone.jar"
}

build() {
	_srcenv
	pushd rust
	cargo build --frozen --release
	pushd ../clj
	clojure -T:build uber
}

check() {
	_srcenv
	pushd rust
	cargo test --frozen --release
	pushd ../clj
	export PATH+=":../rust/target/release/"
	clojure -X:test
}

package () {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "rust/target/release/"{$pkgname,limabean-digest,hull-csv,hull-ofx}
	install -Dm0755 -t "$pkgdir/usr/lib/" "clj/target/$_archive-standalone.jar"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE-{APACHE,MIT}
}
