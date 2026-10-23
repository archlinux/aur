# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pkgname=MaterialCraft
pkgname=materialcraft
pkgver=0.4.0
pkgrel=1
url="https://github.com/PiJellyPin/$_pkgname"
pkgdesc='vibe coded clean-room reimplementation of Adobe Substance Designer'
arch=(x86_64)
license=(MIT Apache-2.0)
depends=(glibc # libc.so libm.so
         libgcc)
makedepends=(cargo)
_archive="$_pkgname-$pkgver"
source=("$url/archive/refs/tags/$pkgver/$_archive.tar.gz")
sha256sums=('072ddafb1d6320dbfdaa6bc090fb84f855a7804263733b0b0f69787fd4141b15')

_srcenv() {
	cd "$_archive"
	export CARGO_HOME="$srcdir"
	if check_option debug y; then
		export CARGO_PROFILE_RELEASE_DEBUG=2
		export CARGO_PROFILE_RELEASE_STRIP=false
	fi
	if check_option lto y; then
		export CARGO_PROFILE_RELEASE_LTO=thin
		export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1
	fi
	export CARGO_PROFILE_RELEASE_OPT_LEVEL=3
	CFLAGS+=' -fno-lto'
	export CARGO_TARGET_DIR=target
	export RUSTUP_TOOLCHAIN=stable
}

prepare() {
	_srcenv
	cargo fetch --locked --target host-tuple
}

build() {
	_srcenv
	cargo build --frozen --release --features gui
}

package() {
	depends+=(libgcc_s.so)
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"{,-gui}
	install -Dm0644 assets/${_pkgname}Logo.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE-{APACHE,MIT}
}
