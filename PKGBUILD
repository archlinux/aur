# Maintainer: Christopher Arndt <aur at chrisarndt dot de>

_module="mando"
pkgbase="python-${_module}"
pkgname=("${pkgbase}" "python2-${_module}")
pkgver=0.4
pkgrel=2
arch=('any')
url="https://mando.readthedocs.org/"
license=('MIT')
depends=()
source=("https://pypi.python.org/packages/2b/52/684d9ab8c2ccfb611275f2e44d3ebc76a6a6c56f4afacd2e91237fa07ec3/${_module}-${pkgver}.tar.gz"
  'LICENSE'
)
sha256sums=('853ff98f80266387b37850ecc4f8cac59d24cecc623fb7d2ef2bc5febbad2cae'
            '6123bc92c70372634b45af73fbae39eaa70683a66782b73b833c258c4de939eb')

prepare() {
  cp -r ${_module}-${pkgver} python2-${_module}-${pkgver}
}

build() {
  cd "${srcdir}/${_module}-${pkgver}"
  python setup.py build

  cd "${srcdir}/python2-${_module}-${pkgver}"
  for script in capture.py run.py; do
    sed -i -e 's|python|python2|' mando/tests/${script}
  done
  python2 setup.py build
}

package_python-mando() {
  pkgdesc="Python library which wraps the argparse module to help write flexible CLI applications"
  depends=('python-sphinx')

  cd "${srcdir}/${_module}-${pkgver}"
  python setup.py install --root="$pkgdir" --skip-build --optimize=1

  # license
  install -Dm644 ${srcdir}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-mando() {
  pkgdesc="Python 2 library which wraps the argparse module to help write flexible CLI applications"
  depends=('python2-sphinx')

  cd "${srcdir}/python2-${_module}-$pkgver"
  python2 setup.py install --root="$pkgdir" --skip-build --optimize=1

  # license
  install -Dm644 ${srcdir}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
