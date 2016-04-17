# Maintainer: eolianoe <eolianoe At GoogleMAIL DoT com>

_pkgname=click-log
pkgname=("python-${_pkgname}" "python2-${_pkgname}")
pkgver="0.1.4"
pkgrel="1"
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
sha256sums=('4cd813e5c1abbae1ffbfcd647168d955ad49de54521fe6f7b178807302f50304')

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
  export PYTHONPATH="${srcdir}/${_pkgname}-${pkgver}/build/lib:$PYTHONPATH"
  py.test

  cd "${srcdir}/${_pkgname}-${pkgver}-py2"
  export PYTHONPATH="${srcdir}/${_pkgname}-${pkgver}-py2/build/lib:$PYTHONPATH"
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
