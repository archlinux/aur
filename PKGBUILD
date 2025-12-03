# Maintainer: whiteman808 <whiteman808 at paraboletancza dot org>
# Contributor: Bastien "neitsab" Traverse <neitsab at archlinux dot org>
# Contributor: Michael Dorst <m at mdorst dot net>
# Contributor: Caleb Maclennan <caleb at alerque dot com>
# Contributor: Konstantin Stepanov <me at kstep dot me>

pkgname=cargo-pkgbuild-git
_pkgname=cargo-pkgbuild
pkgver=0.2.0
pkgrel=1
pkgdesc='PKGBUILD generator from Cargo.toml manifest'
arch=(x86_64 i686 armv6h armv7h)
url='https://github.com/kstep/cargo-pkgbuild'
license=('Apache-2.0 OR MIT')
makedepends=(cargo git)
depends=(gcc-libs)
source=("$pkgname::git+https://github.com/kstep/cargo-pkgbuild.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	awk -F\" '/^version/ { print $2; exit }' Cargo.toml
}

prepare() {
	cd "$srcdir/$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$srcdir/$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd "$srcdir/$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
	install -Dm644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
