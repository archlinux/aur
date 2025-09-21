# Maintainer: SelfRef <arch@selfref.dev>

_pkgbase=msedit
pkgname="$_pkgbase-git"
pkgver=1.2.0.r37.gbb56984
pkgrel=1
pkgdesc="A simple editor for simple needs (Microsoft Edit)"
arch=('x86_64' 'aarch64')
url="https://github.com/microsoft/edit"
license=('MIT')
makedepends=('git' 'cargo-nightly')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
source=("$_pkgbase::git+https://github.com/microsoft/edit.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgbase"
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
	cd "$_pkgbase"
	export RUSTUP_TOOLCHAIN=nightly
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$_pkgbase"
	export RUSTUP_TOOLCHAIN=nightly
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

check() {
	cd "$_pkgbase"
	export RUSTUP_TOOLCHAIN=nightly
	cargo test --frozen
}

package() {
	cd "$_pkgbase"
	install -Dm755 "target/release/edit" "$pkgdir/usr/bin/ms-edit"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$_pkgbase/LICENSE"
}
