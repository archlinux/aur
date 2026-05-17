pkgname=rune-notes-bin
pkgver=0.1.4
pkgrel=1
pkgdesc='AI-native, local-first markdown notes'
arch=('x86_64')
url='https://github.com/eggfriedrice24/rune'
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1')
provides=('rune-notes')
conflicts=('rune-notes')
options=('!strip' '!debug')
source=("LICENSE::https://raw.githubusercontent.com/eggfriedrice24/rune/v${pkgver}/LICENSE")
source_x86_64=("https://github.com/eggfriedrice24/rune/releases/download/v${pkgver}/rune_${pkgver}_amd64.deb")
noextract=("rune_${pkgver}_amd64.deb")
sha256sums=('963a8176a5d89af4c28d4e4906a744a4dc0a8c3b43171cf1e37058a5229f18a0')
sha256sums_x86_64=('3abce832754316df3c1140e1349fdbdffadf946ad7e30ffd9ac5a41a48c7ba57')

prepare() {
  rm -rf deb
  mkdir deb
  bsdtar -xf "rune_${pkgver}_amd64.deb" -C deb
  bsdtar -xf deb/data.tar.gz -C deb
}

package() {
  install -Dm755 deb/usr/bin/rune "$pkgdir/usr/bin/rune-notes"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 deb/usr/share/applications/rune.desktop "$pkgdir/usr/share/applications/rune-notes.desktop"
  sed -i \
    -e 's/^Exec=.*/Exec=rune-notes/' \
    -e 's/^Icon=.*/Icon=rune-notes/' \
    -e 's/^StartupWMClass=.*/StartupWMClass=rune-notes/' \
    "$pkgdir/usr/share/applications/rune-notes.desktop"

  local icon_path icon_size
  for icon_path in deb/usr/share/icons/hicolor/*/apps/rune.png; do
    icon_size="${icon_path#deb/usr/share/icons/hicolor/}"
    install -Dm644 "$icon_path" "$pkgdir/usr/share/icons/hicolor/${icon_size%/apps/rune.png}/apps/rune-notes.png"
  done
}
