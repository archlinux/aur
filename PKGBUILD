# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=pdfcraft
pkgver=0.21.1
pkgrel=1
url="https://getartcraft.com/apps/$pkgname"
_url="https://github.com/storytold/$pkgname"
pkgdesc='vibe coded clean-room reimplementation of Adobe Acrobat'
arch=(x86_64)
license=(MIT Apache-2.0)
depends=(glibc # libc.so libm.so
         hicolor-icon-theme
         libgcc)
makedepends=(cargo)
provides=(printcraft)
conflicts=(printcraft)
replaces=(printcraft)
_archive="$pkgname-$pkgver"
source=("$_url/archive/refs/tags/v$pkgver/$_archive.tar.gz")
sha256sums=('d6cb5a437aa531fe3ae91250e2b6aa52cf4208cc521c17fc30aeccc917c0e9f5')

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

_icons=(512 256 128 64 48 32 16)

prepare() {
	_srcenv
	cargo fetch --locked --target host-tuple
}

build() {
	_srcenv
	# Cannot build in frozen mode due to pinned Git deps
	# c.f. https://github.com/storytold/pdfcraft/issues/6823
	# cargo build --frozen --release
	cargo build --locked --release
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
