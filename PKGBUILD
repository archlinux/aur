# Maintainer: yuioto <yuiotochan@outlook.com>

pkgname=fav-git
_pkgname="${pkgname%-git}"
pkgver=v0.1.9.r0.gb00e361
pkgrel=1
pkgdesc='Back up your favorite bilibili resources with CLI'
url="https://github.com/kingwingfly/${_pkgname}"
license=('MIT')
arch=('x86_64')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-bin")
makedepends=('cargo' 'git')

source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	( set -o pipefail
		git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)

}

prepare() {
	cd "$_pkgname"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cd "$_pkgname"
	cargo build --release --frozen
}

#check() {
# 	export RUSTUP_TOOLCHAIN=stable
# 	cd "$_pkgname"
# 	cargo test --frozen
#}

package() {
	cd "$_pkgname"
	install -Dm755 "target/release/$_pkgname" -t "$pkgdir/usr/bin"
}
