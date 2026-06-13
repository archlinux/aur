# Maintainer: Dennis Blümer <dennis.bluemer@ducart.de>
pkgname=resonance-bin
pkgver=2.11.1
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
sha256sums=('c3051afdca354d481b035f701f973ac9c9a0c9ba0e15d695b98bc32de251145d')
sha256sums_x86_64=('8aa5d38cca1958f1a013cc5a9b8f0df21f941c4f8235f84c688690ac8a95cf62')
sha256sums_aarch64=('c4a1030f57681f306e8670ba6380ecf852c9ddb24d2ca806820f162de8c380c5')

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
