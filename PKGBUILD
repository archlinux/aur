# Maintainer: Étienne Deparis <etienne [at] depar.is>

pkgname=galileo
pkgver=0.5.1
pkgrel=4
pkgdesc='Utility to securely synchronize a Fitbit tracker with the Fitbit server - Stable release'
license=('LGPL3')
url='https://bitbucket.org/benallard/galileo'
depends=('python-pyusb' 'python-requests')
makedepends=('mercurial' 'python-setuptools')
conflicts=('galileo-dev')
source=("$pkgname::hg+https://bitbucket.org/benallard/galileo/src#branch=0.5" "galileo.install")
md5sums=('SKIP' '73a28532a02a6c0bcc1c233f64be7103')
arch=('any')
options=(!emptydirs)
backup=("etc/galileo/config")
install=galileo.install

prepare() {
  cd $srcdir/$pkgname

  sed -i 's/logging: verbose/logging: quiet # quiet is default/' galileorc.sample
  sed -i "26,35s/^\(.*\)$/\#\1/" galileorc.sample

  sed -i "s|/etc/galileorc|/etc/galileo/config|" contrib/galileo.service
}

package(){
  cd $srcdir/$pkgname
  python setup.py install --root=$pkgdir

  install -d -m755                  $pkgdir/etc/{udev/rules.d, $pkgname}
  install -d -m755                  $pkgdir/usr/share/{man/man1, man/man5, doc/$pkgname}

  install -D -m644 99-fitbit.rules         $pkgdir/etc/udev/rules.d/99-fitbit.rules
  install -D -m644 doc/galileo.1           $pkgdir/usr/share/man/man1/galileo.1
  install -D -m644 doc/galileorc.5         $pkgdir/usr/share/man/man5/galileorc.5
  install -D -m644 galileorc.sample        $pkgdir/etc/$pkgname/config
  install -D -m644 contrib/galileo.service $pkgdir/usr/lib/systemd/user/galileo.service

  install -D -m644 CHANGES          $pkgdir/usr/share/doc/$pkgname/CHANGES
  install -D -m644 README.txt       $pkgdir/usr/share/doc/$pkgname/README
}
