# Maintainer: Dae Euhwa <daedaevibin@ik.me>

pkgname=ddsh-git
pkgver=1.3.0.0.g5797148
pkgrel=1
pkgdesc="Dynamic Discord Rich Presence based on active Hyprland windows (git)"
arch=('x86_64')
url="https://github.com/Veridian-Zenith/discord-dynamic-status-hyprland"
license=('MIT')
depends=('glibc')
makedepends=('cargo' 'git' 'clang' 'lld')
provides=('ddsh')
conflicts=('ddsh' 'ddsh-bin')
source=("git+$url.git#branch=main")
b2sums=('SKIP')

pkgver() {
    cd discord-dynamic-status-hyprland
    git describe --long --tags | sed 's/^v//;s/-/./g'
}

prepare() {
    cd discord-dynamic-status-hyprland
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | grep host | awk '{print $2}')"
}

build() {
    cd discord-dynamic-status-hyprland
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export RUSTFLAGS="-C linker=clang -C link-arg=-fuse-ld=lld"
    cargo build --frozen --release -p ddsh
}

check() {
    cd discord-dynamic-status-hyprland
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen -p ddsh
}

package() {
    cd discord-dynamic-status-hyprland
    install -Dm755 "target/release/ddsh" -t "$pkgdir/usr/bin/"
    install -Dm755 scripts/discord-monitor.sh "$pkgdir/usr/bin/discord-monitor-ddsh.sh"
    install -Dm644 scripts/discord-monitor-hyprland.service -t "$pkgdir/usr/lib/systemd/user/"
    install -Dm644 common/src/config/default-config.json "$pkgdir/usr/share/ddsh/config.json"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
