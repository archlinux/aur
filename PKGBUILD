# shellcheck shell=bash
# Tests assume interactive terminal
BUILDENV+=(!check)

pkgname=gitu
pkgver=0.6.2
pkgrel=1
pkgdesc='A TUI Git client inspired by Magit'
url='https://github.com/altsem/gitu'
arch=(x86_64 i686)
license=(MIT)
depends=(gcc-libs glibc libgit2)
makedepends=(cargo)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('f8fd08385906e3c1a20349518ff5dde3418e183eba5b7083c54d01433a2609a2')

prepare() {
    cd "$_archive"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

_srcenv() {
    cd "$_archive"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export LIBGIT2_SYS_USE_PKG_CONFIG=1
}

build() {
    _srcenv
    cargo build --frozen --release
}

check() {
    _srcenv
    cargo test --frozen --release
}

package() {
    cd "$_archive"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
