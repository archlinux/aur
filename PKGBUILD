# Maintainer: Birbwell <jmbirdwell.us@gmail.com>

pkgname=linuxmix-git
pkgver=0.1.4
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
    adaf7ce12ccead24b2321d4343a638f4e9cdc82060e64f17c816278a474bf4b0
    fa4a2d987d35b8a2b29314c70d560c26bf5672cce467df0ca29704d8f024a66b
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
