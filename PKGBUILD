# Maintainer: David Runge <dave@sleepmap.de>
_name=kaptan
pkgbase=python-kaptan
pkgname=('python-kaptan' 'python2-kaptan')
pkgver=0.5.9
pkgrel=4
pkgdesc="Configuration manager in your pocket."
arch=('any')
url="https://emre.github.io/kaptan/"
license=('BSD')
makedepends=('python-setuptools' 'python-yaml' 'python2-setuptools' 'python2-yaml')
checkdepends=('python-pytest' 'python2-pytest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/emre/${_name}/archive/v${pkgver}.tar.gz")
sha512sums=('7638c917cfe18ca623f4b9508b35989588b2bfb43468ffb7b16159fe6e0e0b6fd70d7c480db90c84ddd9379ca2be1d25b501b7dbc17a3f7bca27591f5d65d6a9')

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
  export PYTHONPATH=build:${PYTHONPATH}
  py.test

  cd ../"${pkgname[1]}-${pkgver}"
  export PYTHONPATH=build:${PYTHONPATH}
  py.test2
}

package_python-kaptan() {
  depends=('python-yaml')
  cd "${pkgname[0]}-${pkgver}"
  python setup.py install --skip-build \
    --optimize=1 \
    --prefix=/usr \
    --root="${pkgdir}"
  # license
  install -vDm644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname[0]}/LICENSE"
  # docs
  install -t "${pkgdir}/usr/share/doc/${pkgname[0]}" \
    -vDm644 {AUTHORS,CHANGES,README.rst,TODO}
}

package_python2-kaptan() {
  depends=('python2-yaml')
  cd "${pkgname[1]}-${pkgver}"
  python2 setup.py install --skip-build \
    --optimize=1 \
    --prefix=/usr \
    --root="${pkgdir}"
  # license
  install -vDm644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname[1]}/LICENSE"
  # docs
  install -t "${pkgdir}/usr/share/doc/${pkgname[1]}" \
    -vDm644 {AUTHORS,CHANGES,README.rst,TODO}
  # moving duplicate file
  mv -v "${pkgdir}/usr/bin/${_name}" "${pkgdir}/usr/bin/${_name}2"
}

# vim:set ts=2 sw=2 et:
