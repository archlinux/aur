# Maintainer: Hoàng Văn Khải <hvksmr1996@gmail.com>

pkgname='upscayl-appimage'
pkgdesc='Free and Open Source AI Image Upscaler'
pkgver='2.9.4'
pkgrel='1'
arch=('x86_64')
url='https://github.com/upscayl/upscayl'
_repo='https://github.com/upscayl/upscayl'
license=('AGPL3')
depends=('bash')
makedepends=(
  'fuse2'
  'zlib'
  'findutils'
)
source=(
  "https://github.com/upscayl/upscayl/releases/download/v$pkgver/upscayl-$pkgver-linux.AppImage"
  "https://github.com/upscayl/upscayl/raw/v$pkgver/Real-ESRGAN_LICENSE.txt"
  'upscayl.desktop'
  'upscayl'
)
sha256sums=(
  '1fdff3d0d22a18624f8a98a85afbfaeef205438e9166be7ec9c9b7350acef591'
  '4a699ec4863d96a91fc265948a0c90033f7e8735d515524dcf3444736406e0c2'
  '944415997b67911834f89698ec506e050d04fb65306f65bd74e0476b84137567'
  '7014b447ea16dfc8a5b64fdcfb03b838af4f03f7c0ddbfad773bd848e0e9a315'
)
conflicts=(
  'upscayl'
)
provides=(
  'upscayl'
)

build() {
  chmod +x "./upscayl-$pkgver-linux.AppImage"
  "./upscayl-$pkgver-linux.AppImage" --appimage-extract
  chmod 755 squashfs-root
}

_fix_permission() (
  target=$1

  if [[ -L "$target" ]]; then
    return 0
  fi

  if [[ -d "$target" || -x "$target" ]]; then
    chmod 755 "$target"
    return 0
  fi

  if [[ -f "$target" ]]; then
    chmod 644 "$target"
    return 0
  fi

  echo "Unrecognizable filesystem entry: $target" >&2
  return 1
)

package() {
  msg2 'Creating target directory...'
  mkdir -p "$pkgdir/opt/"

  msg2 'Installing files from squashfs-root to target directory...'
  cp -r squashfs-root "$pkgdir/opt/upscayl"

  msg2 'Installing the upscayl command...'
  install -Dm755 upscayl "$pkgdir/usr/bin/upscayl"

  msg2 'Installing the desktop file...'
  install -Dm755 upscayl.desktop "$pkgdir/usr/share/applications/upscayl.desktop"

  msg2 'Installing the icon...'
  icon_dir='usr/share/icons/hicolor/0x0/apps'
  mkdir -p "$pkgdir/usr/share/pixmaps"
  ln -s "/opt/upscayl/$icon_dir/upscayl.png" "$pkgdir/usr/share/pixmaps/upscayl.png"

  msg2 'Installing the licenses...'
  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s /opt/upscayl/LICENSE.electron.txt "$pkgdir/usr/share/licenses/LICENSE.electron.txt"
  ln -s /opt/upscayl/LICENSES.chromium.html "$pkgdir/usr/share/licenses/LICENSES.chromium.html"
  install -Dm644 Real-ESRGAN_LICENSE.txt "$pkgdir/usr/share/licenses/Real-ESRGAN_LICENSE.txt"

  msg2 'Fixing permissions...'
  find "$pkgdir" | while read -r target; do
    _fix_permission "$target"
  done
}
