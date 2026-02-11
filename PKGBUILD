# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=oxicord-git
pkgver=0.1.8.r13.gf3591d6
pkgrel=1
pkgdesc='Vim-native Discord TUI for terminal enthusiasts'
arch=(x86_64)
url='https://github.com/linuxmobile/oxicord'
license=(GPL-3.0-only)
depends=(chafa dbus gcc-libs glibc)
makedepends=(cargo git)
options=(!lto)
source=("git+$url.git")
b2sums=('SKIP')

pkgver() {
    cd oxicord
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
    cd oxicord
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple
}

build() {
    cd oxicord
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export CARGO_PROFILE_RELEASE_DEBUG=true
    export CARGO_PROFILE_RELEASE_STRIP=none
    cargo build --frozen --release --all-features
}

check() {
    cd oxicord
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd oxicord
    install -Dm755 target/release/oxicord -t "$pkgdir/usr/bin"
}
