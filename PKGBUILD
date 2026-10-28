# Maintainer: Isaac Vargas <hello at isaacvargas dot dev>

pkgname=openknowledge-bin
_pkgname=openknowledge
pkgver=0.88.8
pkgrel=1
pkgdesc="Beautiful, AI-native markdown IDE and LLM wiki (binary release)"
arch=('x86_64' 'aarch64')
url="https://openknowledge.ai"
license=('GPL-3.0-or-later')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'gtk3'
  'hicolor-icon-theme'
  'libcups'
  'libnotify'
  'libsecret'
  'libxss'
  'libxtst'
  'mesa'
  'nss'
  'util-linux-libs'
  'xdg-utils'
)
optdepends=('libappindicator-gtk3: tray icon support')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip' '!debug')
_url="https://github.com/inkeep/open-knowledge/releases/download/v$pkgver"
source_x86_64=("$_pkgname-$pkgver-x86_64.deb::$_url/OpenKnowledge-amd64.deb")
source_aarch64=("$_pkgname-$pkgver-aarch64.deb::$_url/OpenKnowledge-arm64.deb")
sha256sums_x86_64=('dade774e555a66d301632d7396c7e5d5a617b20d40af9e66222a21ebd7705201')
sha256sums_aarch64=('e98fd61e3d721807c370a3d7fbdb354c37742f1cae5e18c7e96d7ec9915f8571')

prepare() {
  mkdir -p deb
  bsdtar -xOf "$_pkgname-$pkgver-$CARCH.deb" 'data.tar.*' | bsdtar -xf - -C deb
}

package() {
  cd deb

  cp -a opt usr "$pkgdir/"
  rm -rf "$pkgdir/usr/share/doc"

  local _app="$pkgdir/opt/OpenKnowledge"

  # Without package-type, electron-updater falls back to its AppImage updater,
  # which stays inactive outside an AppImage. Updates come through pacman.
  rm -f "$_app/resources/package-type"

  # Needed on kernels without unprivileged user namespaces (e.g. linux-hardened).
  chmod 4755 "$_app/chrome-sandbox"
  chmod 0755 "$_app/resources/cli/bin/ok.sh"

  install -d "$pkgdir/usr/bin"
  ln -s /opt/OpenKnowledge/openknowledge "$pkgdir/usr/bin/openknowledge"
  ln -s /opt/OpenKnowledge/resources/cli/bin/ok.sh "$pkgdir/usr/bin/ok"
  ln -s /opt/OpenKnowledge/resources/cli/bin/ok.sh "$pkgdir/usr/bin/open-knowledge"

  install -Dm644 "$_app/resources/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
