# Maintainer: Michael Berlinger <michaelmberlinger@gmail.com>

pkgname=zotero
pkgver=5.0.97_beta.18+1eb888d02
pkgrel=1
pkgdesc="Zotero Standalone. Is a free, easy-to-use tool to help you collect, organize, cite, and share your research sources."
arch=('x86_64' 'i686')
url="http://www.zotero.org/download"
license=('AGPL3')
depends=('dbus-glib' 'gtk3' 'nss' 'libxt')
provides=("zotero=${pkgver}")
conflicts=('zotero')

sha256sums=('a26167a3055ed7af7cb8cf4fad0f906e00b1a3eb2c78ff9151db4542f5208e2a'
            '2b01d011a4179f4aefb6242576688eed05f67054c176af0c1bb332b9f7a4278d')

source=(
	'zotero.desktop'
	"$pkgname-${pkgver//_/-}_linux_$CARCH.tar.bz2::https://www.zotero.org/download/standalone/dl?platform=linux-$CARCH&channel=beta"
)

package() {
  install -dDm755 "$pkgdir"/usr/{bin,lib/zotero}
  mv "$srcdir"/Zotero_linux-$CARCH/* "$pkgdir"/usr/lib/zotero
  ln -s /usr/lib/zotero/zotero "$pkgdir"/usr/bin/zotero
  install -Dm644 "$srcdir"/zotero.desktop "$pkgdir"/usr/share/applications/zotero.desktop
  # Copy zotero icons to a standard location
  install -Dm644 "$pkgdir"/usr/lib/zotero/chrome/icons/default/default16.png "$pkgdir"/usr/share/icons/hicolor/16x16/apps/zotero.png
  install -Dm644 "$pkgdir"/usr/lib/zotero/chrome/icons/default/default32.png "$pkgdir"/usr/share/icons/hicolor/32x32/apps/zotero.png
  install -Dm644 "$pkgdir"/usr/lib/zotero/chrome/icons/default/default48.png "$pkgdir"/usr/share/icons/hicolor/48x48/apps/zotero.png
  install -Dm644 "$pkgdir"/usr/lib/zotero/chrome/icons/default/default256.png "$pkgdir"/usr/share/icons/hicolor/256x256/apps/zotero.png
  # Disable APP update
  sed -i '/pref("app.update.enabled", true);/c\pref("app.update.enabled", false);' "$pkgdir"/usr/lib/zotero/defaults/preferences/prefs.js
  # No need to keep a shell around when launching Zotero
  sed -i -r 's/^("\$CALLDIR\/zotero-bin" -app "\$CALLDIR\/application.ini" "\$@")/exec \1/' "$pkgdir"/usr/lib/zotero/zotero
}
