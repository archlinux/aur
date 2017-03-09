# Maintainer: Christopher Arndt <aur at chrisarndt dot de>

_name="mando"
pkgbase="python-${_name}"
pkgname=("${pkgbase}" "python2-${_name}")
pkgver=0.5
pkgrel=1
arch=('any')
url="https://${_name}.readthedocs.org/"
# Repository: https://github.com/rubik/mando
license=('MIT')
depends=()
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
        'LICENSE')
sha256sums=('80b5b5f0405e64d8b35ae04c5e897ecdfdcc7337154b32696df8a5418c810560'
            '6123bc92c70372634b45af73fbae39eaa70683a66782b73b833c258c4de939eb')

prepare() {
  cp -r ${_name}-${pkgver} python2-${_name}-${pkgver}
}

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build

  cd "${srcdir}/python2-${_name}-${pkgver}"
  for script in capture.py run.py; do
    sed -i -e 's|python|python2|' mando/tests/${script}
  done
  python2 setup.py build
}

package_python-mando() {
  pkgdesc="Python library which wraps the argparse module to help write flexible CLI applications"
  depends=('python')
  optdepends=('python-sphinx: to run unit tests')

  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="$pkgdir" --skip-build --optimize=1

  # license
  install -Dm644 ${srcdir}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-mando() {
  pkgdesc="Python 2 library which wraps the argparse module to help write flexible CLI applications"
  depends=('python2')
  optdepends=('python2-sphinx: to run unit tests')

  cd "${srcdir}/python2-${_name}-$pkgver"
  python2 setup.py install --root="$pkgdir" --skip-build --optimize=1

  # license
  install -Dm644 ${srcdir}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
