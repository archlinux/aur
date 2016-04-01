# Contributor: Johannes Dewender   arch at JonnyJD dot net
# Contributor: Jacob Alexander    haata at kiibohd dot com
pkgname=('python-apt' 'python2-apt')
_pkgname=python-apt
_pkgname2=python2-apt
pkgver=1.1.0~beta2
pkgrel=1
pkgdesc="Python binding of libapt-pkg"
arch=('i686' 'x86_64')
url="https://tracker.debian.org/pkg/python-apt"
license=('GPL2')
depends=('apt>=1.0.9.4')
makedepends=('python-distutils-extra' 'python2-distutils-extra')
conflicts=()
options=(!emptydirs)
source=(http://ftp.debian.org/debian/pool/main/p/$_pkgname/${_pkgname}_$pkgver.tar.xz
fix-pydebug.patch)
sha256sums=('b9dcff7f7b51035185d9a204ba39ab7111bb777ffa57913bb7b2de71bc2f7f44'
            '8a652b45fc4cdb27d672c355858813678908a8b6ab6a8dde8b843193eb960646')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
  patch -N -p1 < ../fix-pydebug.patch
}

package_python-apt() {
  depends+=('python')
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-apt() {
  depends+=('python2')
  cd "$srcdir/$_pkgname-$pkgver"
  sed -i -e 's|share/python-apt/templates|share/python2-apt/templates|g' \
    setup.py
  sed -i -e '1s|/usr/bin/env python$|/usr/bin/env python2|' apt/auth.py
  python2 setup.py build_py
  python2 setup.py build_ext
  python2 setup.py build_i18n --domain=$_pkgname2
  python2 setup.py install --skip-build --root="$pkgdir/" --optimize=1
  cd build/mo
  for lang in *; do
    install -Dm644 "$lang/LC_MESSAGES/${_pkgname2}.mo" \
      "$pkgdir/usr/share/locale/$lang/LC_MESSAGES/${_pkgname2}.mo"
  done
}
# vim:set ts=2 sw=2 et:
