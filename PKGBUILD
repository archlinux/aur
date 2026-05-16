# Maintainer: Kostiantyn Kushnir <chpock@gmail.com>
pkgname=openusage-cli
pkgver=0.0.10
pkgrel=1
pkgdesc="Local daemon and CLI for AI provider usage/quota via OpenUsage plugins"
arch=('x86_64' 'aarch64')
url="https://github.com/chpock/openusage-cli"
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('cargo' 'cmake' 'clang' 'nasm')
options=(!lto)
optdepends=('opencode: AI assistant integration')
provides=("$pkgname=$pkgver")
conflicts=('openusage-cli-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/chpock/openusage-cli/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6005d76002a41b6d6d70b075e81eb4a440a4cc2c1d1ea9797c1e68772c5e1078')

build() {
    cd "$pkgname-$pkgver"
    export CARGO_TARGET_DIR=target
    export OPENUSAGE_BUILD_VERSION="$pkgver"
    /usr/bin/cargo build --locked --release
}

package() {
    cd "$pkgname-$pkgver"

    # Install binary
    install -Dm755 "target/release/openusage-cli" "$pkgdir/usr/bin/openusage-cli"

    # Install plugins
    install -dm755 "$pkgdir/usr/share/openusage-cli/openusage-plugins"
    cp -a vendor/openusage/plugins/. "$pkgdir/usr/share/openusage-cli/openusage-plugins/"
    rm -rf "$pkgdir/usr/share/openusage-cli/openusage-plugins/mock"

    # Install plugin overrides
    install -dm755 "$pkgdir/usr/share/openusage-cli/plugin-overrides"
    cp -a plugin-overrides/. "$pkgdir/usr/share/openusage-cli/plugin-overrides/"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
