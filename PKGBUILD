# Maintainer: Huki <gk7huki@gmail.com>
# Contributor: Svitozar Cherepii <razotivs@gmail.com>

pkgname=rvgl-bin
pkgver=21.0930a
_gamefilesver=18.0328
pkgrel=1
pkgdesc="Rewrite of Re-Volt, popular R/C car racing game from 1999."
url='https://rvgl.re-volt.io'
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
groups=('rvgl-basic' 'rvgl-original' 'rvgl-community')
source=("rvgl_game_files"::git+https://gitlab.com/re-volt/game_files.git#tag=${_gamefilesver}
        "rvgl_assets"::git+https://gitlab.com/re-volt/rvgl-assets.git#tag=${pkgver}
        "rvgl_platform"::git+https://gitlab.com/re-volt/rvgl-platform.git#tag=${pkgver}
        "RVGL.desktop")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            '4313552a067486339319e6e4b13386040183e196d7b6e26a1fec56a711e4721d')

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

    # Launcher
    cd "$srcdir"
    install -Dm755 "RVGL.desktop" "$pkgdir/usr/share/applications/RVGL.desktop"
}
