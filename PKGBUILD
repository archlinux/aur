# Maintainer: eolianoe <eolianoe At GoogleMAIL DoT com>

_pkgname=click-log
pkgname=("python-${_pkgname}" "python2-${_pkgname}")
pkgver="0.1.1"
pkgrel="4"
pkgdesc="Logging integration for Click"
arch=("any")
url="https://pypi.python.org/pypi/click-log"
license=("MIT")
makedepends=("python-setuptools"
             "python2-setuptools")
checkdepends=("python-pytest" "python-click"
              "python2-pytest" "python2-click")
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/click-contrib/${_pkgname}/archive/${pkgver}.tar.gz")
#source=("https://pypi.python.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('f37e4da8e8fb4f6f71b9e013f4313c644ab3352d286a3906575228edccd87e89')

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
  export PYTHONPATH="${srcdir}/${_pkgname}-${pkgver}/build/lib:$PYTHONPATH"

  cd "${srcdir}/${_pkgname}-${pkgver}"
  py.test

  cd "${srcdir}/${_pkgname}-${pkgver}-py2"
  py.test2
}

package_python-click-log() {
  depends=("python-click")
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --skip-build --root="${pkgdir}" --optimize=1
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-click-log() {
  depends=("python2-click")
  cd "${srcdir}/${_pkgname}-${pkgver}-py2"
  python2 setup.py install --skip-build --root="${pkgdir}" --optimize=1
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
