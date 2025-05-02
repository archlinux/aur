# Maintainer: Ciro Scognamiglio <ciro.scognamiglio88 at gmail dot com>
# Contributor: Ciro Scognamiglio <ciro.scognamiglio88 at gmail dot com>

pkgname='bzr-player'
pkgver='2.0.78'
pkgrel='1'
pkgdesc='Audio player supporting a wide array of multi-platform exotic file formats'
arch=('x86_64')
url="https://bzrplayer.blazer.nu"
license=('GPL3')
depends=('hicolor-icon-theme' 'qt6-base' 'qt-advanced-docking-system')
makedepends=('cmake' 'dos2unix' 'gendesk' 'libarchive' 'libglvnd' 'ninja' 'patchutils' 'qt6-declarative' 'qt6-svg'
  'sdl2-compat' 'vulkan-headers')
source=("${pkgname}-${pkgver}.zip::https://github.com/aargirakis/BZRPlayer/archive/refs/tags/${pkgver}.zip")
sha256sums=('1f7079a6b9930775e91d687ecd6c777c98a5322269927dd198e3bd341e38d261')

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
    install -Dm644 "$pkgdir/usr/share/$pkgname/data/resources/icon.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/$pkgname.png"
  done

  install -Dm644 "BZRPlayer-${pkgver}/src/inst/x-bzr-player.xml" "$pkgdir/usr/share/mime/packages/x-bzr-player.xml"
  mapfile -t mime_types_supported < <(sed -n "\|mime_types_supported=(| , \|)|{p; \|)|q}" "BZRPlayer-${pkgver}/src/inst/bzr2-wine_setup.sh" |
    sed -e 's:mime_types_supported=(::g' -e 's:)::g' -e 's: :\n:g' | sed '/^[[:space:]]*$/d')

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
