# Maintainer: David Runge <dave@sleepmap.de>
_name=kaptan
pkgbase=python-kaptan
pkgname=('python-kaptan' 'python2-kaptan')
pkgver=0.5.10
pkgrel=2
pkgdesc="Configuration manager in your pocket."
arch=('any')
url="https://emre.github.io/kaptan/"
license=('BSD')
makedepends=('python-setuptools' 'python-yaml' 'python2-setuptools' 'python2-yaml')
checkdepends=('python-pytest' 'python2-pytest')
# pypi sdist doesn't have the tests (yet): https://github.com/emre/kaptan/issues/93
#source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
source=("${_name}-${pkgver}.tar.gz::https://github.com/emre/${_name}/archive/v${pkgver}.tar.gz")
sha512sums=('a9be1ecc1f91af8550ff8648de91dab9bb601fcf643c7dd87e6a2707097c7f37ed67e3916909491f1eb76116fe7f47d782fe1ce5f127835685008f60d473e43c')

prepare() {
  mv -v "${_name}-${pkgver}" "${pkgname[0]}-${pkgver}"
  cp -av "${pkgname[0]}-${pkgver}" "${pkgname[1]}-${pkgver}"
}

build() {
  cd "${pkgname[0]}-${pkgver}"
  python setup.py build
  cd ../"${pkgname[1]}-${pkgver}"
  python2 setup.py build
}

check() {
  cd "${pkgname[0]}-${pkgver}"
#  export PYTHONPATH=build:${PYTHONPATH}
#  py.test
  python setup.py test

  cd ../"${pkgname[1]}-${pkgver}"
#  export PYTHONPATH=build:${PYTHONPATH}
#  py.test2
  python2 setup.py test
}

package_python-kaptan() {
  depends=('python-yaml')
  cd "${pkgname}-${pkgver}"
  python setup.py install --skip-build \
    --optimize=1 \
    --prefix=/usr \
    --root="${pkgdir}"
  # license
  install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  # docs
  install -t "${pkgdir}/usr/share/doc/${pkgname}" \
    -vDm644 {AUTHORS,CHANGES,README.rst,TODO}
}

package_python2-kaptan() {
  depends=('python2-yaml')
  cd "${pkgname}-${pkgver}"
  python2 setup.py install --skip-build \
    --optimize=1 \
    --prefix=/usr \
    --root="${pkgdir}"
  # license
  install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  # docs
  install -t "${pkgdir}/usr/share/doc/${pkgname}" \
    -vDm 644 {AUTHORS,CHANGES,README.rst,TODO}
  # moving duplicate file
  mv -v "${pkgdir}/usr/bin/${_name}" "${pkgdir}/usr/bin/${_name}2"
}

# vim:set ts=2 sw=2 et:
