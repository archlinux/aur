# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=solidcraft
pkgver=0.13.1
pkgrel=1
url="https://bherbruck.github.io/$pkgname"
_url="https://github.com/bherbruck/$pkgname"
pkgdesc='vibe coded clean-room reimplementation of Autodesk Fusion'
arch=(x86_64)
license=(MIT Apache-2.0)
depends=(glibc # libc.so libm.so
         libgcc)
makedepends=(cargo)
_archive="$pkgname-$pkgver"
source=("$_url/archive/refs/tags/v$pkgver/$_archive.tar.gz")
sha256sums=('45ac62c371def2caac3d2567b4221272f07cef9afcaaa925d121a3d6305648dc')

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
	CFLAGS+=' -fno-lto'
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
	depends+=(libgcc_s.so)
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"{,-cli}
	install -Dm0644 -t "$pkgdir/usr/share/applications/" "assets/platforms/linux/ai.storyteller.$pkgname.desktop"
	install -Dm0644 -t "$pkgdir/usr/share/mime/packages/" "assets/platforms/linux/ai.storyteller.$pkgname.mime.xml"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE-{APACHE,MIT}
}
