# Maintainer: Palash <via github.com/debpalash>
# AUR binary package for Opal — repackages the official release tarball.
# push-to-aur.sh replaces pkgver from the release tag before publication and
# updpkgsums fills the checksum once that artifact is public.
pkgname=opal-media-player-bin
pkgver=0.9.7
pkgrel=1
pkgdesc="Play everything — media player, universal search, torrent streaming, local AI (official binary)"
arch=('x86_64')
url="https://github.com/debpalash/Opal"
license=('GPL-3.0-only')
provides=("opal-media-player=$pkgver")
conflicts=('opal-media-player')
depends=(
    'mpv'
    'sdl2'
    'sqlite'
    'libtorrent-rasterbar'
    'curl'
    'ffmpeg'
)
optdepends=(
    'yt-dlp: YouTube playback and downloads'
    'streamlink: live stream resolution'
    'onnxruntime: OCR bubble detection'
    'python: voice helper scripts (STT/TTS servers)'
)
makedepends=('gcc' 'boost' 'pkgconf')
source=(
    "https://github.com/debpalash/Opal/releases/download/v$pkgver/opal-$pkgver-linux-x86_64.tar.gz"
    "Opal-$pkgver.tar.gz::https://github.com/debpalash/Opal/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=('6b30278c637671ed86ec4e33d0b52685f5aa8e1131b5d7c99852d4d92cc64527'
            'd7628b814aec08143f4da562a58f813783d0dc6ce3bc48162574d83023ce5bd7')

build() {
    # The wrapper owns the C++ ABI. Rebuild it against the Arch libtorrent
    # installed at package build time, without rebuilding the Opal binary.
    cd "Opal-$pkgver"
    g++ -std=c++17 -O3 -shared -fPIC -Wl,-soname,libtorrent_wrapper.so \
        $(pkg-config --cflags libtorrent-rasterbar) src/torrent_wrapper.cpp \
        -o "$srcdir/opal-$pkgver-linux-x86_64/libtorrent_wrapper.so" \
        $(pkg-config --libs libtorrent-rasterbar)
}

package() {
    cd "opal-$pkgver-linux-x86_64"

    # The binary's rpath includes $ORIGIN/../lib/opal, so the wrapper lib
    # resolves from /usr/lib/opal without ldconfig fiddling.
    install -Dm755 opal                       "$pkgdir/usr/bin/opal"
    install -Dm755 opal-mcp                   "$pkgdir/usr/bin/opal-mcp"
    install -Dm755 libtorrent_wrapper.so      "$pkgdir/usr/lib/opal/libtorrent_wrapper.so"
    cp -r engines                             "$pkgdir/usr/lib/opal/engines"
    install -Dm755 scripts/camoufox_bridge.py "$pkgdir/usr/lib/opal/scripts/camoufox_bridge.py"
    cp -r web                                "$pkgdir/usr/lib/opal/web"
    install -Dm644 plugins-manifest.json      "$pkgdir/usr/lib/opal/plugins-manifest.json"
    install -Dm644 manga-sources-sfw.json     "$pkgdir/usr/lib/opal/manga-sources-sfw.json"
    install -Dm644 opal.desktop               "$pkgdir/usr/share/applications/opal.desktop"
    install -Dm644 opal.svg                   "$pkgdir/usr/share/icons/hicolor/scalable/apps/opal.svg"
    install -Dm644 licenses/libwebp.txt "$pkgdir/usr/share/licenses/$pkgname/libwebp.txt"
    install -Dm644 LICENSE                    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
