pkgname=aurora-gui-bin
pkgver=0.1.14
pkgrel=1
pkgdesc="Prebuilt Wayland-first GTK4 GUI for Arch Linux package management (pacman + AUR via yay/paru)"
arch=('x86_64')
url="https://github.com/ahmoodio/aurora"
license=('MIT')

depends=('gtk4' 'libadwaita' 'vulkan-icd-loader' 'openssl' 'zlib' 'libssh2')
optdepends=(
  'yay: AUR helper'
  'paru: AUR helper'
  'flatpak: optional Flatpak management'
)

provides=('aurora-gui')
conflicts=('aurora-gui' 'aurora-gui-git' 'aurora-pacman-gui-git')

install='aurora.install'

# Expected release asset format:
# https://github.com/ahmoodio/aurora/releases/download/v<version>/aurora-linux-x86_64.tar.gz
_asset_name='aurora-linux-x86_64.tar.gz'
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ahmoodio/aurora/releases/download/v${pkgver}/${_asset_name}")
sha256sums=('b3466f0f84ff892d400c50a96d35167948ffbfb6aa139c74f7c6efb147a522c7')

_pick_file() {
  local p
  for p in "$@"; do
    if [[ -f "$p" ]]; then
      printf '%s\n' "$p"
      return 0
    fi
  done
  return 1
}

package() {
  cd "$srcdir"

  local payload
  if [[ -d "aurora-linux-x86_64" ]]; then
    payload="$srcdir/aurora-linux-x86_64"
  else
    payload="$(find "$srcdir" -mindepth 1 -maxdepth 1 -type d | head -n 1)"
  fi

  if [[ -z "$payload" || ! -d "$payload" ]]; then
    echo 'error: extracted release payload directory not found'
    return 1
  fi

  local aurora_bin helper_bin desktop_file metainfo_file policy_file icon_256 icon_scalable

  aurora_bin="$(_pick_file \
    "$payload/aurora" \
    "$payload/usr/bin/aurora")" || { echo 'error: aurora binary not found'; return 1; }

  helper_bin="$(_pick_file \
    "$payload/aurora-helper" \
    "$payload/usr/bin/aurora-helper")" || { echo 'error: aurora-helper binary not found'; return 1; }

  desktop_file="$(_pick_file \
    "$payload/resources/io.github.ahmoodio.aurora.desktop" \
    "$payload/usr/share/applications/io.github.ahmoodio.aurora.desktop")" || { echo 'error: desktop file not found'; return 1; }

  metainfo_file="$(_pick_file \
    "$payload/resources/io.github.ahmoodio.aurora.metainfo.xml" \
    "$payload/usr/share/metainfo/io.github.ahmoodio.aurora.metainfo.xml")" || { echo 'error: metainfo file not found'; return 1; }

  policy_file="$(_pick_file \
    "$payload/resources/io.github.ahmoodio.aurora.policy" \
    "$payload/usr/share/polkit-1/actions/io.github.ahmoodio.aurora.policy")" || { echo 'error: polkit policy not found'; return 1; }

  icon_256="$(_pick_file \
    "$payload/assets/icons/hicolor/256x256/apps/io.github.ahmoodio.aurora.png" \
    "$payload/usr/share/icons/hicolor/256x256/apps/io.github.ahmoodio.aurora.png")" || { echo 'error: 256x256 icon not found'; return 1; }

  icon_scalable="$(_pick_file \
    "$payload/assets/icons/hicolor/scalable/apps/io.github.ahmoodio.aurora.png" \
    "$payload/usr/share/icons/hicolor/scalable/apps/io.github.ahmoodio.aurora.png")" || { echo 'error: scalable icon not found'; return 1; }

  install -Dm755 "$aurora_bin" "$pkgdir/usr/bin/aurora"
  install -Dm755 "$helper_bin" "$pkgdir/usr/bin/aurora-helper"

  install -Dm644 "$desktop_file" "$pkgdir/usr/share/applications/io.github.ahmoodio.aurora.desktop"
  install -Dm644 "$metainfo_file" "$pkgdir/usr/share/metainfo/io.github.ahmoodio.aurora.metainfo.xml"
  install -Dm644 "$policy_file" "$pkgdir/usr/share/polkit-1/actions/io.github.ahmoodio.aurora.policy"

  install -Dm644 "$icon_256" "$pkgdir/usr/share/icons/hicolor/256x256/apps/io.github.ahmoodio.aurora.png"
  install -Dm644 "$icon_scalable" "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.github.ahmoodio.aurora.png"

  # Compatibility aliases for launchers/compositors that resolve shorter icon names.
  install -Dm644 "$icon_256" "$pkgdir/usr/share/icons/hicolor/256x256/apps/aurora.png"
  install -Dm644 "$icon_scalable" "$pkgdir/usr/share/icons/hicolor/scalable/apps/aurora.png"
  install -Dm644 "$icon_256" "$pkgdir/usr/share/pixmaps/io.github.ahmoodio.aurora.png"
  install -Dm644 "$icon_256" "$pkgdir/usr/share/pixmaps/aurora.png"
}
