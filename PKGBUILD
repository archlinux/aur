# Maintainer: eolianoe <eolianoe At GoogleMAIL DoT com>

_pkgbase=atomicwrites
pkgbase=python-${_pkgbase}
pkgname=("python-${_pkgbase}" "python2-${_pkgbase}")
pkgver=1.0.0
pkgrel=1
pkgdesc="Atomic file writes on POSIX"
arch=('any')
url="https://github.com/untitaker/python-atomicwrites"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=('python-pytest' 'python2-pytest')
source=(${pkgbase}-${pkgver}.tar.gz::"https://github.com/untitaker/${pkgbase}/archive/${pkgver}.tar.gz")
sha256sums=('0325c610fefba1951374019ba534590ea47e28065d399b1a845db7159923df87')

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
  export PYTHONPATH="${srcdir}/${_pkgbase}-${pkgver}/build":${PYTHONPATH}
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

  python setup.py install --root="${pkgdir}/" --optimize=1

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
