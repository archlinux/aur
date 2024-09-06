# Maintainer: Bastien "neitsab" Traverse <neitsab@archlinux.org>
# Contributor: Michael Dorst <m@mdorst.net>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Konstantin Stepanov <me@kstep.me>

pkgname=cargo-pkgbuild
pkgver=0.2.0
# target commit hash
_sha=0fc6d2767ca7fe59dd760b9d4203c78662bc1b7c
pkgrel=1
pkgdesc='ArchLinux PKGBUILD generator from Cargo.toml manifest'
arch=(x86_64 i686 armv6h armv7h)
url='https://github.com/kstep/cargo-pkgbuild'
license=('Apache-2.0 OR MIT')
makedepends=(cargo)
depends=(gcc-libs)
_archive="$pkgname-$_sha"
source=("$_archive.tar.gz::$url/archive/$_sha.tar.gz")
sha256sums=('a295df0a83493004158a04f5a5756128d50a400a758ead5afb8df3eeed056028')

pkgver() {
	cd "$_archive"
	awk -F\" '/^version/ { print $2; exit }' Cargo.toml
}

prepare() {
	cd "$_archive"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$_archive"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd "$_archive"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features
}

package() {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
