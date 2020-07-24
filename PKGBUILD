# Maintainer: Huki <gk7huki@gmail.com>
# Contributor: Svitozar Cherepii <razotivs@gmail.com>

pkgname=rvgl-bin
pkgver=20.0430a
gamefilesver=18.0328
pkgrel=4
pkgdesc="Rewrite of Re-Volt, popular R/C car racing game from 1999."
url='https://rvgl.re-volt.io'
arch=('x86_64')
license=('custom')
depends=('sdl2' 'sdl2_image' 'openal' 'enet' 'libunistring')
optdepends=('rvgl-dcpack: dreamcast content pack'
            'rvgl-soundtrack: game soundtrack'
            'libsndfile: for uncompressed audio support'
            'libvorbis: for OGG Vorbis support'
            'flac: for FLAC support'
            'mpg123: for MPEG support')
makedepends=('git')
groups=('rvgl-basic' 'rvgl-original' 'rvgl-community')
source=("rvgl_game_files"::git+https://gitlab.com/re-volt/game_files.git#tag=${gamefilesver}
        "rvgl_assets"::git+https://gitlab.com/re-volt/rvgl-assets.git#tag=${pkgver}
        "rvgl_platform"::git+https://gitlab.com/re-volt/rvgl-platform.git#tag=${pkgver}
        "RVGL.desktop")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            '4313552a067486339319e6e4b13386040183e196d7b6e26a1fec56a711e4721d')

package() {
    # Core game files
    cd "$srcdir/rvgl_game_files"
    find * -type f -exec install -Dm644 {} "$pkgdir/opt/rvgl/{}" \;

    # RVGL assets
    cd "$srcdir/rvgl_assets"
    find * -type f -exec install -Dm644 {} "$pkgdir/opt/rvgl/{}" \;

    # User folders
    install -dm777 "$pkgdir/opt/rvgl/profiles"
    install -dm777 "$pkgdir/opt/rvgl/replays"

    for class in rookie amateur advanced semi-pro pro superpro; do
      install -dm777 "$pkgdir/opt/rvgl/times/normal/$class"
      install -dm777 "$pkgdir/opt/rvgl/times/mirror/$class"
      install -dm777 "$pkgdir/opt/rvgl/times/reverse/$class"
      install -dm777 "$pkgdir/opt/rvgl/times/reversemirror/$class"
    done

    # Platform binaries
    cd "$srcdir/rvgl_platform/linux"
    install -Dm755 rvgl.64 "$pkgdir/opt/rvgl/rvgl"

    # Icons
    cd "$srcdir/rvgl_platform/linux/icons"
    find * -type f -exec install -Dm644 {} "$pkgdir/usr/share/icons/hicolor/{}" \;

    # Launcher
    cd "$srcdir"
    install -Dm755 RVGL.desktop "$pkgdir/usr/share/applications/RVGL.desktop"
}
