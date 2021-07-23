# Maintainer: Pellegrino Prevete    pellegrinoprevete at gmail dot com
# Contributor: Johannes Dewender   arch at JonnyJD dot net
# Contributor: Jacob Alexander    haata at kiibohd dot com

pkgname=('python-apt' 'python2-apt')
_pkgname=python-apt
_pkgname2=python2-apt
pkgver=2.2.1
pkgrel=1
pkgdesc="Python binding of libapt-pkg"
arch=('any')
url="https://tracker.debian.org/pkg/python-apt"
license=('GPL2')
depends=('apt>=2.1')
makedepends=('python2-setuptools' 'python-setuptools' 'python-distutils-extra' 'python2-distutils-extra')
conflicts=()
options=(!emptydirs)
source=(https://salsa.debian.org/apt-team/python-apt/-/archive/${pkgver}/python-apt-${pkgver}.tar.gz)
sha512sums=('304b44db99298730191bbe3dbc56e21408b154208902ac1bf349069092462b062879d0b8a862149ef04c3a4eef712c992c912c133a6bec369db8eb19562b9177')

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
