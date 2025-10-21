# Maintainer: Mylloon <aur@mylloon.fr>

# shellcheck disable=SC2034,SC2148,SC2154

pkgname='cal8tor-git'
pkgver=r121.98624cc
pkgrel=1
pkgdesc='Timetable extractor for the computer science degree of Paris 8'
arch=('x86_64')
url=https://git.mylloon.fr/Anri/cal8tor
makedepends=('git' 'cargo')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://git.mylloon.fr/Anri/${pkgname%-git}.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}" || exit
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/${pkgname%-git}" || exit
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cd "$srcdir/${pkgname%-git}" || exit
    cargo build --frozen --release --all-features
}

package() {
    install -Dm755 "$srcdir/${pkgname%-git}/target/release/${pkgname%-git}" "$pkgdir/usr/bin/${pkgname%-git}"
}
