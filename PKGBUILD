pkgname=("python-fipy" "python2-fipy")
pkgbase="python-fipy"
pkgver=3.4.2.1
pkgrel=1
pkgdesc="Partial differential equation solver for Python, based on finite volume approach."
arch=('any')
url="http://www.ctcms.nist.gov/fipy"
license=('custom:Public Domain')
makedepends=('python2-setuptools' 'python-setuptools' 'python' 'python-future' 'python2-future')
optdepends=('gmsh: creation of irregular meshes')
source=("fipy-$pkgver.tar.gz::https://github.com/usnistgov/fipy/archive/${pkgver}.tar.gz")
sha256sums=('f7dfeb1aaf7c723c7287e7c9a6978f2c7c4828a87bfa11d901b0f8c319a3b0ee')

prepare(){
   cp -R fipy-${pkgver} fipy-${pkgver}-py3
   cd fipy-${pkgver}-py3
   2to3 --write . || true
   2to3 --write --doctests_only . || true
}

package_python2-fipy() {
   depends=('python2' 'python2-numpy' 'python2-scipy' 'python2-matplotlib')
   cd "${srcdir}/fipy-${pkgver}"
   # fix building by removing ez_setup references
   python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
   chmod 644 ${pkgdir}/usr/lib/python*/site-packages/FiPy-${pkgver}-py*.egg-info/*
   install -Dm644 "${srcdir}/fipy-${pkgver}/LICENSE.rst" \
     "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python-fipy() {
   depends=('python' 'python-numpy' 'python-scipy' 'python-matplotlib')
   cd "${srcdir}/fipy-${pkgver}-py3"
   # fix building by removing ez_setup references
   python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
   chmod 644 ${pkgdir}/usr/lib/python*/site-packages/FiPy-${pkgver}-py*.egg-info/*
   install -Dm644 "${srcdir}/fipy-${pkgver}/LICENSE.rst" \
     "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et tw=0:
