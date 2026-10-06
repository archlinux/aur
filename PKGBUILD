# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=artcraft
pkgver=0.41.0
pkgrel=1
url="https://github.com/storytold/$pkgname"
pkgdesc='IDE for interactive AI image and video creation'
arch=(x86_64)
license=(MIT)
depends=(alsa-lib
         atkmm
         cairo
         glibc # libc.so libm.so
         libgcc
         libstdc++
         libsoup3
         openssl
         pango
         sqlite
         webkit2gtk-4.1)
makedepends=(cargo
             cargo-tauri
             clang
             cmake
             git
             nodejs-lts-krypton
             npm)
options=(!lto)
_tag="$pkgname-v$pkgver"
_archive="$pkgname-$_tag"
source=("$url/archive/refs/tags/$_tag/$_archive.tar.gz")
sha256sums=('c10a89be18b8322e51d9ee6985032ba79872ceb0477beaf72c753d4340baba00')

_srcenv() {
	cd "$_archive"
	export CARGO_HOME="$srcdir"
	export CARGO_PROFILE_RELEASE_DEBUG=2
	export CARGO_PROFILE_RELEASE_STRIP=false
	export CARGO_PROFILE_RELEASE_LTO=thin
	export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1
	export CARGO_PROFILE_RELEASE_OPT_LEVEL=3
	export CARGO_TARGET_DIR=target
	export RUSTUP_TOOLCHAIN=stable
	# CFLAGS+=' -fno-lto'
	# CPPFLAGS+=' -fno-lto'
	RUSTFLAGS+=" --remap-path-prefix $PWD=/"
	export SQLX_OFFLINE=true
}

prepare() {
	_srcenv
	cargo fetch --locked --target host-tuple
}

build() {
	_srcenv
	cargo build --frozen --release
}

package() {
	depends+=(libasound.so
	          libcairo.so
	          libgcc_s.so)
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
}
