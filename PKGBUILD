# Maintainer: Yangtse Su <yangtsesu@gmail.com>

pkgname=lunar
pkgver=0.1.0
pkgrel=1
pkgdesc="Chinese lunisolar calendar CLI: a day profile, month and year grids, and a 八字 chart"
arch=('x86_64')
url="https://github.com/YangtseSu/lunar"
license=('GPL-3.0-or-later')
# libgcc provides libgcc_s.so.1, which the binary needs at runtime and which is
# not part of glibc; tzdata is read by tz-rs's TimeZone::local(), which parses
# the system tzdb and carries no copy of it. Verified with ldd and readelf.
depends=('glibc' 'libgcc' 'tzdata')
makedepends=('rust' 'cargo')
# The project sets lto, codegen-units and strip in its own [profile.release],
# so makepkg's defaults would apply a second, different set of flags.
options=('!lto' '!strip')

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a875a333e356ef3c7f676b34b3754a45df1cb6562e928be95a662bace03b9c8f')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --frozen
}

check() {
    cd "$pkgname-$pkgver"
    cargo test --frozen
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 README.zh-CN.md "$pkgdir/usr/share/doc/$pkgname/README.zh-CN.md"
}
