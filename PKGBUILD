pkgname=writers-suite
pkgver=0.724
pkgrel=1
pkgdesc="Writer's Suite desktop shell + helper + WASM UI"
arch=('x86_64')
url="http://softenough.com"
license=('MIT')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'libxcomposite' 'libxdamage' 'libxfixes' 'libxrandr' 'libxkbcommon' 'libdrm' 'libxcb' 'libxshmfence' 'libx11' 'libxi' 'libxcursor' 'libxinerama' 'libxext' 'libxrender' 'libsm' 'libice' 'fontconfig' 'freetype2' 'mesa' 'xdg-desktop-portal')
optdepends=('xdg-desktop-portal-gtk: GTK portal backend' 'xdg-desktop-portal-kde: KDE portal backend' 'xdg-desktop-portal-wlr: wlroots portal backend')
makedepends=('dotnet-sdk')
source=("WriterSuite-src.tar.gz::https://softenough.com/download/aur/src/WriterSuite-src.tar.gz")
sha256sums=('4d7e4b2ed6fb608cb54d528cadaf145984cf409b69a5f826b0cc5d340ce038a7')

build() {
  cd "$srcdir"
  WS_VERSION="$pkgver" WS_PUBLISH_RIDS=linux-x64 bash packaging/common/publish.sh
}

package() {
  cd "$srcdir"
  install -d "$pkgdir/opt/writers-suite"
  cp -a "dist/linux-x64/WriterSuite/." "$pkgdir/opt/writers-suite/"
  install -d "$pkgdir/usr/share/applications"
  cat > "$pkgdir/usr/share/applications/writers-suite.desktop" <<DESKTOP
[Desktop Entry]
Name=Writer's Suite
Exec=/opt/writers-suite/WritersSuite
Icon=/opt/writers-suite/assets/icons/ws-icon-256.png
Type=Application
Categories=Office;Utility;
DESKTOP
  cat > "$pkgdir/usr/share/applications/writers-suite-mod-manager.desktop" <<DESKTOP
[Desktop Entry]
Name=WSMM
Exec=/opt/writers-suite/mod-manager/WritersSuite.ModManager
Icon=/opt/writers-suite/assets/icons/ws-icon-256.png
Type=Application
Categories=Office;Utility;
DESKTOP
  install -d "$pkgdir/usr/bin"
  ln -s /opt/writers-suite/WritersSuite "$pkgdir/usr/bin/writers-suite"
  ln -s /opt/writers-suite/mod-manager/WritersSuite.ModManager "$pkgdir/usr/bin/writers-suite-mod-manager"
  install -Dm644 "$pkgdir/opt/writers-suite/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
