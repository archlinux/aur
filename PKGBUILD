# Maintainer: Cedric Girard <girard.cedric@gmail.com>
pkgname=snmpsim
pkgver=0.2.3
pkgrel=1
pkgdesc="a software that would act like a multitude of real physical devices from SNMP Manager's point of view"
arch=(any)
url="http://snmpsim.sourceforge.net/"
license=('BSD')
depends=('python' 'python-pysnmp' 'python-pyasn1')
optdepends=('pycrypto: SNMPv3 support')
options=(!emptydirs)
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('95a0a5c43fb282c6e33588acaedc814a')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i '1i #!/usr/bin/env python' scripts/*.py
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  #some files are installed in /usr/snmpsim move them to python package dir
  mv "${pkgdir}/usr/${pkgname}/data" "${pkgdir}"`python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())"`/${pkgname}/
  mv "${pkgdir}/usr/${pkgname}/variation" "${pkgdir}"`python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())"`/${pkgname}/
  rmdir "${pkgdir}/usr/${pkgname}/"

}

# vim:set ts=2 sw=2 et:
