# Maintainer: eolianoe <eolianoe At GoogleMAIL DoT com>

_pkgbase=atomicwrites
pkgbase=python-${_pkgbase}
pkgname=("python-${_pkgbase}" "python2-${_pkgbase}")
pkgver=1.1.5
pkgrel=2
pkgdesc="Atomic file writes on POSIX"
arch=('any')
url="https://github.com/untitaker/python-atomicwrites"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=('python-pytest' 'python2-pytest')
source=(${pkgbase}-${pkgver}.tar.gz::"https://github.com/untitaker/${pkgbase}/archive/${pkgver}.tar.gz")
sha256sums=('04e9a6c3dae3651328cb51f420f5f5992b8c7fc0008c7a66606c58df011594d0')

prepare() {
  rm -rf -- "${srcdir}/${pkgbase}-${pkgver}-py2"
  cp -a -- "${srcdir}/${pkgbase}-${pkgver}"{,-py2}
}

build() {
  cd "${srcdir}/${pkgbase}-${pkgver}"
  python setup.py build

  cd "${srcdir}/${pkgbase}-${pkgver}-py2"
  python2 setup.py build
}

check() {
  cd "${srcdir}/${pkgbase}-${pkgver}"
  export PYTHONPATH="${srcdir}/${pkgbase}-${pkgver}/build":${PYTHONPATH}
  py.test

  cd "${srcdir}/${pkgbase}-${pkgver}-py2"
  export PYTHONPATH="${srcdir}/${pkgbase}-${pkgver}-py2/build":${PYTHONPATH}
  py.test2
}


package_python-atomicwrites() {
  depends=('python')

  cd "${srcdir}/${pkgbase}-${pkgver}"

  python setup.py install --root="${pkgdir}/" --optimize=1

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-atomicwrites() {
  depends=('python2')

  cd "${srcdir}/${pkgbase}-${pkgver}-py2"

  python2 setup.py install --root="${pkgdir}/" --optimize=1

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
