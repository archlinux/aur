# Maintainer: TSUKUMO Akito <tsukumoakito99@duck.com>
# SPDX-License-Identifier: 0BSD

pkgname=zind
pkgver=1.0.9
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
sha256sums=('256f206886b6e5a3728c3fa65754c28c43ea91b6e5a9aa9e94b6353376808f74')

build() {
    cd "${pkgname}-${pkgver}"

    local zig_ver
    zig_ver=$(zig version 2>/dev/null || echo "none")

    if [[ ! "$zig_ver" =~ ^$_zigver ]]; then
        echo "⚠️  Zig version mismatch (Current: $zig_ver, Required: $_zigver)."

        if command -v zvm >/dev/null 2>&1; then
            echo "🔄 zvm detected. Attempting to switch to $_zigver..."

            zvm use "$_zigver" >/dev/null 2>&1 || true

            zig_ver=$(zig version 2>/dev/null || echo "none")
            if [[ "$zig_ver" =~ ^$_zigver ]]; then
                echo "✅ Successfully switched to Zig $zig_ver via zvm."
            else
                echo "❌ Error: zvm failed to switch to Zig $_zigver."
                echo "Please ensure the version is installed ('zvm install $_zigver') or switch manually."
                return 1
            fi
        else
            echo "❌ Error: Current $pkgname version requires Zig $_zigver."
            echo "Currently using: $zig_ver"
            echo "zvm not found. Please run 'zvm use $_zigver' or install it manually before building."
            return 1
        fi
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
