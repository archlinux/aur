# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=vectorcraft
pkgver=0.6.0
pkgrel=1
url="https://getartcraft.com/apps/$pkgname"
_url="https://github.com/storytold/$pkgname"
pkgdesc='vibe coded clean-room reimplementation of Adobe Illustrator'
arch=(x86_64)
license=(MIT Apache-2.0)
depends=(glibc # libc.so libm.so
         hicolor-icon-theme
         libgcc)
makedepends=(cargo)
_archive="$pkgname-$pkgver"
source=("$_url/archive/refs/tags/v$pkgver/$_archive.tar.gz")
sha256sums=('2237e3123e286a780e2b6d036ad459f35fa38feda6b35cfac1699b25825d748a')

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
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"{,-cli}
	install -Dm0644 -t "$pkgdir/usr/share/applications/" "packaging/linux/ai.storyteller.$pkgname.desktop"
	install -Dm0644 -t "$pkgdir/usr/share/mime/packages/" "packaging/linux/ai.storyteller.$pkgname.mime.xml"
	install -Dm0644 -t "$pkgdir/usr/share/icons/hicolor/scalable/" assets/app-icon/hicolor/scalable/apps/ai.storyteller.$pkgname.svg
	for s in ${_icons[@]}; do
		local dim="${s}x${s}"
		install -Dm0644 -t "$pkgdir/usr/share/icons/hicolor/$dim/apps/" assets/app-icon/hicolor/$dim/apps/ai.storyteller.$pkgname.png
	done
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE-{APACHE,MIT}
}
