# Maintainer: Patrick Schratz <patrick.schratz@gmail.com>
# Maintainer: Jared Allard <jaredallard@outlook.com>
# code adapted from https://github.com/jaredallard/notion-app

pkgname=notion-app
pkgver=2.0.5
pkgrel=1
pkgdesc="The all-in-one workspace for your notes and tasks"
arch=('i686' 'x86_64')
url="https://www.notion.so/desktop"
license=('MIT')
depends=('electron6')
makedepends=('dmg2img' 'p7zip' 'libicns' 'gendesk')
source=("https://desktop-release.notion-static.com/Notion-"${pkgver}".dmg" 'notion-app')
md5sums=('bfb69a03e2844a89fa409108c38384e9'
         'ad3c23bc7d0186e2f622aa4b7310deac')

build() {
  msg "Converting dmg image..."
  mkdir -p tmp/build || true
  dmg2img "Notion-"${pkgver}".dmg" "Notion-"${pkgver}".img" >/dev/null
  7z x -y "Notion-"${pkgver}".img" >/dev/null
  cp -r Notion**/Notion.app/Contents/Resources/* tmp/build
  cp notion-app tmp/build
  icns2png -x tmp/build/Notion.icns
  gendesk -f --pkgname="Notion" --pkgdesc="$pkgdesc" --categories=Office --exec=notion-app --icon=/opt/notion-app/Notion_512x512x32.png
}

package() {
  echo "$pkgdir"
  mkdir -p "$pkgdir/usr/bin" "$pkgdir/opt/notion-app"
  cp -r tmp/build/* "$pkgdir/opt/notion-app/"
  cp Notion_512x512x32.png "$pkgdir/opt/notion-app/"
  install -D -m755 notion-app "$pkgdir/usr/bin/notion-app"
  install -Dm644 "$srcdir"/Notion.desktop -t "$pkgdir"/usr/share/applications
}

