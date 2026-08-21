# Maintainer: Dae Euhwa <daedaevibin@ik.me>

pkgname=ddsn-git
pkgver=1.7.0
pkgrel=1
pkgdesc="Dynamic Discord Rich Presence based on active Niri windows (git)"
arch=('x86_64')
url="https://github.com/Veridian-Zenith/DDS"
license=('MIT')
depends=('glibc' 'niri')
makedepends=('cargo' 'git' 'clang' 'lld')
provides=('ddsn')
conflicts=('ddsn' 'ddsn-bin')
source=("git+$url.git#branch=main")
b2sums=('SKIP')

pkgver() {
    cd DDS
    git describe --long --tags | sed 's/^v//;s/-/./g'
}

prepare() {
    cd DDS
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | grep host | awk '{print $2}')"
}

build() {
    cd DDS
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export RUSTFLAGS="-C linker=clang -C link-arg=-fuse-ld=lld"
    cargo build --frozen --release -p ddsn
}

check() {
    cd DDS
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen -p ddsn
}

package() {
    cd DDS
    install -Dm755 "target/release/ddsn" -t "$pkgdir/usr/bin/"
    install -Dm755 scripts/discord-monitor.sh "$pkgdir/usr/bin/discord-monitor-ddsn.sh"
    install -Dm644 scripts/discord-monitor-niri.service -t "$pkgdir/usr/lib/systemd/user/"
    install -Dm644 common/src/config/default-config-niri.json "$pkgdir/usr/share/ddsn/config.json"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
