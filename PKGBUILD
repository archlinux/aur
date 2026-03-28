# Maintainer: Andrew Rabert <ar@nullsum.net>
pkgname=jellyfin-desktop-libcef-bin
pkgver=146.0.6
_cef_version='146.0.6+g68649e2+chromium-146.0.7680.154'
pkgrel=1
provides=('jellyfin-desktop-libcef')
replaces=('jellyfin-desktop-cef-libcef-bin')
license=('BSD-3-Clause')
pkgdesc="CEF SDK for jellyfin-desktop"
arch=('x86_64')
url="https://bitbucket.org/chromiumembedded/cef"
depends=(
    'alsa-lib'
    'at-spi2-core'
    'cairo'
    'libcups'
    'libxcomposite'
    'libxdamage'
    'libxkbcommon'
    'libxrandr'
    'nss'
    'nspr'
    'pango'
)
makedepends=(
    'cmake'
    'ninja'
)
source=(
    "https://cef-builds.spotifycdn.com/cef_binary_${_cef_version}_linux64_minimal.tar.bz2"
)
sha256sums=('6514b0ead9e1632564b2154728cdf088fb04b325e4a85e26e66117403470d79a')
options=(!debug !strip)

build() {
    cd "cef_binary_${_cef_version}_linux64_minimal"

    CFLAGS="${CFLAGS//-Wp,-D_FORTIFY_SOURCE=?/}" \
    CXXFLAGS="${CXXFLAGS//-Wp,-D_FORTIFY_SOURCE=?/}" \
    cmake -B build -G Ninja -DCMAKE_BUILD_TYPE=Release

    cmake --build build --target libcef_dll_wrapper
}

package() {
    cd "cef_binary_${_cef_version}_linux64_minimal"

    install -dm755 "$pkgdir/opt/jellyfin-desktop/libcef/"{include,lib}

    # Headers
    cp -r include/* "$pkgdir/opt/jellyfin-desktop/libcef/include/"

    # Libraries and resources under lib/
    cp -r Release/* "$pkgdir/opt/jellyfin-desktop/libcef/lib/"
    cp -r Resources/* "$pkgdir/opt/jellyfin-desktop/libcef/lib/"
    install -m644 build/libcef_dll_wrapper/libcef_dll_wrapper.a "$pkgdir/opt/jellyfin-desktop/libcef/lib/"

    # Fix permissions
    find "$pkgdir/opt/jellyfin-desktop/libcef" -type d -exec chmod 755 {} \;
    find "$pkgdir/opt/jellyfin-desktop/libcef" -type f -exec chmod 644 {} \;
    chmod 755 "$pkgdir/opt/jellyfin-desktop/libcef/lib"/*.so*
    chmod 755 "$pkgdir/opt/jellyfin-desktop/libcef/lib/chrome-sandbox"

    # License
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
