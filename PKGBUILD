# Maintainer: Christopher Arndt <aur at chrisarndt dot de>
# Contributor: Simon Conseil <contact+aur at saimon dot org>
# Contributor: Jesus Alvarez

_module=radon
pkgbase="python-${_module}"
pkgname=("${pkgbase}" "python2-${_module}")
pkgver=1.4.2
pkgrel=1
arch=('any')
url="https://radon.readthedocs.org/"
license=('MIT')
depends=()
makedepends=('python-sphinx' 'python2-sphinx')
source=("https://pypi.python.org/packages/91/48/5853fa60811d6cec1043bd60b057aafc22706e19ab90b33d8df8155e6b8d/${_module}-${pkgver}.tar.gz"
 "https://raw.githubusercontent.com/rubik/radon/master/LICENSE"
)
sha256sums=('4f24ea6215e17c7c6d8548035c56d29e31131d17da1d607359fc07e9b6fabe97'
            '13cde2df14c3b42e6ecd452dd2b4d679ac40e7cbaaa8d2d87068f1e46be53677')


prepare() {
  cp -r ${_module}-${pkgver} python2-${_module}-${pkgver}
}

build() {
  cd "${srcdir}/${_module}-${pkgver}"
  sed -i -e "s/mando[^']*/mando/" -e "s/colorama[^']*/colorama/" setup.py
  python setup.py build
  cd docs
  make html

  cd "${srcdir}/python2-${_module}-${pkgver}"
  sed -i -e "s/mando[^']*/mando/" -e "s/colorama[^']*/colorama/" setup.py
  python2 setup.py build
  cd docs
  make html
}

package_python-radon() {
  pkgdesc="A tool that computes various metrics for Python source code"
  depends=('python-flake8-polyfill' 'python-mando' 'python-colorama')

  cd "${srcdir}/${_module}-${pkgver}"
  python setup.py install --root="$pkgdir" --skip-build --optimize=1

  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  cp -r docs/_build/html/* "${pkgdir}/usr/share/doc/${pkgname}"

  # license
  install -Dm644 ${srcdir}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-radon() {
  pkgdesc="A tool that computes various metrics for Python source code (Python2)"
  depends=('python2-flake8-polyfill' 'python2-mando' 'python2-colorama')

  cd "${srcdir}/python2-${_module}-$pkgver"
  python2 setup.py install --root="$pkgdir" --skip-build --optimize=1
  mv "$pkgdir/usr/bin/radon" "$pkgdir/usr/bin/radon2"

  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  cp -r docs/_build/html/* "${pkgdir}/usr/share/doc/${pkgname}"

  # license
  install -Dm644 ${srcdir}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
