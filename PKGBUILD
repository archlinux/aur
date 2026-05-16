# Maintainer: Your Name <your_email@example.com>

pkgname=51mazi-bin
pkgver=0.8.4
pkgrel=1
pkgdesc="A desktop writing software for novel writers (binary AppImage release)"
arch=('x86_64')
url="https://github.com/xiaoshengxianjun/51mazi"
license=('MIT')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'gtk3'
  'libcups'
  'libdrm'
  'libxcomposite'
  'libxkbcommon'
  'mesa'
  'nss'
)
source=(
  "https://github.com/xiaoshengxianjun/51mazi/releases/download/v${pkgver}/51mazi-${pkgver}.AppImage"
  "https://raw.githubusercontent.com/xiaoshengxianjun/51mazi/v${pkgver}/LICENSE"
  "https://raw.githubusercontent.com/xiaoshengxianjun/51mazi/v${pkgver}/build/icon.png"
  "51mazi.sh"
  "com.51mazi.desktop"
)
sha256sums=(
  '278c4728362628600b9af81a49b4998f2e5dc81e9ac5c457512053c173491431'
  'e9303a7fe2b237392b89d5a441229b39c3b05233ee7900056d2710c3b59aa7c2'
  '59b5ca42141eb41c34efb536024d62785aa1362d9a6a3fb5b447a0943faeeb2e'
  'SKIP'
  'SKIP'
)

prepare() {
  cd "$srcdir"

  chmod +x "51mazi-${pkgver}.AppImage"
  ./"51mazi-${pkgver}.AppImage" --appimage-extract

  if [ ! -d squashfs-root ]; then
    echo "ERROR: --appimage-extract failed to create squashfs-root/"
    ls -la "$srcdir"
    return 1
  fi

  chmod -R u+w,a+rX squashfs-root
}

package() {
  cd "$srcdir"

  install -dm755 "$pkgdir/opt/51mazi-bin"
  cp -a squashfs-root/* "$pkgdir/opt/51mazi-bin/"

  install -Dm755 "$srcdir/51mazi.sh" "$pkgdir/usr/bin/51mazi"

  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 "$srcdir/com.51mazi.desktop" "$pkgdir/usr/share/applications/com.51mazi.desktop"

  local icon_dir="$pkgdir/usr/share/icons/hicolor/512x512/apps"
  install -Dm644 "$srcdir/icon.png" "${icon_dir}/com.51mazi.desktop.png"
  ln -s "com.51mazi.desktop.png" "${icon_dir}/51mazi.png"
}
