pkgname=weflow-bin
pkgver=6.1.0
pkgrel=1
pkgdesc="Local WeChat database decryption and analysis tool"
arch=('x86_64')
url='https://github.com/hicccc77/weflow-releases'
license=('CC-BY-NC-SA-4.0')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'gtk3'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxrandr'
  'mesa'
  'nss'
)
provides=('weflow')
conflicts=('weflow')
options=('!debug' '!strip')

source=("https://github.com/hicccc77/weflow-releases/releases/download/v${pkgver}/WeFlow-${pkgver}-Setup.tar.gz")
sha256sums=('a92e77d8b1b2687adfba5c4f098444842a456d257267b1504dbc66445fb0adf9')

package() {
  local src_app="$srcdir/WeFlow-${pkgver}-Setup"
  local install_dir="$pkgdir/opt/weflow"

  install -dm755 "$install_dir" "$pkgdir/usr/bin"
  cp -a "$src_app/"* "$install_dir/"

  find "$install_dir/resources/resources/key/linux" -type f -name 'xkey_helper_linux' -exec chmod 755 {} +

  ln -s /opt/weflow/weflow "$pkgdir/usr/bin/weflow"

  install -Dm644 "$src_app/resources/icon.png" \
    "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/weflow.png"
  install -Dm644 "$src_app/resources/resources/installer/linux/icon.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/weflow.png"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/weflow.desktop" <<'EOF'
[Desktop Entry]
Name=WeFlow
Comment=Local WeChat database decryption and analysis tool
Exec=weflow %U
Terminal=false
Type=Application
Icon=weflow
StartupWMClass=WeFlow
Categories=Utility;
EOF

  install -Dm644 "$src_app/LICENSE.electron.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.electron.txt"
  install -Dm644 "$src_app/LICENSES.chromium.html" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSES.chromium.html"
}
