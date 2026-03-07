# Maintainer: Andrew Rabert <ar@nullsum.net>
pkgname=jellyfin-desktop-cef-libcef-bin
pkgver=145.0.28
_cef_version='145.0.28+g51162e8+chromium-145.0.7632.160'
pkgrel=1
provides=('jellyfin-desktop-cef-libcef')
license=('BSD-3-Clause')
pkgdesc="CEF SDK for jellyfin-desktop-cef"
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
sha256sums=('065c7f7442f4f2917a95c3fde8052cb87e1e2f7ce962864c8325b12e52ec39f4')
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

    install -dm755 "$pkgdir/opt/jellyfin-desktop-cef/libcef/"{include,lib}

    # Headers
    cp -r include/* "$pkgdir/opt/jellyfin-desktop-cef/libcef/include/"

    # Libraries and resources under lib/
    cp -r Release/* "$pkgdir/opt/jellyfin-desktop-cef/libcef/lib/"
    cp -r Resources/* "$pkgdir/opt/jellyfin-desktop-cef/libcef/lib/"
    install -m644 build/libcef_dll_wrapper/libcef_dll_wrapper.a "$pkgdir/opt/jellyfin-desktop-cef/libcef/lib/"

    # Fix permissions
    find "$pkgdir/opt/jellyfin-desktop-cef/libcef" -type d -exec chmod 755 {} \;
    find "$pkgdir/opt/jellyfin-desktop-cef/libcef" -type f -exec chmod 644 {} \;
    chmod 755 "$pkgdir/opt/jellyfin-desktop-cef/libcef/lib"/*.so*
    chmod 755 "$pkgdir/opt/jellyfin-desktop-cef/libcef/lib/chrome-sandbox"

    # License
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
