pkgname=vnt
pkgver=1.2.16
pkgrel=1
pkgdesc="An efficient VPN. 简便高效的异地组网、内网穿透工具"
arch=(x86_64)
url=https://rustvnt.com/
license=(Apache-2.0)
depends=(gcc-libs glibc iproute2)
makedepends=(cargo clang)
options=(!lto)
backup=(etc/vnt/vnt-cli.yml)
source=("$pkgname-$pkgver.tar.gz::https://github.com/vnt-dev/vnt/archive/refs/tags/v$pkgver.tar.gz"
        "vnt-cli.service"
        "vnt-cli.yml")
sha256sums=('e32187fc2164800db9cb909c4a196852957e219e20bc37f8decb8221132117a6'
            'f51e7600f848a4374da2a113377d97774c239b82cc6cf6c2d3870ae75cca8307'
            '99e62f6021cc452d929df23554dc981ce58218ea6db30e7acea7f9a89683387c')

prepare(){
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build(){
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    # vn-link-cli failed to build together with vnt-cli
    cargo build --frozen --release --all-features \
        --package vn-link-cli
    cargo build --frozen --release --all-features \
        --package vnt-cli
}

package(){
    optdepends+=("sudo: Run as root automatically.")

    cd "$srcdir/$pkgname-$pkgver"
    find target/release \
        -maxdepth 1 \
        -executable \
        -type f \
        -exec install -Dvm0755 -t "$pkgdir/usr/bin" {} +
    install -Dvm644 "$srcdir/vnt-cli.service" \
        "$pkgdir/usr/lib/systemd/system/vnt-cli.service"
    install -Dvm644 "$srcdir/vnt-cli.yml" \
        "$pkgdir/etc/vnt/vnt-cli.yml"
}
