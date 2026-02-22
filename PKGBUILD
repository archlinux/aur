# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=oxicord
pkgver=0.1.9
pkgrel=1
pkgdesc='Vim-native Discord TUI for terminal enthusiasts'
arch=(x86_64)
url='https://github.com/linuxmobile/oxicord'
license=(GPL-3.0-only)
depends=(chafa dbus glibc libgcc)
makedepends=(cargo git)
options=(!lto)

# change back when key can be found on keyserver: https://github.com/linuxmobile/oxicord/issues/20
source=("git+$url.git#tag=v$pkgver")
#source=("git+$url.git#tag=v$pkgver?signed")
#validpgpkeys=('A3C75146365747E3B7D2FF57481EFFCF2C7B8C7B') # Braian A. Diez <bdiez19@gmail.com>
b2sums=('eefe17661d867a05b45b5fe6be36c04dcd65b6ff589e021036a2e583e9f303de39dcd49a1895c16d21cfd550ef56633dffa63cae3ef4219b3ed262146adcd65a')

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
