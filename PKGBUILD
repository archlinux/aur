# Maintainer: csmantle <aur at csmantle dot top>
# shellcheck shell=bash disable=SC2034,SC2154,SC2164

_pkgname=samply
pkgname="$_pkgname"-git
pkgver=0.13.1.r325.g382a2f9
pkgrel=2
pkgdesc='A command line profiler for macOS and Linux'
arch=('x86_64' 'aarch64')
url='https://github.com/mstange/samply'
license=('Apache-2.0 OR MIT')
depends=('gcc-libs')
makedepends=('git' 'rust' 'cargo')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname"::git+"$url".git)
sha256sums=('SKIP')
# FIXME https://github.com/briansmith/ring/issues/1444
options=('!lto')

pkgver() {
	cd "$srcdir"/"$_pkgname"
        git describe --long --tags --match 'samply-v*' --abbrev=7 2>/dev/null | sed 's/^samply-v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
                printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir"/"$_pkgname"
        export RUSTUP_TOOLCHAIN=stable
        cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$srcdir"/"$_pkgname"
        export RUSTUP_TOOLCHAIN=stable
        export CARGO_TARGET_DIR=target
        cargo build --release --locked --package samply
}

check() {
	cd "$srcdir"/"$_pkgname"
        export RUSTUP_TOOLCHAIN=stable
        export CARGO_TARGET_DIR=target
        cargo test --release --locked --package samply
}

package() {
        cd "$srcdir"/"$_pkgname"
        install -vDm755 target/release/samply -t "$pkgdir"/usr/bin/
        install -vDm644 LICENSE-MIT -t "$pkgdir"/usr/share/licenses/"$pkgname"/
        install -vDm644 README.md -t "$pkgdir"/usr/share/doc/"$pkgname"/
}
