# Maintainer: Vojta Biberle <https://github.com/vojtabiberle>
pkgname=open-webui-tether-bin
pkgver=0.1.13
pkgrel=1
pkgdesc='Desktop companion for Open WebUI'
arch=('x86_64' 'aarch64')
url='https://github.com/open-webui/tether'
license=('LicenseRef-Open-WebUI-Enterprise')
depends=('alsa-lib' 'at-spi2-core' 'gtk3' 'libnotify' 'libsecret' 'libxss' 'libxtst' 'nss' 'util-linux-libs' 'xdg-utils')
optdepends=('libappindicator: system tray integration')
options=('!strip' '!debug')

source=("$pkgname-$pkgver-LICENSE::https://raw.githubusercontent.com/open-webui/tether/v$pkgver/LICENSE")
source_x86_64=("tether-${pkgver}_amd64.deb::$url/releases/download/v$pkgver/tether_amd64.deb")
source_aarch64=("tether-${pkgver}_arm64.deb::$url/releases/download/v$pkgver/tether_arm64.deb")
sha256sums=('406d9b76689bd41c2ab31985e3da23d825e61500b81cc82f52bff79611e6c694')
sha256sums_x86_64=('824bbe8f5f37c11838961c0f9f7511fe1a1a3c74116416542886b3c341d88cd9')
sha256sums_aarch64=('f81fb64756998a7d7ffbaea8479260be590a72f04558ae251d1c6043fd3090bc')

package() {
  local app='opt/Open WebUI Tether'
  bsdtar --no-same-owner -xf data.tar.xz -C "$pkgdir"
  chmod 755 "$pkgdir/$app/chrome-sandbox"

  install -d "$pkgdir/usr/bin"
  ln -s "/$app/tether" "$pkgdir/usr/bin/open-webui-tether"
  mv "$pkgdir/usr/share/applications/"{tether,open-webui-tether}.desktop
  sed -i 's|^Exec=.*|Exec=open-webui-tether %U|; s|^Icon=tether$|Icon=open-webui-tether|' \
    "$pkgdir/usr/share/applications/open-webui-tether.desktop"
  local icon
  for icon in "$pkgdir"/usr/share/icons/hicolor/*/apps/tether.png; do
    mv "$icon" "${icon%/*}/open-webui-tether.png"
  done
  mv "$pkgdir/usr/share/doc/"{tether,open-webui-tether}
  install -Dm644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
