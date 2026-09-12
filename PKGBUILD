# Maintainer: Birbwell <jmbirdwell.us@gmail.com>

pkgname=linuxmix-git
pkgver=0.3.1
pkgrel=1
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
    e2a1f92be32c26c2fac0d04ed8ff9968adeb2badcd53f85af47940edbe91aeb6
    193c74c29454f4412be2bdb4e86115029d378d88537104bb94843fbc189c69fe
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

    # Install controller
    install -Dm0755 -t "$pkgdir/usr/bin" "$srcdir/linuxmix/target/release/linuxmixctl"

    # Install service
    install -Dm0755 -t "$pkgdir/usr/lib/systemd/user/" "$srcdir/linuxmix.service"

    # Install udev rules
    install -Dm0755 -t "$pkgdir/etc/udev/rules.d/" "$srcdir/99-linuxmix.rules"
}
