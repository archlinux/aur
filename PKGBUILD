# Maintainer: Canmi21 <9997200@qq.com>
# Contributor: Canmi (Canmi21)

pkgname="image2display-bin"
pkgver="1.1.6.2"
pkgrel=5
pkgdesc="Cross platform GUI converting images or fonts into array data."
arch=("x86_64")
url="https://github.com/chenxuuu/image2display/releases"
license=("MIT")
depends=("skia-sharp" "dotnet-runtime")
conflicts=('image2display')
source=("https://github.com/chenxuuu/image2display/releases/download/${pkgver}/Image2Display-linux-x64.tar.gz"
        "https://raw.githubusercontent.com/chenxuuu/image2display/refs/heads/master/Image2Display/Image2Display/Assets/logo.png")
sha256sums=('SKIP'
            'SKIP')
options=('!strip')

package() {
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/lib/image2display"
  mkdir -p "$pkgdir/usr/share/applications"
  mkdir -p "$pkgdir/usr/share/icons/hicolor/16x16/apps"
  mkdir -p "$pkgdir/usr/share/icons/hicolor/32x32/apps"
  mkdir -p "$pkgdir/usr/share/icons/hicolor/48x48/apps"
  mkdir -p "$pkgdir/usr/share/icons/hicolor/64x64/apps"
  mkdir -p "$pkgdir/usr/share/icons/hicolor/128x128/apps"
  
  tar -xzf "${srcdir}/Image2Display-linux-x64.tar.gz" -C "$srcdir"
  
  cp -r "$srcdir/Image2Display-linux-x64/"* "$pkgdir/usr/lib/image2display/"
  chmod 755 "$pkgdir/usr/lib/image2display/Image2Display"
  install -Dm644 "$srcdir/Image2Display-linux-x64/libHarfBuzzSharp.so" "$pkgdir/usr/lib/libHarfBuzzSharp.so"
  
  echo "#!/bin/sh
exec /usr/lib/image2display/Image2Display \"\$@\"" > "$pkgdir/usr/bin/Image2Display"
  chmod 755 "$pkgdir/usr/bin/Image2Display"
  
  magick "${srcdir}/logo.png" -resize 16x16 "$pkgdir/usr/share/icons/hicolor/16x16/apps/image2display.png"
  magick "${srcdir}/logo.png" -resize 32x32 "$pkgdir/usr/share/icons/hicolor/32x32/apps/image2display.png"
  magick "${srcdir}/logo.png" -resize 48x48 "$pkgdir/usr/share/icons/hicolor/48x48/apps/image2display.png"
  magick "${srcdir}/logo.png" -resize 64x64 "$pkgdir/usr/share/icons/hicolor/64x64/apps/image2display.png"
  magick "${srcdir}/logo.png" -resize 128x128 "$pkgdir/usr/share/icons/hicolor/128x128/apps/image2display.png"
  
  echo "[Desktop Entry]
Name=Image2Display
Exec=/usr/bin/Image2Display
Type=Application
Terminal=false
Icon=image2display
Categories=Graphics;Utility;" > "$pkgdir/usr/share/applications/image2display.desktop"
  
  chmod 644 "$pkgdir/usr/share/applications/image2display.desktop"
}