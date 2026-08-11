# Maintainer: raindropqwq <raindropqwq@outlook.com>
# Maintainer: snowdropQwQ <snowqwq.dev@gmail.com>

pkgname=micyou-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="Turn your Android device into a high-quality wireless microphone for your PC"
arch=('x86_64')
url="https://github.com/LanRhyme/MicYou"
license=('GPL-3.0-only' 'MIT')
depends=('alsa-lib' 'glibc' 'webkit2gtk-4.1' 'gtk3' 'hicolor-icon-theme')
optdepends=(
  'android-tools: USB connectivity support'
  'xdg-utils: Open URLs in default browser'
)
provides=('micyou')
conflicts=('micyou' 'micyou-git')
options=('!strip')
source=("https://github.com/LanRhyme/MicYou/releases/download/v${pkgver}/MicYou-Linux-${pkgver}.deb"
  "https://raw.githubusercontent.com/LanRhyme/MicYou/refs/heads/master/LICENSE")
sha256sums=('8b80e5e13a8918a8a5975c98190ca203dc9e9388cbd2d62d08d932fdb6151b67'
  '6b7271e1f40a0346a6dfb0c14df538d56add7f26502ba23f5109db94eedd66e9')
noextract=("MicYou-Linux-${pkgver}.deb")

package() {
  cd "$srcdir"

  # Extract deb
  bsdtar -xf MicYou-Linux-${pkgver}.deb
  bsdtar -xf data.tar.gz -C "$pkgdir"

  # Install desktop file
  sed -i -e 's/^Exec=.*/Exec=micyou/' -e 's/^Icon=.*/Icon=micyou/' \
    "$pkgdir/usr/share/applications/MicYou.desktop"
  mv "$pkgdir/usr/share/applications/MicYou.desktop" "$pkgdir/usr/share/applications/micyou.desktop"

  # Install icon
  local _size
  for _size in 32x32 128x128 256x256@2; do
    mv "$pkgdir/usr/share/icons/hicolor/$_size/apps/micyou-app.png" "$pkgdir/usr/share/icons/hicolor/$_size/apps/micyou.png"
  done

  # Install binary
  mv "$pkgdir/usr/bin/micyou-app" "$pkgdir/usr/bin/micyou"

  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/micyou/LICENSE"
  install -Dm644 "$pkgdir/usr/lib/MicYou/resources/LICENSE-AEC7.txt" "$pkgdir/usr/share/licenses/micyou/LICENSE-AEC7.txt"
  install -Dm644 "$pkgdir/usr/lib/MicYou/resources/LICENSE-PureVox.txt" "$pkgdir/usr/share/licenses/micyou/LICENSE-PureVox.txt"
}
