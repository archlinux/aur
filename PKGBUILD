# Maintainer:  Gabriel Souza Franco <Z2FicmllbGZyYW5jb3NvdXphQGdtYWlsLmNvbQ==>
# Contributor: mickele
# Contributor: Brice Méalier <mealier_brice *at* yahoo *dot* fr>
# Contributor: Essien Ita Essien <me *at* essienitaessien *dot* com>
# Contributor: Tobias Sandmann <tSa *at* gmx *dot* eu>
# Contributor: pfm <nl081130 *at* yahoo *dot* de>
# Contributor: mortbauer <mortbauer *at* gmail *dot* com>
 
pkgbase=omniorbpy
pkgname=(python-omniorbpy python2-omniorbpy omniorbpy-common)
pkgver=4.2.4
pkgrel=1
pkgdesc="A CORBA object request broker for C++ and Python."
arch=(i686 x86_64)
url="http://omniorb.sourceforge.net/"
license=('LGPL')
depends=('omniorb')
source=(http://downloads.sourceforge.net/omniorb/omniORBpy-$pkgver.tar.bz2)
sha256sums=('dae8d867559cc934002b756bc01ad7fabbc63f19c2d52f755369989a7a1d27b6')
 
build() {
  cp -r "$srcdir/omniORBpy-$pkgver"{,-py2}

  cd "$srcdir/omniORBpy-$pkgver"
  ./configure PYTHON=/usr/bin/python --prefix=/usr
  make

  cd "$srcdir/omniORBpy-$pkgver-py2"
  ./configure PYTHON=/usr/bin/python2 --prefix=/usr
  make
}

package_python-omniorbpy() {
  depends+=('python' 'omniorbpy-common')

  cd "$srcdir/omniORBpy-$pkgver"
  make DESTDIR="$pkgdir" install

  # remove conflicting files
  rm -r "$pkgdir"/usr/include
  rm "$pkgdir"/usr/lib/*/site-packages/omniidl_be/__init__.*
  rm -r "$pkgdir"/usr/lib/*/site-packages/omniidl_be/__pycache__
 
  # adjust directory permissions
  find "$pkgdir" -type d -exec chmod 755 '{}' +
}

package_python2-omniorbpy() {
  depends+=('python2' 'omniorbpy-common')
  conflicts=('omniorbpy-omg' 'pyorbit')
  provides=('omniorbpy' 'pyorbit')
  replaces=('omniorbpy')

  cd "$srcdir/omniORBpy-$pkgver-py2"
  make DESTDIR="$pkgdir" install

  # remove conflicting files
  rm -r "$pkgdir"/usr/include
  rm "$pkgdir"/usr/lib/*/site-packages/omniidl_be/__init__.*
 
  # adjust directory permissions
  find "$pkgdir" -type d -exec chmod 755 '{}' +
}

package_omniorbpy-common() {
  cd "$srcdir/omniORBpy-$pkgver"
  (cd include; make DESTDIR="$pkgdir" install)
  (cd modules; make DESTDIR="$pkgdir" install)

  # remove conflicting files
  rm -rf "$pkgdir"/usr/lib
  # adjust directory permissions
  find "$pkgdir" -type d -exec chmod 755 '{}' +
}
