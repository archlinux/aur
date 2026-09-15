# Maintainer: tarball <bootctl@gmail.com>

pkgname=music-player-bin
pkgver=0.4.3
pkgrel=3
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
sha256sums_x86_64=('caecf401b5d96be482aec4908a88447f51d3e720ef5db886e5b909bafed6671b'
                   '4155df9ffa9c0bcdf62a461349e54848827579e736287a13231090e6d7356430')
sha256sums_aarch64=('62a3ecf4dd6360c9f0596d68d12f834b5f132d66113f01a94dc4cbed39cabbd6'
                    'b8a7dc9a8b193c8750d621d9e32f9756d23610e04c6f63f6bfa9a3346ff7e802')

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
