# Maintainer: Palash <via github.com/debpalash>
# AUR source package for Opal — builds from the release tarball.
# push-to-aur.sh replaces pkgver from the release tag before publication and
# updpkgsums fills the checksum once that tag is public.
pkgname=opal-media-player
pkgver=0.7.0
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
    'zig>=0.16.0'
    'gcc'
)
optdepends=(
    'yt-dlp: YouTube playback and downloads'
    'streamlink: live stream resolution'
    'onnxruntime: OCR bubble detection'
    'python: voice helper scripts (STT/TTS servers)'
)
source=("Opal-$pkgver.tar.gz::https://github.com/debpalash/Opal/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c8989eb673e5530cc1f8b773b18816bfaa2b8a8db999ee7a35a083ef93fc3c5c')

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
    zig build -Doptimize=ReleaseSafe -fsys=sdl2 -Dcpu=x86_64_v2
}

package() {
    cd "Opal-$pkgver"

    install -Dm755 zig-out/bin/opal          "$pkgdir/usr/bin/opal"
    install -Dm755 libtorrent_wrapper.so     "$pkgdir/usr/lib/opal/libtorrent_wrapper.so"
    install -Dm644 packaging/opal.desktop    "$pkgdir/usr/share/applications/opal.desktop"
    install -Dm644 assets/logo.svg           "$pkgdir/usr/share/icons/hicolor/scalable/apps/opal.svg"
    install -Dm644 LICENSE                   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
