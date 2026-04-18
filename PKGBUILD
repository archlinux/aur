# Maintainer: Shorin <shorin@example.com>
_pkgname=clipsync
pkgname=linuxqq-clipsync-git
pkgver=r23.a1d662a
pkgrel=2
pkgdesc="修复Linuxqq以Wayland运行时的剪贴板异常。"
arch=('x86_64')
url="https://github.com/SHORiN-KiWATA/linuxqq-clipsync"
license=('MIT')
depends=('xclip' 'wl-clipboard' 'clipnotify')
makedepends=('git' 'cargo')

provides=('linuxqq-clipsync' 'clipsync' 'clipsync-git')
conflicts=('linuxqq-clipsync' 'clipsync' 'clipsync-git')
replaces=('clipsync-git')
install="${pkgname}.install"
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
    install -Dm755 "target/release/linuxqq-clipsync" "${pkgdir}/usr/bin/linuxqq-clipsync"
    install -Dm644 linuxqq-clipsync.service "${pkgdir}/usr/lib/systemd/user/linuxqq-clipsync.service"
}
