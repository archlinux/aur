# Maintainer: Dae Euhwa <daedaevibin@ik.me>

pkgname=ddsh-git
pkgver=1.2.2.r3.g732ed0a
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
b2sums=('SKIP')

pkgver() {
    cd "${pkgname%-git}"
    git describe --long --tags | sed 's/^v//;s/-/./g'
}

prepare() {
    cd "${pkgname%-git}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | grep host | awk '{print $2}')"
}

build() {
    cd "${pkgname%-git}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export RUSTFLAGS="-C linker=clang -C link-arg=-fuse-ld=lld"
    cargo build --frozen --release --all-features
}

check() {
    cd "${pkgname%-git}"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "${pkgname%-git}"
    install -Dm755 "target/release/ddsh" -t "$pkgdir/usr/bin/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
