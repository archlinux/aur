# Maintainer: Aleksandar Zarić <salexandarz@github.com>
pkgname=mail-badge-notifier-git
pkgver=r26.beeb2e8
pkgrel=5
pkgdesc="Unread mail taskbar badges for Thunderbird/Betterbird with headless systemd service and GUI wrapper"
arch=('x86_64' 'aarch64')
url="https://github.com/salexandarz/mail-badge-notifier"
license=('MIT')
install=mail-badge-notifier-git.install
depends=('python' 'thunderbird' 'bash' 'systemd')
makedepends=('git' 'python')
provides=('mail-badge-notifier')
conflicts=('mail-badge-notifier' 'mail-badge-bridge')
source=("git+https://github.com/salexandarz/mail-badge-notifier.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/mail-badge-notifier"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/mail-badge-notifier"

  # Kreiranje ciljnih direktorijuma
  install -d "$pkgdir/usr/share/$pkgname"
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -d "$pkgdir/usr/share/doc/$pkgname"

  # Kopiranje glavnih skripti
  install -Dm755 install.sh "$pkgdir/usr/share/$pkgname/install.sh"
  install -Dm755 uninstall.sh "$pkgdir/usr/share/$pkgname/uninstall.sh"

  # Kopiranje Python helper-a (bilo da je u korenskom direktorijumu ili u helper/)
  if [ -f "helper/mail_badge_bridge.py" ]; then
    install -d "$pkgdir/usr/share/$pkgname/helper"
    install -Dm755 helper/mail_badge_bridge.py "$pkgdir/usr/share/$pkgname/helper/mail_badge_bridge.py"
  elif [ -f "mail_badge_bridge.py" ]; then
    install -Dm755 mail_badge_bridge.py "$pkgdir/usr/share/$pkgname/mail_badge_bridge.py"
  fi

  # Kopiranje add-on fajlova (direktorijum addon ili korenski manifest/background)
  if [ -d "addon" ]; then
    cp -r addon "$pkgdir/usr/share/$pkgname/"
  fi
  if [ -f "manifest.json" ]; then
    install -Dm644 manifest.json "$pkgdir/usr/share/$pkgname/manifest.json"
  fi
  if [ -f "background.js" ]; then
    install -Dm644 background.js "$pkgdir/usr/share/$pkgname/background.js"
  fi
  if [ -f "mail-badge-bridge.xpi" ]; then
    install -Dm644 mail-badge-bridge.xpi "$pkgdir/usr/share/$pkgname/mail-badge-bridge.xpi"
  fi

  # Kopiranje licencnog fajla i README dokumentacije (ako postoje)
  [ -f LICENSE ] && install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  [ -f README.md ] && install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

  cd "$srcdir"
}
