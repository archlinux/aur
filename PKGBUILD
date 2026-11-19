# Maintainer: Dennis Blümer <dennis.bluemer@ducart.de>
pkgname=resonance-bin
pkgver=3.6.4
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
sha256sums=('b46845e158ea6e6153e7fdbae97a8a21f0cb62e2a873e2b25fcf963cfb50f134')
sha256sums_x86_64=('bafbf58c7d4a14b6a8dc8481944e782e407a9ffee6422ec35b76527192842288')
sha256sums_aarch64=('8064023eeef6b2f90bef7e8db978e3a07f0dad2303c29a1c88a8126e967c3efc')

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
