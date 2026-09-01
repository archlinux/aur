pkgname=vnt
pkgver=2.0.4
pkgrel=1
pkgdesc="An efficient VPN. 简便高效的异地组网、内网穿透工具"
arch=(x86_64)
url=https://rustvnt.com/
license=(Apache-2.0)
depends=(libgcc glibc)
makedepends=(cargo clang pnpm nodejs-lts-jod protobuf)
optdepends=('vnts: The Server of vnt.')
options=(!lto)
backup=(etc/vnt/config.toml)
install=vnt.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/vnt-dev/vnt/archive/refs/tags/v$pkgver.tar.gz"
        "vnt-cli@.service"
        "vnt-web@.service")
sha256sums=('bf68a346aabd44955ed813b6a2c5520184c22375d21eca09696671aafdcfa7f0'
            '0787b510c61595a498570f304ba9a6cdc690a879bbaab4838252968f6034e17a'
            '501ab93300adbb44e03d1f52b7c919e6857f0cdca3d23b69d6ed4498e164c78d')

prepare(){
    cd "$srcdir/$pkgname-$pkgver"
    pnpm install --frozen-lockfile
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --target host-tuple
}

build(){
    cd "$srcdir/$pkgname-$pkgver"
    pnpm build:web
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
    ./target/release/vnt2_cli --conf-example
}

package(){
    cd "$srcdir/$pkgname-$pkgver"
    find target/release \
        -maxdepth 1 \
        -executable \
        -type f \
        -exec install -Dvm0755 -t "$pkgdir/usr/bin" {} +
    install -Dvm644  -t "$pkgdir/usr/lib/systemd/system/" \
        "$srcdir/vnt-cli@.service" \
        "$srcdir/vnt-web@.service"
    install -Dvm644 example_config.toml "$pkgdir/etc/vnt/config.toml"
}
