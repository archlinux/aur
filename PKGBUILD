# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: tioguda <guda.flavio@gmail.com>
pkgname=slimbookbattery
pkgver=4.0.1
pkgrel=1
pkgdesc="Battery optimization application for portable devices."
arch=('x86_64')
url="https://slimbook.es"
license=('GPL3')
depends=('cron' 'dmidecode' 'gtk3' 'libnotify' 'python-dbus' 'python-cairo'
         'python-gobject' 'python-pillow' 'tlp<=1.3.1' 'tlp-rdw<=1.3.1' 'xorg-xdpyinfo')
optdepends=('nvidia-prime: for hybrid graphics switching'
            'libappindicator-gtk3: tray icon'
            'slimbookamdcontroller: Synchronize battery mode with CPU TDP mode'
            'slimbootkintelcontroller: Synchronize battery mode with CPU TDP mode')
install="$pkgname.install"
source=("https://launchpad.net/~slimbook/+archive/ubuntu/slimbook/+files/${pkgname}_${pkgver}_all.deb")
sha256sums=('d7493c65109df43becd0900eeb7293f579626f4a3b31bffe6f6c6463652f4c74')

package() {
  bsdtar xf data.tar.xz -C "$pkgdir"

  # Symlink service
  install -d "$pkgdir/usr/lib/systemd/system"
  ln -s "/usr/share/$pkgname/src/service/$pkgname.service" \
    "$pkgdir/usr/lib/systemd/system"

  # Remove duplicate GPL3 license & changelog.gz
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
}
