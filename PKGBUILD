# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=solidcraft
pkgver=0.27.1
pkgrel=1
url="https://$pkgname.io"
_url="https://github.com/tangency-labs/$pkgname"
pkgdesc='vibe coded clean-room reimplementation of Autodesk Fusion'
arch=(x86_64)
license=(MIT Apache-2.0)
depends=(glibc # libc.so libm.so
         hicolor-icon-theme
         libgcc)
makedepends=(cargo)
_archive="$pkgname-$pkgver"
source=("$_url/archive/refs/tags/v$pkgver/$_archive.tar.gz")
sha256sums=('b8191c9b2e1005527e775eeb4f5f5e0c7bebd0f75646dc2f9231d0996135bd1e')

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

_icons=(512 256 128 64 48 32 24 16)

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
	install -Dm0644 -t "$pkgdir/usr/share/applications/" "./assets/platforms/linux/io.tangencylabs.$pkgname.desktop"
	install -Dm0644 -t "$pkgdir/usr/share/mime/packages/" "assets/platforms/linux/io.tangencylabs.$pkgname.mime.xml"
	for s in ${_icons[@]}; do
		local dim="${s}x${s}"
		install -Dm0644 -t "$pkgdir/usr/share/icons/hicolor/$dim/apps/" assets/icons/app/linux/exports/hicolor/$dim/apps/io.tangencylabs.$pkgname.png
	done
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE-{APACHE,MIT}
}
