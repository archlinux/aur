# Maintainer: Shorin <shorin@example.com>
_pkgname=clipsync
pkgname=clipsync-git
pkgver=r20.ecbf735 
pkgrel=3
pkgdesc="Clipboard synchronization daemon for Wayland Compositor (X11 <--> Wayland)"
arch=('x86_64' 'aarch64')
url="https://github.com/SHORiN-KiWATA/clipsync"
license=('MIT')
depends=('xclip' 'wl-clipboard' 'clipnotify' 'gcc-libs' 'glibc')
makedepends=('git' 'cargo')
provides=("$_pkgname")
conflicts=("$_pkgname")

source=("$_pkgname::git+${url}.git")
# ========================

sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "$_pkgname"
    install -Dm755 "target/release/clipsync" "${pkgdir}/usr/bin/clipsync"
    install -Dm644 clipsync.service "${pkgdir}/usr/lib/systemd/user/clipsync.service"
}
