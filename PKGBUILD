# Maintainer: Outlinux <akudesyn@gmail.com>

pkgname=outlinux
pkgver=1.0.0
pkgrel=1
pkgdesc="Wrapper desktop di Outlook Web basato su Electron"
arch=('any')
url="https://github.com/AkusenArcade/outlinux"
license=('MIT')
depends=('electron' 'hicolor-icon-theme')
makedepends=('git')
optdepends=(
  'libappindicator-gtk3: icona nella tray su GNOME e desktop senza StatusNotifierItem'
  'libnotify: notifiche desktop'
  'hunspell-it: correttore ortografico italiano'
  'hunspell-en_us: correttore ortografico inglese'
)
# Sorgente dal tag git: per un tarball di release sostituire con
#   "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
# e generare le somme con `updpkgsums`.
source=(
  "$pkgname::git+$url.git#tag=v$pkgver"
  'outlinux.sh'
)
sha256sums=(
  'SKIP'
  '51cbd83e68f0d835afb2b7f9b5a8f52f78bdd353463e58e8a1b76266b92c0a15'
)

package() {
  cd "$pkgname"

  # L'app è puro JavaScript: nessuna dipendenza npm a runtime, usa l'Electron
  # di sistema. I file vengono installati così come sono, senza impacchettarli
  # in un asar, per restare ispezionabili e ricostruibili.
  install -dm755 "$pkgdir/usr/lib/$pkgname"
  cp -r src assets package.json "$pkgdir/usr/lib/$pkgname/"

  install -Dm755 "$srcdir/outlinux.sh" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

  for size in 16 24 32 48 64 128 256 512; do
    install -Dm644 "build/icons/${size}x${size}.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/$pkgname.png"
  done

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
