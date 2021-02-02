pkgname=python-fipy
pkgver=3.4.2.1
pkgrel=1
pkgdesc="Partial differential equation solver for Python, based on finite volume approach."
arch=('any')
url="http://www.ctcms.nist.gov/fipy"
license=('custom:Public Domain')
makedepends=('python-setuptools' 'python' 'python-future')
depends=('python' 'python-numpy' 'python-scipy' 'python-matplotlib')
optdepends=('gmsh: creation of irregular meshes')
source=("fipy-$pkgver.tar.gz::https://github.com/usnistgov/fipy/archive/${pkgver}.tar.gz")
sha256sums=('be8caaafe3ef2dc2c5ca02d8e91472bbdde0b19df1104170915fbb0b867c17a0')

prepare(){
   cp -R fipy-${pkgver} fipy-${pkgver}-py3
   cd fipy-${pkgver}-py3
   2to3 --write . || true
   2to3 --write --doctests_only . || true
}

package() {
   cd "${srcdir}/fipy-${pkgver}-py3"
   # fix building by removing ez_setup references
   python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
   chmod 644 ${pkgdir}/usr/lib/python*/site-packages/FiPy-${pkgver}-py*.egg-info/*
   install -Dm644 "${srcdir}/fipy-${pkgver}/LICENSE.rst" \
     "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et tw=0:
