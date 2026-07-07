# Maintainer: Aixiao <aixiaoo@outlook.com>
pkgname=markra-bin
pkgver=1.1.3
pkgrel=1
pkgdesc="AI-native WYSIWYG Markdown editor — local first, with native AI"
arch=('x86_64')
url="https://github.com/markrahq/markra"
license=('AGPL-3.0')
depends=('webkit2gtk-4.1' 'gtk3')
mime=('text/markdown')
conflicts=('markra')
provides=('markra')
source=("$pkgname-$pkgver.deb::https://github.com/markrahq/markra/releases/download/v$pkgver/Markra_${pkgver}_linux_x64.deb"
        "$pkgname-$pkgver-LICENSE::https://raw.githubusercontent.com/markrahq/markra/main/LICENSE")
sha256sums=('a56a722c97dd735b2472f21897708c8e36e11cd2cf592d0a2395015bac0fc839'
            '0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0')
options=('!debug')

package() {
  # Extract deb
  mkdir -p "$srcdir/deb"
  cd "$srcdir/deb"
  ar x "$srcdir/$pkgname-$pkgver.deb"
  tar xf data.tar.gz

  # Install binary
  install -Dm755 "$srcdir/deb/usr/bin/markra" "$pkgdir/usr/bin/markra"

  # Install desktop file
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/markra.desktop" <<EOF
[Desktop Entry]
Name=Markra
Comment=AI-native Markdown editor
Exec=markra %F
Icon=markra
Type=Application
Categories=Office;TextEditor;
MimeType=text/markdown;
Terminal=false
StartupWMClass=markra
Keywords=markdown;editor;ai;writing;
EOF

  # Install icons
  for size in 32 128; do
    install -Dm644 "$srcdir/deb/usr/share/icons/hicolor/${size}x${size}/apps/markra.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/markra.png"
  done
  install -Dm644 "$srcdir/deb/usr/share/icons/hicolor/256x256@2/apps/markra.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256@2/apps/markra.png"

  # Install license
  install -Dm644 "$srcdir/$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}