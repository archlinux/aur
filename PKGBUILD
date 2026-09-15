# Maintainer: tarball <bootctl@gmail.com>

pkgname=music-player-bin
pkgver=0.4.4
pkgrel=1
pkgdesc='An extensible music server written in Rust, with its Slint desktop client'
url='https://github.com/tsirysndr/music-player'
arch=(x86_64 aarch64)
license=(MIT)
provides=(music-player music-player-desktop)
conflicts=(music-player music-player-desktop)
# Only the first line is linked directly (DT_NEEDED). The X11, Wayland and GL
# libraries are dlopened at runtime by the Slint desktop client
# (winit/glutin/xkbcommon-dl), so they are invisible to ldd but the app aborts
# on startup without them. ttf-font is needed just as hard: fontique panics
# with NoMatch when fontconfig cannot match a single installed font.
depends=(glibc gcc-libs alsa-lib fontconfig
         libglvnd libx11 libxcb libxcursor libxi libxrender
         libxkbcommon libxkbcommon-x11 wayland
         ttf-font hicolor-icon-theme)

# Upstream ships release binaries; keep them as built instead of stripping
# them and splitting out a meaningless debug package.
options=(!strip !debug)

_tag="v${pkgver/_/-}"
_raw="https://raw.githubusercontent.com/tsirysndr/music-player/$_tag"

source=(music-player.service
        "music-player.desktop::$_raw/dist/music-player.desktop"
        "music-player.svg::$_raw/desktop/assets/icon.svg"
        "LICENSE::$_raw/LICENSE")
source_x86_64=("$url/releases/download/$_tag/music-player_${_tag}_x86_64-unknown-linux-gnu.tar.gz"
               "$url/releases/download/$_tag/music-player-desktop_${_tag}_x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$url/releases/download/$_tag/music-player_${_tag}_aarch64-unknown-linux-gnu.tar.gz"
                "$url/releases/download/$_tag/music-player-desktop_${_tag}_aarch64-unknown-linux-gnu.tar.gz")

sha256sums=('baf06a790cf152622a3f19c707805db724cd6a55a3398df45146feb62ff501f3'
            '1f22d9afa4d151cc808950ee2beb4d5296e13aec13f964cea6a55f0f79e38cda'
            '14c3b4f98f4a064b196aaf158303973ab522e8a33432911733867ded4cb65502'
            'ef1b2fbff4acad220b65d44d9850de3969b38b6a99aa835820381bec4ddb3a27')
sha256sums_x86_64=('16cf22de3afecfd67003e5db195c439c6d253bcd66283e5e15d1e3fee7f8d784'
                   'b1af09a3eb0106dd183c3ece3a1b6d2c181c3565f808284b2cf2dbb3b4dc8e3d')
sha256sums_aarch64=('0f28dfe1e6e46912e4cfff437172bc602d96c90a5be7beacd97cf92d598fc843'
                    '2174277677eec98fa33c4c09ae78cc957ca8c56df10529f8317f1f4eeba71505')

package() {
  install -Dm755 music-player \
    "$pkgdir"/usr/bin/music-player

  install -Dm755 music-player-desktop \
    "$pkgdir"/usr/bin/music-player-desktop

  install -Dm644 music-player.service \
    "$pkgdir"/usr/lib/systemd/user/music-player.service

  install -Dm644 music-player.desktop \
    "$pkgdir"/usr/share/applications/music-player.desktop

  install -Dm644 music-player.svg \
    "$pkgdir"/usr/share/icons/hicolor/scalable/apps/music-player.svg

  install -Dm644 LICENSE \
    "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
