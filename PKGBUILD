pkgname=("python-fipy" "python2-fipy")
pkgbase="python-fipy"
pkgver=3.3
pkgrel=1
pkgdesc="Partial differential equation solver for Python, based on finite volume approach."
arch=('any')
url="http://www.ctcms.nist.gov/fipy"
license=('custom:Public Domain')
makedepends=('python2-distribute' 'python2-setuptools' 'python-setuptools' 'python' 'python-future' 'python2-future')
optdepends=('gmsh: creation of irregular meshes')
source=("fipy-$pkgver.tar.gz::https://github.com/usnistgov/fipy/archive/${pkgver}.tar.gz"
        ez_setup.patch)
sha256sums=('702f1dffc5799e47d879383bbf66bf4f1baa92e40e6241dc9e59845b6ff4df2c'
            '18079818a382c47de68b0a6094255d8c95bc9d2ba1deee4b45ef43034aedea26')

prepare(){
   cd "${srcdir}/fipy-${pkgver}"
   patch setup.py ../../ez_setup.patch
   cd ..
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
