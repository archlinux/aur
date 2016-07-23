# Maintainer: Étienne Deparis <etienne [at] depar.is>

pkgname=galileo
pkgver=0.5
pkgrel=2
_bitbucket_folder=benallard-galileo-1b2fc31c42a1
pkgdesc='Utility to securely synchronize a Fitbit tracker with the Fitbit server'
license=('LGPL3')
url='https://bitbucket.org/benallard/galileo'
depends=('python2-pyusb-beta' 'python2-requests')
makedepends=('python2-setuptools')
source=("https://bitbucket.org/benallard/${pkgname}/get/${pkgver}.tar.gz")
sha256sums=('ef2c72a7b6d45ed99a804f5a0f170083e07d1ca7559434a110866c5d33e50d7d')
arch=('any')
options=(!emptydirs)
backup=("etc/galileo/config")

prepare() {
  cd $srcdir/$_bitbucket_folder

  find . -type f -exec sed -i \
    -e'1s|^#!/usr/bin/env python$|#!/usr/bin/env python2|' \
    -e '1s|^#!/usr/bin/python$|#!/usr/bin/env python2|' \
    "{}" \;

  sed -i 's/logging: verbose/logging: quiet # quiet is default/' galileorc.sample
  sed -i "26,35s/^\(.*\)$/\#\1/" galileorc.sample

  sed -i "s|/etc/galileorc|/etc/galileo/config|" contrib/galileo.service
}

package(){
  cd $srcdir/$_bitbucket_folder
  python2 setup.py install --root=$pkgdir

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
