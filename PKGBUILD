# Maintainer: Huki <gk7huki@gmail.com>
# Contributor: Svitozar Cherepii <razotivs@gmail.com>

pkgname=rvgl-bin
pkgver=21.0930a
_gamefilesver=21.0715
pkgrel=2
pkgdesc="Rewrite of Re-Volt, popular R/C car racing game from 1999."
url='https://rvgl.org'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
license=('custom')
depends=('sdl2' 'sdl2_image' 'openal' 'enet' 'libunistring')
optdepends=('rvgl-dcpack: dreamcast content pack'
            'rvgl-soundtrack: game soundtrack'
            'libsndfile: for uncompressed audio support'
            'libvorbis: for OGG Vorbis support'
            'flac: for FLAC support'
            'mpg123: for MPEG support'
            'fluidsynth: for SoundFont 2 support')
makedepends=('git')
groups=('rvgl-basic' 'rvgl-original' 'rvgl-online')
source=("rvgl_game_files"::git+https://gitlab.com/re-volt/game_files.git#tag=${_gamefilesver}
        "rvgl_assets"::git+https://gitlab.com/re-volt/rvgl-assets.git#tag=${pkgver}
        "rvgl_platform"::git+https://gitlab.com/re-volt/rvgl-platform.git#tag=${pkgver}
        "rvgl"
        "RVGL.desktop")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            '576f17d542e4dab32926f48ef809c2ad4679ea87471b84f64605e7c171fbb198'
            'ba1ed3ac45b2a823f51146f3379e81ec491e79cc3063b142f583b07191a600aa')

_binsuffix='none'
[ "$CARCH" = 'i686' ] && _binsuffix='32'
[ "$CARCH" = 'x86_64' ] && _binsuffix='64'
[ "$CARCH" = 'armv7h' ] && _binsuffix='armhf'
[ "$CARCH" = 'aarch64' ] && _binsuffix='arm64'

package() {
    # Core game files
    cd "$srcdir/rvgl_game_files"
    find * -type f -exec install -Dm644 {} "$pkgdir/opt/rvgl/{}" \;

    # RVGL assets
    cd "$srcdir/rvgl_assets"
    find * -type f -exec install -Dm644 {} "$pkgdir/opt/rvgl/{}" \;

    # Icons
    cd "$srcdir/rvgl_assets/icons"
    find * -type f -exec install -Dm644 {} "$pkgdir/usr/share/icons/hicolor/{}" \;

    # User folders
    install -dm777 "$pkgdir/opt/rvgl/cache"
    install -dm777 "$pkgdir/opt/rvgl/profiles"
    install -dm777 "$pkgdir/opt/rvgl/replays"
    install -dm777 "$pkgdir/opt/rvgl/times"

    # Platform binaries
    cd "$srcdir/rvgl_platform/linux"
    install -Dm755 "rvgl.$_binsuffix" "$pkgdir/opt/rvgl/rvgl"
    install -Dm755 "lib/lib$_binsuffix/libunistring.so.2" "$pkgdir/opt/rvgl/lib/libunistring.so.2"

    # Launcher
    cd "$srcdir"
    install -Dm755 "rvgl" "$pkgdir/usr/bin/rvgl"
    install -Dm755 "RVGL.desktop" "$pkgdir/usr/share/applications/RVGL.desktop"
}
