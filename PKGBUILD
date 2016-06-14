# Maintainer: Corentin Peuvrel <corentin.peuvrel at gmail dot com>
_pkgname=snmpsim
pkgname=snmpsim-git
pkgver=0.3.1.r421.7323ff1
pkgrel=1
pkgdesc="a software that would act like a multitude of real physical devices from SNMP Manager's point of view"
arch=(any)
url="http://snmpsim.sourceforge.net/"
license=('BSD')
depends=('python' 'python-pysnmp' 'python-pyasn1')
makedepends=('git')
optdepends=('pycrypto: SNMPv3 support')
provides=('snmpsim')
conflicts=('snmpsim')
options=(!emptydirs)
source=('git+https://github.com/etingof/snmpsim.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  printf "%s.r%s.%s" "$(awk -F "'" '/__version__/{print $2}' snmpsim/__init__.py)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_pkgname"

  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  #some files are installed in /usr/snmpsim move them to python package dir
  mv "${pkgdir}/usr/${_pkgname}/data" "${pkgdir}"`python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())"`/${_pkgname}/
  mv "${pkgdir}/usr/${_pkgname}/variation" "${pkgdir}"`python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())"`/${_pkgname}/
  rmdir "${pkgdir}/usr/${_pkgname}/"

}

# vim:set ts=2 sw=2 et:
