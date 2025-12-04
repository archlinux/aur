# Maintainer: Ciro Scognamiglio <ciro.scognamiglio88 at gmail dot com>
# Contributor: Ciro Scognamiglio <ciro.scognamiglio88 at gmail dot com>

pkgname='bzr-player'
pkgver='2.0.87'
pkgrel='1'
pkgdesc='Audio player supporting a wide array of multi-platform exotic file formats'
arch=('x86_64')
url="https://bzrplayer.blazer.nu"
license=('GPL-3.0-only')
depends=('hicolor-icon-theme' 'qt6-base' 'qt6-svg' 'qt-advanced-docking-system')
makedepends=('cmake' 'dos2unix' 'gendesk' 'git' 'git-lfs' 'libglvnd' 'ninja' 'patchutils' 'qt6-declarative'
  'sdl2-compat' 'vulkan-headers')
source=("git+https://github.com/aargirakis/BZRPlayer.git#tag=$pkgver")
sha256sums=('54d0516c9e24f19eb902f06ab25ee35a3cb6fa8b0feffcbbe247c5bc4b90eb38')

prepare() {
  cd BZRPlayer
  git lfs install --local

  if git remote | grep network-origin >/dev/null; then
    git remote remove network-origin
  fi

  git remote add network-origin https://github.com/aargirakis/BZRPlayer
  git lfs pull network-origin
}

build() {
  # workaround for making plugin_furnace.so & plugin_protrekkr.so work:
  CFLAGS=$(echo "$CFLAGS" | sed 's/-fno-plt//g')
  CXXFLAGS=${CFLAGS}
  LDFLAGS=$(echo "$LDFLAGS" | sed 's/-Wl,-z,now//g')

  cmake -B cmake-build -S BZRPlayer -DCMAKE_PREFIX_PATH=/usr -DCMAKE_BUILD_TYPE=Release -DOFFLINE_MODE=1 -G Ninja
  ninja -C cmake-build
}

package() {
  mv cmake-build/output/usr "$pkgdir"
  install -dm755 "$pkgdir/usr"
  install -Dm644 cmake-build/output/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  cd "$srcdir"

  for size in 16 32 48 64 128 256 512; do
    install -Dm644 "$pkgdir/usr/share/$pkgname/resources/icon.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/$pkgname.png"
  done

  install -Dm644 "BZRPlayer/src/inst/x-bzr-player.xml" "$pkgdir/usr/share/mime/packages/x-bzr-player.xml"
  mapfile -t mime_types_supported <"BZRPlayer/src/inst/supported_mime_types"

  for mime_type in "${mime_types_supported[@]}"; do
    desktop_entry_mime_types="$desktop_entry_mime_types$mime_type;"
  done

  desktop_entry_mime_types="${desktop_entry_mime_types%?}"

  gendesk -n -f --pkgname "$pkgname" --pkgdesc "$pkgdesc" \
    --name="BZR Player 2" \
    --genericname='Audio player' \
    --exec="/usr/bin/$pkgname %U" \
    --icon="$pkgname" \
    --categories='AudioVideo;Audio;Music;Player' \
    --mimetype="$desktop_entry_mime_types"

  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
