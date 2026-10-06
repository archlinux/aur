# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=designcraft
pkgver=0.2.1
pkgrel=4
url="https://getartcraft.com/apps/$pkgname"
_url="https://github.com/storytold/$pkgname"
pkgdesc='vibe coded clean-room reimplementation of Adobe InDesign'
arch=(x86_64)
license=(MIT Apache-2.0)
depends=(glibc # libc.so libm.so
         libgcc)
makedepends=(cargo)
_archive="$pkgname-$pkgver"
source=("$_url/archive/refs/tags/v$pkgver/$_archive.tar.gz")
sha256sums=('41474c17fe1233ec72ff5f0c276bb10f48f135760d91d520cb765fb47c031b9a')

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
	install -Dm0644 -t "$pkgdir/usr/share/applications/" "packaging/linux/ai.storyteller.$pkgname.desktop"
	install -Dm0644 -t "$pkgdir/usr/share/mime/packages/" "packaging/linux/ai.storyteller.$pkgname.mime.xml"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE-{APACHE,MIT}
}
