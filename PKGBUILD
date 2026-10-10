# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=artcraft-launcher
pkgver=0.2.0
pkgrel=1
url="https://github.com/storytold/${pkgname#art}"
pkgdesc='install and launch ArtCraft apps'
arch=(x86_64)
license=(MIT Apache-2.0)
depends=(glibc # libc.so libm.so
         hicolor-icon-theme
         libgcc)
makedepends=(cargo)
_archive="${pkgname#art}-$pkgver"
source=("$url/archive/refs/tags/v$pkgver/$_archive.tar.gz")
sha256sums=('0219fc78e232c4d4c2027bd77b696424c9d75783e14e445ebe63b81965d47392')

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

_icons=(512 256 128 64 48 32 16)

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
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/applications/" "packaging/linux/ai.storyteller.$pkgname.desktop"
	install -Dm0644 -t "$pkgdir/usr/share/icons/hicolor/scalable/" assets/app-icon/hicolor/scalable/apps/ai.storyteller.$pkgname.svg
	for s in ${_icons[@]}; do
		local dim="${s}x${s}"
		install -Dm0644 -t "$pkgdir/usr/share/icons/hicolor/$dim/apps/" assets/app-icon/hicolor/$dim/apps/ai.storyteller.$pkgname.png
	done
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE-{APACHE,MIT}
}
