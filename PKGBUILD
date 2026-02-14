# Maintainer: Your Name <your.email@example.com>
pkgname=hyprcursor-sync-git
pkgver=r1.1
pkgrel=3
pkgdesc="Automated cursor sync, So you dont need to log-in-n-out just to check if your cursor is changed or not :)"
arch=('any')
url="https://github.com/uvz0/hyprcursor-sync"
license=('MIT')
depends=('hyprland' 'bash' 'glib2' 'gtk4')
makedepends=('git')
install=${pkgname}.install
source=("git+https://github.com/uvz0/hyprcursor-sync.git")
sha256sums=('SKIP')

# The .install file now only handles GLOBAL setup to avoid the DBUS error
echo "post_install() {
    echo ':: Enabling cursor-update automation globally...'
    echo ':: This will be active for all users upon their next login.'
    systemctl --global enable cursor-update.path
}

post_upgrade() {
    systemctl --global daemon-reload
}

pre_remove() {
    echo ':: Disabling cursor-update automation...'
    systemctl --global disable cursor-update.path
}" >"${pkgname}.install"

package() {
  cd "$srcdir/hyprcursor-sync"

  install -Dm755 cursor-update.sh "$pkgdir/usr/bin/cursor-update-script"
  install -Dm644 cursor-update.service "$pkgdir/usr/lib/systemd/user/cursor-update.service"
  install -Dm644 cursor-update.path "$pkgdir/usr/lib/systemd/user/cursor-update.path"

  sed -i 's|%h/.config/systemd/user/cursor-update.sh|/usr/bin/cursor-update-script|g' \
    "$pkgdir/usr/lib/systemd/user/cursor-update.service"
}
sha256sums=('SKIP')
