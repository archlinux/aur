# Maintainer: Kostiantyn Kushnir <chpock@gmail.com>
pkgname=openusage-cli
pkgver=0.1.0
pkgrel=1
pkgdesc="Local daemon and CLI for AI provider usage/quota via CrossUsage plugins"
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
sha256sums=('d42227aa4447dc8b7f00b6bb06f45eeaa339da8cbc4d15efc269b1dcef994fdc')

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
    install -dm755 "$pkgdir/usr/share/openusage-cli/plugins"
    cp -a vendor/crossusage/plugins/. "$pkgdir/usr/share/openusage-cli/plugins/"
    rm -rf "$pkgdir/usr/share/openusage-cli/plugins/mock"

    # Install plugin overrides
    install -dm755 "$pkgdir/usr/share/openusage-cli/plugin-overrides"
    cp -a plugin-overrides/. "$pkgdir/usr/share/openusage-cli/plugin-overrides/"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 vendor/crossusage/LICENSE "$pkgdir/usr/share/licenses/$pkgname/CROSSUSAGE-LICENSE"
}
