# Maintainer: Birbwell <jmbirdwell.us@gmail.com>

pkgname=linuxmix-git
pkgver=0.1.3
pkgrel=2
arch=(any)
url=https://codeberg.org/Birbwell/linuxmix

pkgdesc="Implements SteelSeries' ChatMix feature in Linux."

source=(
    "linuxmix::git+https://codeberg.org/Birbwell/linuxmix"
    "linuxmix.service"
    "99-linuxmix.rules"
)
sha256sums=(
    SKIP
    SKIP
    SKIP
)

depends=(pipewire-pulse)
makedepends=(cargo)

options=(strip !debug)

install=linuxmix.install

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd linuxmix
    cargo fetch --locked --target host-tuple
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd linuxmix
    cargo build --release --frozen --all-features
}

package() {
    # Install binary
    install -Dm0755 -t "$pkgdir/usr/bin" "$srcdir/linuxmix/target/release/linuxmix"

    # Install service
    install -Dm0755 -t "$pkgdir/usr/lib/systemd/user/" "$srcdir/linuxmix.service"

    # Install udev rules
    install -Dm0755 -t "$pkgdir/etc/udev/rules.d/" "$srcdir/99-linuxmix.rules"
}
