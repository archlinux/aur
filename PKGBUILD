# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=subcraft
pkgver=0.2.5
pkgrel=1
url="https://aalzard.github.io/$pkgname"
_url="https://github.com/Aalzard/$pkgname"
pkgdesc='vibe coded clean-room reimplementation of Adobe Substance Painter'
arch=(x86_64)
license=(MIT Apache-2.0)
depends=(glibc # libc.so libm.so
         libgcc)
makedepends=(cargo)
_archive="$pkgname-$pkgver"
source=("$_url/archive/refs/tags/v$pkgver/$_archive.tar.gz")
sha256sums=('5618a709d1c06cf8e507c9fd908210a1ac02e33cb5fc9367fa472f1e4745d267')

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
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/applications/" "packaging/linux/$pkgname.desktop"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE-{APACHE,MIT}
}
