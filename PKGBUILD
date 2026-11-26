# Maintainer: gambarim <gambarim at pm dot me>
# SPDX-License-Identifier: 0BSD

pkgname=privacynotes-appimage
pkgver=0.847.1
pkgrel=1
pkgdesc='End-to-end encrypted notes, tasks, files, passwords and journal (official AppImage)'
arch=('x86_64' 'aarch64')
url='https://github.com/LifetimeLabsHQ/PrivacyNotes.app'
license=('AGPL-3.0-only')
depends=('fuse2' 'gtk3' 'hicolor-icon-theme' 'webkit2gtk-4.1' 'xdg-utils')
makedepends=('squashfs-tools')
provides=("privacynotes=${pkgver}")
conflicts=('privacynotes' 'privacynotes-bin')
options=('!strip' '!debug')

_image_x86_64="PrivacyNotes_${pkgver}_amd64.AppImage"
_image_aarch64="PrivacyNotes_${pkgver}_aarch64.AppImage"
source_x86_64=("${url}/releases/download/v${pkgver}/${_image_x86_64}")
source_aarch64=("${url}/releases/download/v${pkgver}/${_image_aarch64}")
noextract=("${_image_x86_64}" "${_image_aarch64}")
sha256sums_x86_64=('c9e9d2ad932c122a3da7f6b11a846d3b49568a62cf15ce31945365ba7c786881')
sha256sums_aarch64=('7a42f2e3aa290c446b5ee9622306dff97696a09751bd96fd01d88d27448c8dc1')

package() {
  local image offset
  # The SquashFS offsets belong to the pinned images; recheck on each update.
  case "$CARCH" in
    x86_64) image="$_image_x86_64"; offset=944632 ;;
    aarch64) image="$_image_aarch64"; offset=936456 ;;
  esac
  install -Dm755 "$srcdir/$image" "$pkgdir/opt/$pkgname/PrivacyNotes.AppImage"
  install -dm755 "$pkgdir/usr/bin"
  # Keep the GUI command separate from the official 'privacynotes' CLI.
  ln -s "/opt/$pkgname/PrivacyNotes.AppImage" "$pkgdir/usr/bin/$pkgname"

  # Read desktop assets without executing the downloaded AppImage.
  local icon='usr/share/icons/hicolor/256x256@2/apps/privacynotes.png'
  unsquashfs -cat -offset "$offset" "$srcdir/$image" "$icon" > "$srcdir/$pkgname.png" || return 1
  install -Dm644 "$srcdir/$pkgname.png" "$pkgdir/$icon"

  local desktop="$srcdir/$pkgname.desktop"
  unsquashfs -cat -offset "$offset" "$srcdir/$image" 'usr/share/applications/PrivacyNotes.desktop' > "$desktop" || return 1
  sed -i "s/^Exec=privacynotes /Exec=$pkgname /" "$desktop"
  install -Dm644 "$desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
