# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_name=notifiers
pkgbase='python-notifiers'
pkgname=('python-notifiers' 'python2-notifiers')
pkgver=0.7.2
pkgrel=1
pkgdesc="Python logging library for easily sending notifications"
arch=('any')
url="https://pypi.python.org/pypi/notifiers"
license=('MIT')
makedepends=(
  'python' 'python-setuptools'
  'python2' 'python2-setuptools')
options=(!emptydirs)
source=("${pkgname}"-"${pkgver}".tar.gz::https://pypi.io/packages/source/"${_name:0:1}"/"${_name}"/"${_name}"-"${pkgver}".tar.gz)
sha256sums=('671a00844ac54317b11b3501bde47fdb1d9be52d37f78abd245aa0f00ebfdf9a')

prepare() {
  cp -a "${_name}"-"${pkgver}"{,-py2}

  # README.MD is not packaged in the 'tar.gz' so strike reading it.
  cd "${srcdir}"/"${_name}"-"${pkgver}"
  sed -i -e '6 {s/^/#/}' -e '7 {s/.*/long_description=""/}' setup.py

  cd "${srcdir}"/"${_name}"-"${pkgver}"-py2
  sed -i -e '6 {s/^/#/}' -e '7 {s/.*/long_description=""/}' setup.py
}

build(){
  cd "${srcdir}"/"${_name}"-"${pkgver}"

  python setup.py build

  cd "${srcdir}"/"${_name}"-"${pkgver}"-py2
  python2 setup.py build
}

package_python2-notifiers() {
  depends=(
    'python2'
    'python2-click'
    'python2-requests')

  cd "${_name}"-"${pkgver}"-py2
  python2 setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}

package_python-notifiers() {
  depends=(
    'python'
    'python-click'
    'python-requests')

  cd "${_name}"-"${pkgver}"
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
