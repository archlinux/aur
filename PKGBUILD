# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: replydev <commoncargo@tutanota.com>

pkgname=cotp-git
_pkgname=${pkgname%-git}
pkgver=1.4.5.r1.g16963ad
pkgrel=2
pkgdesc='Trustworthy, encrypted, command-line TOTP/HOTP authenticator app with import functionality'
arch=(x86_64)
url="https://github.com/replydev/$_pkgname"
license=(GPL-3.0-only)
depends=(gcc-libs # libgcc_s.so
         glibc) # libc.so libm.so
makedepends=(cargo
             git
             python)
depends=(libxcb
         libxkbcommon-x11)
conflicts=("$_pkgname")
provides=("$_pkgname=$pkgver")
source=("git+$url.git")
sha256sums=('SKIP')

prepare(){
	cd "$_pkgname"
	export RUSTUP_TOOLCHAIN=stable
	cargo update
	cargo fetch --locked --target "$(rustc --print host-tuple)"
}

pkgver() {
	cd "$_pkgname"
	git describe --long --abbrev=7 --tags --match='v*' |
		sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_pkgname"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd "$_pkgname"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features
}

package() {
	cd "$_pkgname"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
}
