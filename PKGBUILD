# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Ex-Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Tuhana GAYRETLİ <tuhana at tuta dot io>
# shellcheck disable=SC2034,SC2148,SC2164,SC2154

pkgname=treefetch-git
_pkgname=${pkgname%-git}
pkgver=2.0.0.r23.g02f65e1
pkgrel=1
pkgdesc="Lightning-fast system fetch tool built with Rust"
arch=('x86_64')
url="https://github.com/angelofallars/treefetch"
license=('GPL3')
depends=('gcc-libs')
makedepends=('cargo' 'git')
provides=("$_pkgname=${pkgver%.r*}")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	git -C "$_pkgname" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
	cd "$_pkgname"
	cargo update
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
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
	install -D "target/release/$_pkgname" -t "$pkgdir/usr/bin/"
}
