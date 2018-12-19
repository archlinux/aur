# Maintainer: Daniel Moch <daniel@danielmoch.com>
pkgbase=python-hookmeup
pkgname=('python-hookmeup' 'python2-hookmeup')
_name=${pkgname#python-}
pkgver=1.0.4
pkgrel=1
pkgdesc='A Git hook to automate your Pipenv and Django workflow'
arch=('any')
url='https://git.danielmoch.com/hookmeup'
license=('MIT')
makedepends=('python-pip' 'python2-pip' 'flit')
checkdepends=('python-pytest'
              'python-pytest-cov'
              'python-pytest-mock'
              'python-mock'
              'python2-pytest'
              'python2-pytest-cov'
              'python2-pytest-mock'
              'python2-mock')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
        "${_name}-${pkgver}.tar.gz.asc::https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz.asc")
validpgpkeys=('72A97F7072DDCE28058DEF30323C9F1784BDDD43')
sha256sums=('4a7f1be5b0ab20e1209235cebe14b18f08b2239abd56a7b94566fc1c9ab94d8a'
            'SKIP')

prepare() {
  cp -a ${_name}-$pkgver{,-py2}
}

build()
{
  cd "${srcdir}/${_name}-${pkgver}"
  flit build --format wheel

  cd "${srcdir}/${_name}-${pkgver}-py2"
  flit build --format wheel
}

check()
{
  cd "${srcdir}/${_name}-${pkgver}"
  python -m pytest

  cd "${srcdir}/${_name}-${pkgver}-py2"
  python2 -m pytest
}

package_python-hookmeup()
{
  depends=('python')
  cd "${srcdir}/${_name}-${pkgver}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  pip install -I --no-warn-script-location --isolated --no-deps --compile --root="${pkgdir}" dist/${_name}-${pkgver}-py2.py3-none-any.whl
}

package_python2-hookmeup()
{
  depends=('python2')
  cd "${srcdir}/${_name}-${pkgver}-py2"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  pip2 install -I --no-warn-script-location --isolated --no-deps --compile --root="${pkgdir}" dist/${_name}-${pkgver}-py2.py3-none-any.whl
  mv "${pkgdir}/usr/bin/hookmeup" "${pkgdir}/usr/bin/hookmeup2"
}

# vim: ft=PKGBUILD sts=2 sw=2 et
