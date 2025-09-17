pkgname=python-fipy
pkgver=4.0.1
pkgrel=1
pkgdesc="Partial differential equation solver for Python, based on finite volume approach."
arch=('any')
url="http://www.ctcms.nist.gov/fipy"
license=('custom:Public Domain')
makedepends=('python-setuptools' 'python')
depends=('python' 'python-numpy' 'python-scipy' 'python-matplotlib')
optdepends=('gmsh: creation of irregular meshes')
source=("fipy-$pkgver.tar.gz::https://github.com/usnistgov/fipy/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('0bc02a81a7f7eb3f6f8b177b3ea4948228a320ee489960cffcfb6a9a823a8359')

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
