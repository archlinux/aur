# Maintainer:
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Konstantin Stepanov <me@kstep.me>

pkgname=cargo-pkgbuild
pkgver=0.1.1
_sha=70158570f553d1b3f4426b1cae47be4d5b4c6877
pkgrel=1
pkgdesc='ArchLinux PKGBULD generator from Cargo.toml manifest'
arch=(x86_64 i686 armv6h armv7h)
url='https://github.com/kstep/cargo-pkgbuild'
license=(MIT Apache)
makedepends=(cargo)
_archive="$pkgname-$_sha"
source=("$_archive.tar.gz::$url/archive/$_sha.tar.gz")
sha256sums=('cd9cfcd6a4cb7c704a7cd45016766394a00c1995ea376f7d63f46b9d1333eeeb')

pkgver() {
	cd "$_archive"
	awk -F\" '/^version/ { print $2; exit }' Cargo.toml
}

prepare() {
	cd "$_archive"
	# Upstream lockfile is buggered in v0.1.1
	cargo update
	cargo fetch --locked --target $CARCH-unknown-linux-gnu
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
	cargo test --frozen
}

package() {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${pkgname%-git}"
}
