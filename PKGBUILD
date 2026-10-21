# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=mailcraft
pkgver=0.6.0
pkgrel=1
url="https://github.com/UCS-Care-Group/$pkgname"
pkgdesc='vibe coded clean-room reimplementation of Microsoft Outlook'
arch=(x86_64)
license=(MIT Apache-2.0)
depends=(glibc # libc.so libm.so
         hicolor-icon-theme
         libgcc)
makedepends=(cargo)
_archive="$pkgname-$pkgver"
source=("$url/archive/refs/tags/v$pkgver/$_archive.tar.gz")
sha256sums=('cfe592208072a45b4b970f24b660f3a4ae75d35955fc0d5c1ac39e23477e59f8')

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
	install -Dm0644 -t "$pkgdir/usr/share/applications/" "packaging/linux/io.github.billsecond.$pkgname.desktop"
	install -Dm0644 -t "$pkgdir/usr/share/mime/packages/" "packaging/linux/io.github.billsecond.$pkgname.mime.xml"
	# install -Dm0644 -t "$pkgdir/usr/share/icons/hicolor/scalable/" assets/app-icon/hicolor/scalable/apps/io.github.billsecond.$pkgname.svg
	for s in ${_icons[@]}; do
		local dim="${s}x${s}"
		install -Dm0644 -t "$pkgdir/usr/share/icons/hicolor/$dim/apps/" assets/app-icon/hicolor/$dim/apps/io.github.billsecond.$pkgname.png
	done
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE-{APACHE,MIT}
}
