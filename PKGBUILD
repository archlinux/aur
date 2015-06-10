# Maintainer: Kevin MacMartin <prurigro@gmail.com>

pkgname=yrd
pkgver=0.2
pkgrel=3
pkgdesc='A cjdns config tool for humans and cyborgs'
url='https://github.com/kpcyrd/yrd'
license=('GPL3')
arch=('any')
depends=('python2-argh' 'python2-requests' 'cjdns-git' 'systemd')
install=$pkgname.install
source=("$url/archive/v$pkgver.tar.gz"
        "$pkgname.tmpfiles.conf")
sha512sums=('45821f04170dcb24c9b4bf0659f77b1ea9bd4302288e68fe5d44f5179f792efedce8532fd92423cf5303cd36615d6e65743a80da59a27eab3cd4408eaf0c0a84'
            '4b678f9b57ccb921b841e5f34c42de3d9648602ed58acf3383e13ac0a589c2f72f53b37e2ab5f161ecf47c60eb18d484dce2ef78bf6deafdbd797a9d0acb4789')

prepare() {
  # Configure cjdroute.conf to be located @ /etc/cjdroute.conf
  cd $pkgname-$pkgver
  sed -i 's|/var/lib/yrd/cjdroute.conf|/etc/cjdroute.conf|' $pkgname.py
}

package() {
  # Create required directories
  install -dm755 "$pkgdir/usr/"{bin,lib/python2.7/site-packages/$pkgname}
  # Install the tmpfiles.d config
  install -Dm644 $pkgname.tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
  # Install the python files and make $pkgname.py executable
  cd $pkgname-$pkgver
  install -m644 *.py "$pkgdir/usr/lib/python2.7/site-packages/$pkgname/"
  chmod 755 "$pkgdir/usr/lib/python2.7/site-packages/$pkgname/$pkgname.py"
  # Install a symlink to the main executable in /usr/bin
  ln -sf /usr/lib/python2.7/site-packages/$pkgname/$pkgname.py "$pkgdir/usr/bin/$pkgname"
  # Install the README.md to the shared docs folder
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  # Install the systemd service
  install -Dm644 init/$pkgname.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"
}
