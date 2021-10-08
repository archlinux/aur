# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=slimbookintelcontroller
pkgver=0.2beta
pkgrel=1
pkgdesc="Application for the performance management of Intel processors"
arch=('any')
url="https://github.com/slimbook/slimbookintelcontroller"
license=('GPL2')
depends=('dbus-python' 'gtk3' 'intel-undervolt' 'libnotify' 'pciutils' 'python-gobject'
         'python-pillow' 'systemd-libs')
optdepends=('libappindicator-gtk3: tray icon')
install="$pkgname.install"
source=("https://launchpad.net/~slimbook/+archive/ubuntu/slimbook/+files/${pkgname}_${pkgver}_all.deb")
sha256sums=('2a36bb471c488714dc15261bfa6a2d06cfd1e08a2a409a1cb6ac354f2587e055')

package() {
  bsdtar xf data.tar.xz -C "$pkgdir"

  # Remove duplicate GPL2 license & changelog.gz
  rm -rf "$pkgdir/usr/share/doc"

  # Install locales
  cd "$pkgdir/usr/share/$pkgname/src/locale"
  for lang in $(ls -d */); do
    install -d "$pkgdir/usr/share/locale/${lang}LC_MESSAGES"
    mv "$pkgdir/usr/share/$pkgname/src/locale/${lang}LC_MESSAGES"/*.mo \
      "$pkgdir/usr/share/locale/${lang}LC_MESSAGES"
  done
  rm -rf "$pkgdir/usr/share/$pkgname/src/locale"
  rm "$pkgdir/usr/share/$pkgname/src/update_po.sh"

  # App permissions
  chmod +x "$pkgdir/usr/lib/systemd/system-sleep/$pkgname"
}
