# Maintainer: Twilight0 <twilight0@vivaldi.net>

pkgname=cinnamon-dory-session
pkgver=1.0.0
pkgrel=1
pkgdesc="Cinnamon session with Dory as default file manager instead of Nemo"
arch=('any')
url="https://github.com/Twilight0/cinnamon-dory-session"
license=('GPL3')
depends=('cinnamon' 'dory-git')
conflicts=('nemo')
backup=('etc/xdg/cinnamon-session/sessions/cinnamon.session')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Twilight0/cinnamon-dory-session/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
  # Install modified session file
  install -Dm644 "$srcdir/$pkgname-$pkgver/cinnamon.session" \
    "$pkgdir/etc/xdg/cinnamon-session/sessions/cinnamon.session"

  # Install setup script
  install -d "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/cinnamon-dory-session-setup" << 'SETUP'
#!/bin/bash
# Set dory as default file manager
xdg-mime default dory.desktop inode/directory application/x-gnome-saved-search

# Blacklist nemo-autostart in cinnamon session
gsettings set org.cinnamon.SessionManager autostart-blacklist \
  "$(gsettings get org.cinnamon.SessionManager autostart-blacklist | sed "s/]/,\"nemo-autostart\"]/")" 2>/dev/null || true

echo "Dory session configured. Please log out and back in for changes to take effect."
SETUP
  chmod +x "$pkgdir/usr/bin/cinnamon-dory-session-setup"
}

post_install() {
  echo ""
  echo "==> To complete setup, run: cinnamon-dory-session-setup"
  echo "==> Then log out and log back in."
  echo ""
}

post_upgrade() {
  post_install
}
