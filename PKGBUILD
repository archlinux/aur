# Maintainer: mak <mak@localhost>
#
# Online (Lantern Engine 0.9.38, current upstream release):
# The stock Linux engine/out/bb-start skips online.configure_online(), so this
# package is offline out of the box. The local Linux fix is intentionally not
# baked into the AUR recipe; see ~/ports/aur/README.md ("Online fix") and
# reapply it after every upgrade. In Lantern Engine keep "Disable HTTP
# Requests" OFF, and never share hd_token/thd_token.
pkgname=bloodborne-lantern-engine-linux-bin
pkgver=0.9.38
pkgrel=1
pkgdesc="Bloodborne PC port (Lantern Engine Linux, needs your own game dump)"
arch=('x86_64')
url="https://github.com/Awakenchan/LanternEngine"
license=('GPL-3.0-or-later')
depends=('bash' 'glibc>=2.38' 'gcc-libs' 'python' 'icu' 'vulkan-icd-loader'
         'libx11' 'libxcb' 'libxkbcommon' 'libxrandr' 'libxi' 'libxcursor' 'libxext'
         'wayland' 'libdecor' 'libglvnd'
         'fontconfig' 'freetype2' 'alsa-lib'
         'openssl' 'zlib' 'xxhash' 'brotli' 'zstd')
optdepends=('mangohud: Vulkan performance overlay'
            'nvidia-utils: DLSS on RTX GPUs'
            'pipewire: PipeWire audio'
            'pulseaudio: PulseAudio audio')
provides=('bloodborne-pc')
conflicts=('bloodborne-pc' 'bloodborne-pc-bin')
replaces=('bloodborne-pc-bin')
options=('!strip')
source=("LanternEngine-v${pkgver}-linux-x64.tar.gz::https://github.com/Awakenchan/LanternEngine/releases/download/v${pkgver}/LanternEngine-v${pkgver}-linux-x64.tar.gz"
        'bloodborne-pc'
        'bloodborne-pc.desktop'
        'bloodborne-pc.png')
sha256sums=(8e2e6707cef777859cca2994b68a3dfccbb03426f11c739b0ee3c11b8467e5f7
            'a0372a6b63d5592a4c63f5814ca9cef821f471a17012fc30df7e6756d01cbc4f'
            'a461c2435b0e5e275c34e0e5e8b53761f8b60d320ea144f49e4eee77aa086b57'
            '43acf16390fd766a90d7c19f3c5b80803ae6b354cecc15ff5e60fbb39d6c1abb')

prepare() {
  # The packaged launcher must not try to write game_dir.txt into /opt.
  sed -i 's|^remembered=.*|remembered=${BB_DATA_DIR}/game_dir.txt|' \
    "$srcdir/LanternEngine/lantern.sh"
}

package() {
  install -d "$pkgdir/opt/ports/bloodborne-pc"
  cp -a "$srcdir/LanternEngine/." "$pkgdir/opt/ports/bloodborne-pc/"

  install -Dm755 "$srcdir/bloodborne-pc" "$pkgdir/usr/bin/bloodborne-pc"
  install -Dm644 "$srcdir/bloodborne-pc.desktop" \
    "$pkgdir/usr/share/applications/bloodborne-pc.desktop"
  install -Dm644 "$srcdir/bloodborne-pc.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/bloodborne-pc.png"

  install -Dm644 "$srcdir/LanternEngine/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/LanternEngine/NOTICE" \
    "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
  install -Dm644 "$srcdir/LanternEngine/README.txt" \
    "$pkgdir/usr/share/doc/$pkgname/README.txt"
}
