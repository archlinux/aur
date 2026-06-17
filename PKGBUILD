# Maintainer: Dennis Blümer <dennis.bluemer@ducart.de>
pkgname=resonance-bin
pkgver=2.11.3
pkgrel=1
pkgdesc="A local-first, zero-account API client with excellent user experience"
arch=('x86_64' 'aarch64')
url="https://github.com/db-mobile/resonance"
license=('MIT')
depends=(
    'webkit2gtk-4.1'
    'libayatana-appindicator'
    'gtk3'
)
provides=('resonance')
conflicts=('resonance')
options=('!strip')
source=(
    "resonance-$pkgver-source.tar.gz::https://github.com/db-mobile/resonance/archive/refs/tags/v$pkgver.tar.gz"
)
source_x86_64=(
    "resonance-$pkgver-amd64.deb::https://github.com/db-mobile/resonance/releases/download/v$pkgver/resonance_${pkgver}_amd64.deb"
)
source_aarch64=(
    "resonance-$pkgver-arm64.deb::https://github.com/db-mobile/resonance/releases/download/v$pkgver/resonance_${pkgver}_arm64.deb"
)
sha256sums=('78e8bfe80dec77c15302791d77017854690826fccb0677cca139f1b444a8e6fd')
sha256sums_x86_64=('b7f2c16d8dd2a09ea9da868de578e6ec00ccee5cc953d5c2cb3397d27721599f')
sha256sums_aarch64=('526c9eb9590dfcb33195ca35217c4622609a3ba669aca221c3c5def67602d87a')

package() {
    # Detect architecture-specific .deb filename
    if [ "$CARCH" = "x86_64" ]; then
        _deb="resonance-$pkgver-amd64.deb"
    else
        _deb="resonance-$pkgver-arm64.deb"
    fi

    # Step 1: Extract outer .deb ar archive
    cd "$srcdir"
    bsdtar -xf "$_deb"

    # Step 2: Extract data archive (detect format)
    if [ -f data.tar.gz ]; then
        bsdtar -xf data.tar.gz -C "$pkgdir"
    elif [ -f data.tar.zst ]; then
        bsdtar -xf data.tar.zst -C "$pkgdir"
    elif [ -f data.tar.xz ]; then
        bsdtar -xf data.tar.xz -C "$pkgdir"
    fi

    # Step 3: Remove desktop entry and icons bundled by the .deb (we install ours below)
    rm -rf "$pkgdir/usr/share/applications"
    rm -rf "$pkgdir/usr/share/icons"

    # Step 4: Install desktop entry from source (canonical version)
    install -Dm644 "resonance-$pkgver/assets/desktop/io.github.db_mobile.resonance.desktop" \
        "$pkgdir/usr/share/applications/io.github.db_mobile.resonance.desktop"

    # Step 5: Install icons from source (all standard hicolor sizes)
    for size in 16 32 48 64 128 256 512; do
        install -Dm644 \
            "resonance-$pkgver/assets/icons/icon_${size}x${size}.png" \
            "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/io.github.db_mobile.resonance.png"
    done

    # Step 6: Install MIT license
    install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
    cat > "$pkgdir/usr/share/licenses/$pkgname/LICENSE" << 'EOF'
MIT License

Copyright (c) Dennis Blümer

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
EOF
}
