# Maintainer: TSUKUMO Akito <tsukumoakito99@duck.com>
# SPDX-License-Identifier: 0BSD

pkgname=zind
pkgver=1.0.7
_zigver=0.16.0
pkgrel=1
pkgdesc="Dynamic structural API indexer for Zig"
arch=('x86_64' 'aarch64')
url="https://codeberg.org/tsukumoakito/zind"
license=('MIT')
depends=('zig')
makedepends=('zig' 'scdoc')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tsukumoakito/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
validpgpkeys=('66B227EC5F67D7B4F8C6C1C7E98764DF6FCE8857')
sha256sums=('2d286c24631cde85fa79147c2cf503e46f3c476e30c0222d97f662405a0c0ef0')

build() {
    cd "${pkgname}-${pkgver}"
    local zig_ver
    zig_ver=$(zig version)
    if [[ ! "$zig_ver" =~ ^$_zigver ]]; then
        echo "❌ Error: Current $pkgname version requires Zig $_zigver."
        echo "Currently using: $zig_ver"
        echo "Please run your zig package manager such as 'zvm use $_zigver' before building."
        return 1
    fi
    zig build -Doptimize=ReleaseSafe
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 zig-out/bin/zind "${pkgdir}/usr/bin/zind"
    install -Dm644 zig-out/share/man/man1/zind.1 "${pkgdir}/usr/share/man/man1/zind.1"
    install -Dm644 zig-out/share/man/ja/man1/zind.1 "${pkgdir}/usr/share/man/ja/man1/zind.1"
    install -Dm644 zig-out/doc/MANUAL.md "${pkgdir}/usr/share/doc/${pkgname}/MANUAL.md"
    install -Dm644 zig-out/doc/MANUAL_ja.md "${pkgdir}/usr/share/doc/${pkgname}/MANUAL_ja.md"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 README_ja.md "${pkgdir}/usr/share/doc/${pkgname}/README_ja.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
