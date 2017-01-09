# Maintainer: Étienne Deparis <etienne [at] depar.is>

pkgname=galileo
pkgver=0.5.1
pkgrel=3
_bitbucket_folder=benallard-galileo-f0ebc19c748d
pkgdesc='Utility to securely synchronize a Fitbit tracker with the Fitbit server'
license=('LGPL3')
url='https://bitbucket.org/benallard/galileo'
depends=('python-pyusb' 'python-requests')
makedepends=('python-setuptools')
source=("https://bitbucket.org/benallard/${pkgname}/get/${pkgver}.tar.gz")
sha256sums=('0dbf394c20acf2acb7226d2ea6609ff0199b8a6b63b545c2b8efffc6841ab411')
arch=('any')
options=(!emptydirs)
backup=("etc/galileo/config")
install=galileo.install

prepare() {
  cd $srcdir/$_bitbucket_folder

  sed -i 's/logging: verbose/logging: quiet # quiet is default/' galileorc.sample
  sed -i "26,35s/^\(.*\)$/\#\1/" galileorc.sample

  sed -i "s|/etc/galileorc|/etc/galileo/config|" contrib/galileo.service
}

package(){
  cd $srcdir/$_bitbucket_folder
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
