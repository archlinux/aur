# Maintainer: TSUKUMO Akito <tsukumoakito99@duck.com>
# SPDX-License-Identifier: 0BSD

pkgname=dns-stream
pkgver=1.0.1
_zigver=0.16.0
pkgrel=1
pkgdesc="Unified real-time DNS log stream and visualization engine"
arch=('x86_64' 'aarch64')
url="https://codeberg.org/tsukumoakito/dns-stream"
license=('MIT')
depends=('libgcrypt' 'gpgme' 'libgpg-error')
makedepends=('zig' 'scdoc')
backup=('etc/dns-stream/config.json')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tsukumoakito/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
validpgpkeys=('66B227EC5F67D7B4F8C6C1C7E98764DF6FCE8857')
sha256sums=('663ff2fbfac068a76f6c53a629f2fd79344944cc8a568d6a0b4e201707374f1b')

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
    install -Dm755 zig-out/bin/dns-stream "${pkgdir}/usr/bin/dns-stream"
    install -Dm644 config.json "${pkgdir}/etc/dns-stream/config.json"
    install -Dm644 zig-out/share/man/man1/dns-stream.1 "${pkgdir}/usr/share/man/man1/dns-stream.1"
    install -Dm644 zig-out/share/man/ja/man1/dns-stream.1 "${pkgdir}/usr/share/man/ja/man1/dns-stream.1"
    install -Dm644 zig-out/doc/MANUAL.md "${pkgdir}/usr/share/doc/${pkgname}/MANUAL.md"
    install -Dm644 zig-out/doc/MANUAL_ja.md "${pkgdir}/usr/share/doc/${pkgname}/MANUAL_ja.md"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 README_ja.md "${pkgdir}/usr/share/doc/${pkgname}/README_ja.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
