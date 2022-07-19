# Maintainer: Michael Dorst <m@mdorst.net>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Konstantin Stepanov <me@kstep.me>

pkgname=cargo-pkgbuild
pkgver=0.1.1
_sha=e5fea7fa4f083a2a78e5347c0ec33c17f931c187
pkgrel=1
pkgdesc='ArchLinux PKGBULD generator from Cargo.toml manifest'
arch=(x86_64 i686 armv6h armv7h)
url='https://github.com/kstep/cargo-pkgbuild'
license=(MIT Apache)
makedepends=(cargo)
depends=(gcc-libs)
_archive="$pkgname-$_sha"
source=("$_archive.tar.gz::$url/archive/$_sha.tar.gz")
sha256sums=('0d67691b9674614dc64229891316297a6272ba9a6ffe3d48215292dfc44ff8aa')

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
