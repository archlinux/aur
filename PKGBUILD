# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=subcraft-git
_pkgname=${pkgname%-git}
pkgver=0.1.8.r0.g56a23a7
pkgrel=2
url="https://aalzard.github.io/$_pkgname"
_url="https://github.com/Aalzard/$_pkgname"
pkgdesc='vibe coded clean-room reimplementation of Adobe Substance Painter (Git HEAD)'
arch=(x86_64)
license=(MIT Apache-2.0)
depends=(glibc # libc.so libm.so
         libgcc)
makedepends=(cargo
             git)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git+$_url.git")
sha256sums=('SKIP')

_srcenv() {
	cd "$_pkgname"
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

pkgver() {
	cd "$_pkgname"
	git describe --long --tags --abbrev=7 --match="v*" HEAD |
			sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	_srcenv
	cargo build --frozen --release
}

package() {
	depends+=(libgcc_s.so)
	cd "$_pkgname"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/applications/" "packaging/linux/$_pkgname.desktop"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE-{APACHE,MIT}
}
