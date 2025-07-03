# Maintainer: Ciro Scognamiglio <ciro.scognamiglio88 at gmail dot com>
# Contributor: Ciro Scognamiglio <ciro.scognamiglio88 at gmail dot com>

pkgname='bzr-player'
pkgver='2.0.81'
pkgrel='1'
pkgdesc='Audio player supporting a wide array of multi-platform exotic file formats'
arch=('x86_64')
url="https://bzrplayer.blazer.nu"
license=('GPL-3.0-only')
depends=('hicolor-icon-theme' 'qt6-base' 'qt6-svg' 'qt-advanced-docking-system')
makedepends=('cmake' 'dos2unix' 'gendesk' 'libglvnd' 'ninja' 'patchutils' 'qt6-declarative' 'sdl2-compat'
  'vulkan-headers')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/aargirakis/BZRPlayer/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('dfb6add5df5cf18d976fae5f275d9fdee544c6bac0396137b26d9d5fe20205e3')

build() {
  # workaround for making plugin_furnace.so & plugin_protrekkr.so work:
  CFLAGS=$(echo "$CFLAGS" | sed 's/-fno-plt//g')
  CXXFLAGS=${CFLAGS}
  LDFLAGS=$(echo "$LDFLAGS" | sed 's/-Wl,-z,now//g')

  cmake -B cmake-build -S BZRPlayer-${pkgver} -DCMAKE_PREFIX_PATH=/usr -DCMAKE_BUILD_TYPE=Release -DOFFLINE_MODE=1 -G Ninja
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

  install -Dm644 "BZRPlayer-${pkgver}/src/inst/x-bzr-player.xml" "$pkgdir/usr/share/mime/packages/x-bzr-player.xml"
  mapfile -t mime_types_supported <"BZRPlayer-${pkgver}/src/inst/supported_mime_types"

  for mime_type in "${mime_types_supported[@]}"; do
    desktop_entry_mime_types="$desktop_entry_mime_types$mime_type;"
  done

  desktop_entry_mime_types="${desktop_entry_mime_types%?}"

  gendesk -n -f --pkgname "$pkgname" --pkgdesc "$pkgdesc" \
    --name="BZR Player" \
    --genericname='Audio player' \
    --exec="/usr/bin/$pkgname %U" \
    --icon="$pkgname" \
    --categories='AudioVideo;Audio;Music;Player' \
    --mimetype="$desktop_entry_mime_types"

  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
