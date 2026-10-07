# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=deckcraft
pkgver=0.0.0
pkgrel=1
url="https://getartcraft.com/apps/$pkgname"
_url="https://github.com/storytold/$pkgname"
pkgdesc='vibe coded clean-room reimplementation of Microsoft PowerPoint'
arch=(x86_64)
license=(MIT Apache-2.0)
depends=(alsa-lib
         glibc # libc.so libm.so
         hicolor-icon-theme
         libgcc)
makedepends=(cargo)
_sha=942a2c80cc5110f9c8640ffe1925600182ae2284
_archive="$pkgname-$_sha"
source=("$_url/archive/$_sha/$_archive.tar.gz")
sha256sums=('8f2cec6e49b828f192f60efedc536f25a7c2bc505c526eb84633c13dbffa900e')

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
	# https://github.com/storytold/photocraft/issues/392
	cargo build --frozen --release -p $pkgname -p $pkgname-cli
}

package() {
	depends+=(libasound.so
	          libgcc_s.so)
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"{,-cli}
	install -Dm0644 -t "$pkgdir/usr/share/applications/" "packaging/linux/ai.storyteller.$pkgname.desktop"
	install -Dm0644 -t "$pkgdir/usr/share/mime/packages/" "packaging/linux/ai.storyteller.$pkgname.mime.xml"
	# install -Dm0644 -t "$pkgdir/usr/share/icons/hicolor/scalable/" assets/app-icon/hicolor/scalable/apps/ai.storyteller.$pkgname.svg
	for s in ${_icons[@]}; do
		local dim="${s}x${s}"
		install -Dm0644 -t "$pkgdir/usr/share/icons/hicolor/$dim/apps/" assets/app-icon/hicolor/$dim/apps/ai.storyteller.$pkgname.png
	done
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE-{APACHE,MIT}
}
