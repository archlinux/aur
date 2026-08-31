# Maintainer: Ciro Scognamiglio <ciro.scognamiglio88 at gmail dot com>
# Contributor: Ciro Scognamiglio <ciro.scognamiglio88 at gmail dot com>

pkgname='bzr-player'
pkgver='2.0.93'
pkgrel='2'
pkgdesc='Audio player supporting a wide array of multi-platform exotic file formats'
arch=('x86_64')
url="https://github.com/aargirakis/BZRPlayer"
license=('GPL-3.0-only')
depends=('hicolor-icon-theme' 'noto-fonts-cjk' 'qt6-base' 'qt6-svg' 'qt-advanced-docking-system')
makedepends=('cmake' 'dos2unix' 'gendesk' 'git' 'libglvnd' 'ninja' 'patchutils' 'qt6-declarative'
  'sdl2-compat' 'vulkan-headers')
source=("git+https://github.com/aargirakis/BZRPlayer.git#tag=$pkgver")
sha256sums=('92221b57ff9ab46abffb5a48d82170b1ea3b44616de4951680fd74d3ae41a199')

build() {
  cmake -B cmake-build -S BZRPlayer -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DOFFLINE_MODE=1 -G Ninja
  ninja -C cmake-build
}

package() {
  DESTDIR="$pkgdir" ninja -C cmake-build install

  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  mv "$pkgdir/usr/share/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"

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
    --genericname='Audio Player' \
    --exec="/usr/bin/$pkgname %U" \
    --icon="$pkgname" \
    --categories='AudioVideo;Audio;Music;Player;Qt' \
    --mimetype="$desktop_entry_mime_types"

  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
