# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Co-Maintainer: Slimbook <dev at slimbook dot es>
pkgname=slimbookamdcontroller
pkgver=0.3.7beta
pkgrel=2
pkgdesc="Application for the performance management of AMD processors"
arch=('any')
url="https://github.com/slimbook/slimbookamdcontroller"
license=('GPL')
depends=('dbus-python' 'gtk3' 'libayatana-appindicator' 'libnotify' 'python-gobject'
         'python-pillow' 'python-pyamdgpuinfo' 'ryzenadj' 'systemd-libs')
install="$pkgname.install"
#source=("https://github.com/slimbook/slimbookamdcontroller/releases/download/v0.3.4betA/${pkgname}_${pkgver}_all.deb")
source=("https://launchpad.net/~slimbook/+archive/ubuntu/slimbook/+files/${pkgname}_${pkgver}_all.deb")
sha256sums=('15f5a8c09a480b058b41009ef67c6f1fb702baa0f3dfe75a5984a5cc94776163')

package() {
  bsdtar xf data.tar.xz -C "$pkgdir"
  mv "$pkgdir/bin/" "$pkgdir/usr/"

  ln -s /usr/bin/ryzenadj "$pkgdir/usr/share/$pkgname"

  # Remove duplicate GPL license & changelog.gz
  rm -rf "$pkgdir/usr/share/doc"

  # Install locales
  cd "$pkgdir/usr/share/$pkgname/src/translations"
  for lang in $(ls -d */); do
    install -d "$pkgdir/usr/share/locale/${lang}LC_MESSAGES"
    mv "$pkgdir/usr/share/$pkgname/src/translations/${lang}LC_MESSAGES"/*.mo \
      "$pkgdir/usr/share/locale/${lang}LC_MESSAGES"
  done
  rm -rf "$pkgdir/usr/share/$pkgname/src/translations"
  rm "$pkgdir/usr/share/$pkgname/src/update_po.sh"

  # App permissions
  chmod +x "$pkgdir/usr/lib/systemd/system-sleep/$pkgname"
  chmod -R 755 "$pkgdir/usr/share/$pkgname/src"
}
