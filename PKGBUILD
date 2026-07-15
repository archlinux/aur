# Maintainer: Dae Euhwa <daedaevibin@ik.me>

pkgname=ddsh-git
pkgver=r11.g732ed0a
pkgrel=1
pkgdesc="Dynamic Discord Rich Presence based on active Hyprland windows (git)"
arch=('x86_64')
url="https://github.com/Veridian-Zenith/discord-dynamic-status-hyprland"
license=('MIT')
depends=('glibc')
makedepends=('cargo' 'git' 'clang' 'lld')
provides=('ddsh')
conflicts=('ddsh' 'ddsh-bin')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${pkgname%-git}"
    cargo fetch --target "$(rustc -vV | grep host | awk '{print $2}')"
}

build() {
    cd "${pkgname%-git}"
    export CARGO_TARGET_DIR=target
    export RUSTFLAGS="-C linker=clang -C link-arg=-fuse-ld=lld"
    cargo build --frozen --release
}

package() {
    cd "${pkgname%-git}"
    install -Dm755 "target/release/discord-dynamic-status-hyprland" "$pkgdir/usr/bin/ddsh"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
