# Maintainer: Palash <via github.com/debpalash>
# AUR source package for Opal — builds from the release tarball.
# push-to-aur.sh replaces pkgver from the release tag before publication and
# updpkgsums fills the checksum once that tag is public.
pkgname=opal-media-player
pkgver=0.9.5
pkgrel=1
pkgdesc="Play everything — media player, universal search, torrent streaming, local AI, one native binary"
arch=('x86_64')
url="https://github.com/debpalash/Opal"
license=('GPL-3.0-only')
depends=(
    'mpv'
    'sdl2'
    'sqlite'
    'libtorrent-rasterbar'
    'curl'
    'ffmpeg'
)
makedepends=(
    'zig>=0.17.0'
    'gcc'
    'pkgconf'
    'libwebp'
)
optdepends=(
    'yt-dlp: YouTube playback and downloads'
    'streamlink: live stream resolution'
    'onnxruntime: OCR bubble detection'
    'python: voice helper scripts (STT/TTS servers)'
)
source=("Opal-$pkgver.tar.gz::https://github.com/debpalash/Opal/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6e48c7f2ad15606fad5794d65e4fc6d23ecd481464234433c0d2476f5b4a8c61')

build() {
    cd "Opal-$pkgver"

    # 1. C++ torrent wrapper (isolates the libtorrent C++ ABI from Zig)
    g++ -std=c++17 -O3 -shared -fPIC \
        src/torrent_wrapper.cpp \
        -o libtorrent_wrapper.so \
        -ltorrent-rasterbar

    # 2. The app. -fsys=sdl2 links the system SDL2 (Wayland support);
    #    the binary carries $ORIGIN/../lib/opal in its rpath, matching the
    #    install layout below. Pin x86_64_v2 so AUR builds stay portable.
    zig build -Doptimize=safe -fsys=sdl2 -Dcpu=x86_64_v2
}

package() {
    cd "Opal-$pkgver"

    install -Dm755 zig-out/bin/opal          "$pkgdir/usr/bin/opal"
    install -Dm755 zig-out/bin/opal-mcp      "$pkgdir/usr/bin/opal-mcp"
    install -Dm755 libtorrent_wrapper.so     "$pkgdir/usr/lib/opal/libtorrent_wrapper.so"
    # Runtime resources: main.zig's detectResourceRoot roots them at /usr/lib/opal
    # (torrent search, browser scraper, Plugins page, Web Remote). Same layout as
    # the -bin package and packaging/nfpm.yaml.
    cp -r engines                            "$pkgdir/usr/lib/opal/engines"
    install -Dm755 scripts/camoufox_bridge.py "$pkgdir/usr/lib/opal/scripts/camoufox_bridge.py"
    cp -r web                                "$pkgdir/usr/lib/opal/web"
    install -Dm644 assets/logo.svg           "$pkgdir/usr/lib/opal/web/icon.svg"
    install -Dm644 data/plugins-manifest.json  "$pkgdir/usr/lib/opal/plugins-manifest.json"
    install -Dm644 data/manga-sources-sfw.json "$pkgdir/usr/lib/opal/manga-sources-sfw.json"
    install -Dm644 packaging/opal.desktop    "$pkgdir/usr/share/applications/opal.desktop"
    install -Dm644 assets/logo.svg           "$pkgdir/usr/share/icons/hicolor/scalable/apps/opal.svg"
    install -Dm644 docs/licenses/libwebp.txt "$pkgdir/usr/share/licenses/$pkgname/libwebp.txt"
    install -Dm644 LICENSE                   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
