# Maintainer: Shorin <shorin@example.com>
_pkgname=clipsync
pkgname=clipsync-git
pkgver=0.1.0.r1.g1a2b3c4 
pkgrel=1
pkgdesc="Clipboard synchronization daemon for Wayland Compositor (X11 <--> Wayland)"
arch=('x86_64' 'aarch64')
url="https://github.com/SHORiN-KiWATA/clipsync"
license=('MIT')
depends=('xclip' 'wl-clipboard' 'clipnotify' 'gcc-libs' 'glibc')
makedepends=('git' 'cargo')
provides=("$_pkgname")
conflicts=("$_pkgname")

# ====== 重点修改这里 ======
source=("$_pkgname::git+${url}.git#branch=rust")
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
