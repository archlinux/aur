# Maintainer: Christopher Arndt <aur at chrisarndt dot de>
# Contributor: Simon Conseil <contact+aur at saimon dot org>
# Contributor: Jesus Alvarez

_name=radon
pkgbase="python-${_name}"
pkgname=("${pkgbase}" "python2-${_name}")
pkgver=3.0.1
pkgrel=1
arch=('any')
url="https://${_name}.readthedocs.org/"
license=('MIT')
depends=()
makedepends=('python-sphinx' 'python2-sphinx')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('6d8f40b02141bb94c6b87cc4fdb6ca1f8ff6ab4128f4f0b155d4bab08736ca40')


prepare() {
  cp -r "${_name}-${pkgver}" "python2-${_name}-${pkgver}"
}

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  sed -i -e "s/mando[^']*/mando/" -e "s/colorama[^']*/colorama/" setup.py
  python setup.py build
  cd docs
  make html

  cd "${srcdir}/python2-${_name}-${pkgver}"
  sed -i -e "s/mando[^']*/mando/" -e "s/colorama[^']*/colorama/" setup.py
  python2 setup.py build
  cd docs
  make html
}

package_python-radon() {
  pkgdesc="A tool that computes various metrics for Python source code"
  depends=('python-flake8-polyfill' 'python-mando' 'python-colorama')

  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="$pkgdir" --skip-build --optimize=1

  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  cp -r docs/_build/html/* "${pkgdir}/usr/share/doc/${pkgname}"

  # license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-radon() {
  pkgdesc="A tool that computes various metrics for Python source code (Python2)"
  depends=('python2-flake8-polyfill' 'python2-mando' 'python2-colorama')

  cd "${srcdir}/python2-${_name}-$pkgver"
  python2 setup.py install --root="$pkgdir" --skip-build --optimize=1
  mv "$pkgdir/usr/bin/${_name}" "$pkgdir/usr/bin/${_name}2"

  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  cp -r docs/_build/html/* "${pkgdir}/usr/share/doc/${pkgname}"

  # license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
