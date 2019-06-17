# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: Cedric Girard <girard.cedric@gmail.com>

pkgname=snmpsim
pkgver=0.4.7
pkgrel=1
pkgdesc="A SNMP simulator"
arch=('any')
url="https://github.com/etingof/snmpsim"
license=('BSD')
depends=('python' 'python-pysnmp' 'python-pyasn1' 'python-pycryptodome')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/etingof/snmpsim/archive/v${pkgver}.tar.gz")
sha256sums=('6a27013abcea789886b44f02d3bd963a62537f2f6cae4d8c6d7351cec86d0d47')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i '1i #!/usr/bin/env python' scripts/*.py
}

build(){
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Some files are installed in the directory "/usr/snmpsim".
  # Move them to python package directory.
  mv "${pkgdir}/usr/${pkgname}/data" "${pkgdir}"`python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())"`/${pkgname}/
  mv "${pkgdir}/usr/${pkgname}/variation" "${pkgdir}"`python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())"`/${pkgname}/
  rmdir "${pkgdir}/usr/${pkgname}"
}

# vim:set ts=2 sw=2 et:
