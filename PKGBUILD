# Maintainer: eolianoe <eolianoe At GoogleMAIL DoT com>

_pkgname=click-threading
pkgname=("python-${_pkgname}" "python2-${_pkgname}")
pkgver=0.4.3
pkgrel=1
pkgdesc="Multithreaded Click apps made easy"
arch=("any")
url="https://pypi.python.org/pypi/${_pkgname}"
license=("MIT")
makedepends=("python-setuptools"
             "python2-setuptools")
checkdepends=("python-pytest" "python-click"
              "python2-pytest" "python2-click" 'python2-futures')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/click-contrib/${_pkgname}/archive/${pkgver}.tar.gz")
#source=("https://pypi.python.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('d852dbe16f2f0f97b3c8a3c246db783c836c053ee9e27f30ce79402b1e5b4383')

prepare() {
  rm -rf -- "${srcdir}/${_pkgname}-${pkgver}-py2"
  cp -a -- "${srcdir}/${_pkgname}-${pkgver}" "${srcdir}/${_pkgname}-${pkgver}-py2"
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build

  cd "${srcdir}/${_pkgname}-${pkgver}-py2"
  python2 setup.py build
}

check() {
  # Needed for the tests, especially when building in clean chroot
  [[ ${LANG} = C ]] && export LANG=en_US.UTF8

  cd "${srcdir}/${_pkgname}-${pkgver}"
  export PYTHONPATH="${srcdir}/${_pkgname}-${pkgver}/build/lib:${PYTHONPATH}"
  py.test

  cd "${srcdir}/${_pkgname}-${pkgver}-py2"
  export PYTHONPATH="${srcdir}/${_pkgname}-${pkgver}-py2/build/lib:${PYTHONPATH}"
  py.test2
}

package_python-click-threading() {
  depends=("python-click")
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --skip-build --root="${pkgdir}" --optimize=1
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-click-threading() {
  depends=("python2-click" 'python2-futures')
  cd "${srcdir}/${_pkgname}-${pkgver}-py2"
  python2 setup.py install --skip-build --root="${pkgdir}" --optimize=1
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
