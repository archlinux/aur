# Maintainer: Dae Euhwa <daedaevibin@ik.me>

pkgname=ddsc-git
pkgver=1.7.0
pkgrel=1
pkgdesc="Dynamic Discord Rich Presence based on active COSMIC windows (git)"
arch=('x86_64')
url="https://github.com/Veridian-Zenith/DDS"
license=('OSL-3.0')
depends=('glibc')
makedepends=('cargo' 'git' 'clang' 'lld')
provides=('ddsc')
conflicts=('ddsc' 'ddsc-bin')
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
    cargo build --frozen --release -p ddsc
}

check() {
    cd DDS
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen -p ddsc
}

package() {
    cd DDS
    install -Dm755 "target/release/ddsc" -t "$pkgdir/usr/bin/"
    install -Dm755 scripts/discord-monitor.sh "$pkgdir/usr/bin/discord-monitor-ddsc.sh"
    install -Dm644 scripts/discord-monitor-cosmic.service -t "$pkgdir/usr/lib/systemd/user/"
    install -Dm644 common/src/config/default-config-cosmic.json "$pkgdir/usr/share/ddsc/config.json"
    install -Dm644 cosmic/autostart/ddsc.desktop -t "$pkgdir/usr/share/applications/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
