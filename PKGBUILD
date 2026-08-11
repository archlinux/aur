# Maintainer: Forest Ames <fox dot ames at smallfox dot io>
_pkgcore=nbted
pkgname=nbted-git
pkgver=1.5.0.r39.g8ae6d08
pkgrel=1
pkgdesc="Command-line NBT editor"
arch=('x86_64' 'aarch64')
url="https://github.com/C4K3/nbted"
license=('CC0-1.0')
depends=('glibc' 'libgcc')
makedepends=('cargo' 'git')
checkdepends=('cargo')
provides=("${_pkgcore}")
conflicts=("${_pkgcore}")
source=("git+https://github.com/C4K3/${_pkgcore}")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgcore"
	git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$_pkgcore"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target host-tuple
}

build() {
	cd "$_pkgcore"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
    cd "$_pkgcore"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$_pkgcore"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgcore"
}
