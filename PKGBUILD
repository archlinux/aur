# Maintainer: Kostiantyn Kushnir <...>
pkgname=openusage-cli
pkgver=0.0.6
pkgrel=1
pkgdesc="HTTP daemon for executing OpenUsage plugins and exposing local usage snapshots"
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
sha256sums=('fdab507f2edfc90c9f1a09f9396cc48991186d176ffbab22eff1875a6933afae')

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

    # Install plugin overrides
    install -dm755 "$pkgdir/usr/share/openusage-cli/plugin-overrides"
    cp -a plugin-overrides/. "$pkgdir/usr/share/openusage-cli/plugin-overrides/"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
