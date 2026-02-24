# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=oxicord
pkgver=0.1.9
pkgrel=2
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
b2sums=('ec8747f83c1392ec1b7617c1c823cd69ef1c0cbb932dc8886f024e4ce8f520e01301f12fc94c0465f132a6d75e2c4241fe7b7b51b5d1221b17f93f435c799340')

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
