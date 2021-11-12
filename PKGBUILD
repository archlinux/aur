# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Co-Maintainer: Slimbook <dev at slimbook dot es>
# Contributor: tioguda <guda.flavio@gmail.com>
pkgname=slimbookbattery
pkgver=4.0.3
pkgrel=1
pkgdesc="Battery optimization application for portable devices."
arch=('x86_64')
url="https://github.com/slimbook/slimbookbattery"
license=('GPL3')

depends=( 'libnotify' 
          'tlp' 
          'tlp-rdw'
	  'cron'
	  'dbus-python'
	  'dmidecode'
	  'gtk3'
	  'libayatana-appindicator'
          'python-gobject'
	  'python-pillow'
	  'xorg-xdpyinfo')
          
optdepends=('nvidia-prime: for hybrid graphics switching'
            'slimbookamdcontroller: Synchronize battery mode with CPU TDP mode'
            'slimbookintelcontroller: Synchronize battery mode with CPU TDP mode')
            
install="$pkgname.install"
source=("https://launchpad.net/~slimbook/+archive/ubuntu/slimbook/+files/${pkgname}_${pkgver}_all.deb")
sha256sums=('1f11e5ed1fefcfffd954a70281e44cec7077c93c8047b5160c14ffd0728aafd8')

package() {
  bsdtar xf data.tar.xz -C "$pkgdir"

  # Symlink service
  install -d "$pkgdir/usr/lib/systemd/system"
  ln -s "/usr/share/$pkgname/src/service/$pkgname.service" \
    "$pkgdir/usr/lib/systemd/system"

  # Remove duplicate GPL3 license & changelog.gz
  rm -rf "$pkgdir/usr/share/doc"

  # Install locales
  cd "$pkgdir/usr/share/$pkgname/src/translations"
  for lang in $(ls -d */); do
    install -d "$pkgdir/usr/share/translations/${lang}LC_MESSAGES"
    mv "$pkgdir/usr/share/$pkgname/src/translations/${lang}LC_MESSAGES"/*.mo \
      "$pkgdir/usr/share/translations/${lang}LC_MESSAGES"
  done
  rm -rf "$pkgdir/usr/share/$pkgname/src/translations"
}

