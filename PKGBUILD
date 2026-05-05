# Maintainer: Hao Long <imlonghao@archlinuxcn.org>

pkgname=vykar
pkgver=0.15.0
pkgrel=1
pkgdesc='Fast, encrypted, deduplicated backups in Rust'
url='https://github.com/borgbase/vykar'
license=('GPL-3.0-or-later')
makedepends=('cargo' 'cairo' 'pango' 'atk')
depends=('glibc' 'libgcc' 'libstdc++' 'freetype2' 'gtk3' 'fontconfig' 'gdk-pixbuf2' 'glib2' 'xdotool')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('667fe85312df60b09847bf8e9fa31b98cbbc18a0b49a8cbf35ccfe480ded98786b0d31409080aa4da0870cd019584a1fdd719594423ff94e50e711e35a85df89')
options=(!lto)

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    # https://github.com/aws/aws-lc-rs/issues/1008#issuecomment-3774105038
    export AWS_LC_SYS_NO_JITTER_ENTROPY=1
    cargo build --frozen --release --all-features
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname-$pkgver"
    ls -al "target/release/$pkgname"
    install -Dm0755 -t "$pkgdir/usr/bin/" target/release/vykar target/release/vykar-server target/release/vykar-gui
    install -Dm0644 -t "$pkgdir/etc/vykar/" vykar.example.yaml
}
