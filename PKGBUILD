# Maintainer: Birbwell <jmbirdwell.us@gmail.com>

pkgname=linuxmix-git
pkgver=0.3.0
pkgrel=3
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
    adaf7ce12ccead24b2321d4343a638f4e9cdc82060e64f17c816278a474bf4b0
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

    # Install service
    install -Dm0755 -t "$pkgdir/usr/lib/systemd/user/" "$srcdir/linuxmix.service"

    # Install udev rules
    install -Dm0755 -t "$pkgdir/etc/udev/rules.d/" "$srcdir/99-linuxmix.rules"
}
