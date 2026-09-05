# Maintainer: Palash <via github.com/debpalash>
# AUR binary package for Opal — repackages the official release tarball.
# push-to-aur.sh replaces pkgver from the release tag before publication and
# updpkgsums fills the checksum once that artifact is public.
pkgname=opal-media-player-bin
pkgver=0.8.0
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
source=("https://github.com/debpalash/Opal/releases/download/v$pkgver/opal-$pkgver-linux-x86_64.tar.gz")
sha256sums=('a57e2bece15e61980843d5f49a7e10a9f8f67dbe6c706510371d1a45032adea4')

package() {
    cd "opal-$pkgver-linux-x86_64"

    # The binary's rpath includes $ORIGIN/../lib/opal, so the wrapper lib
    # resolves from /usr/lib/opal without ldconfig fiddling.
    install -Dm755 opal                       "$pkgdir/usr/bin/opal"
    install -Dm755 libtorrent_wrapper.so      "$pkgdir/usr/lib/opal/libtorrent_wrapper.so"
    cp -r engines                             "$pkgdir/usr/lib/opal/engines"
    install -Dm755 scripts/camoufox_bridge.py "$pkgdir/usr/lib/opal/scripts/camoufox_bridge.py"
    cp -r web                                "$pkgdir/usr/lib/opal/web"
    install -Dm644 plugins-manifest.json      "$pkgdir/usr/lib/opal/plugins-manifest.json"
    install -Dm644 manga-sources-sfw.json     "$pkgdir/usr/lib/opal/manga-sources-sfw.json"
    install -Dm644 opal.desktop               "$pkgdir/usr/share/applications/opal.desktop"
    install -Dm644 opal.svg                   "$pkgdir/usr/share/icons/hicolor/scalable/apps/opal.svg"
    install -Dm644 LICENSE                    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
