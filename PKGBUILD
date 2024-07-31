# Maintainer: Jax Young <jaxvanyang@gmail.com>

pkgname=2048-rs-git
_pkgname=game-2048
_reponame=2048-rs
pkgver=0.5.2.r75.77fa495
pkgrel=1
pkgdesc="CLI implementation of the popular 2048 game written in Rust"
arch=('i686' 'x86_64')
url="https://github.com/pierrechevalier83/$_reponame"
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('git' 'cargo')
provides=("${pkgname%-git}=$pkgver")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/pierrechevalier83/2048-rs.git')
sha256sums=('SKIP')

pkgver() {
	cd "$_reponame"

	printf "%s.r%s.%s" "$(cargo pkgid --offline | sed -E 's/^.*@//')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$_reponame"

	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$_reponame"

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

check() {
	cd "$_reponame"

	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen
}

package() {
	cd "$_reponame"
	install -D target/release/game-2048 "$pkgdir/usr/bin/2048"
}
