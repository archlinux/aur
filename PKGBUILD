# Maintainer: David Runge <dave@sleepmap.de>
_name=kaptan
pkgbase=python-kaptan
pkgname=('python-kaptan' 'python2-kaptan')
pkgver=0.5.11
pkgrel=1
pkgdesc="Configuration manager in your pocket"
arch=('any')
url="https://emre.github.io/kaptan/"
license=('BSD')
makedepends=('python-setuptools' 'python-yaml' 'python2-setuptools' 'python2-yaml')
checkdepends=('python-pytest' 'python2-pytest')
# pypi sdist doesn't have the tests (yet): https://github.com/emre/kaptan/issues/93
#source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
source=("${_name}-${pkgver}.tar.gz::https://github.com/emre/${_name}/archive/v${pkgver}.tar.gz")
sha512sums=('5be93b47d4d98de1d1979174856db33fd39c763adec2bd6a2709553c4f332cf330a42a64ced9d68aadb3fbf698b3df9379a0255fb2f4aa03321c5b6140d2a66a')

build() {
  cd "${_name}-${pkgver}"
  python setup.py build
  python2 setup.py build
}

check() {
  cd "${_name}-${pkgver}"
  python setup.py test
  python2 setup.py test
}

package_python-kaptan() {
  depends=('python-yaml')
  cd "${_name}-${pkgver}"
  python setup.py install --skip-build \
    --optimize=1 \
    --prefix=/usr \
    --root="${pkgdir}"
  # license
  install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  # docs
  install -t "${pkgdir}/usr/share/doc/${pkgname}" \
    -vDm644 {AUTHORS,CHANGES,README.rst,TODO}
}

package_python2-kaptan() {
  depends=('python2-yaml')
  cd "${_name}-${pkgver}"
  python2 setup.py install --skip-build \
    --optimize=1 \
    --prefix=/usr \
    --root="${pkgdir}"
  # license
  install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  # docs
  install -t "${pkgdir}/usr/share/doc/${pkgname}" \
    -vDm 644 {AUTHORS,CHANGES,README.rst,TODO}
  # moving duplicate file
  mv -v "${pkgdir}/usr/bin/${_name}" "${pkgdir}/usr/bin/${_name}2"
}

# vim:set ts=2 sw=2 et:
