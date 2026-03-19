# Maintainer: purpleleaf <max@ganoia.eu>

pkgname=pmt2e-git
pkgver=1.0.r118.716e9c5
pkgrel=1
pkgdesc="PoorMan Tint2 Executor - bash scripts tools for panels (Update, Weather, Volume, etc.)"
arch=('any')
url="https://github.com/purpleleaf/pmt2e"
license=('GPL3')
depends=('curl' 'jq' 'yad' 'dunst' 'jgmenu' 'librsvg')
makedepends=('git')
optdepends=(
  'light: primary backlight backend'
  'xbacklight: alternative backlight backend'
  'brightnessctl: alternative backlight backend'
  'alsa-utils: for pmvolume control or pmbattery sound alert'
  'acpi: for battery check'
  'wmctrl: for openbox desktop management'
  'iw: for pmnetwork wifi management'
  'pacman-contrib: for pmupdater'
  'ttf-jetbrains-mono-nerd: recommended Nerd Font to display glyphs via -f flag'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  # Entriamo nella cartella del repository clonato
  cd "$srcdir/${pkgname%-git}"

  # Creiamo la struttura nel pacchetto finale
  install -dm755 "$pkgdir/usr/bin"
  install -dm755 "$pkgdir/usr/share/pmt2e"


  # Copiamo i file rispettando i percorsi del tuo GitHub
  # Puntiamo a usr/bin/ e usr/share/pmt2e/ che esistono nel tuo repo
  cp -r usr/bin/* "$pkgdir/usr/bin/"
  cp -r usr/share/pmt2e/* "$pkgdir/usr/share/pmt2e/"

  install -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Permessi: eseguibili per i binari, lettura per il resto
  chmod 755 "$pkgdir"/usr/bin/*
  find "$pkgdir/usr/share/pmt2e" -type d -exec chmod 755 {} +
  find "$pkgdir/usr/share/pmt2e" -type f -exec chmod 644 {} +
}
