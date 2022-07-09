# Maintainer: Tyler Veness <calcmogul at gmail dot com>

pkgname=python-control
pkgver=0.9.2
pkgrel=1
pkgdesc="Implements basic operations for analysis and design of feedback control systems in Python"
arch=('any')
license=('BSD')
url="https://github.com/python-control/python-control"
depends=('python-scipy'
         'python-matplotlib')
optdepends=('python-slycot: matrix equation support, model simplification tools, and state feedback')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-pytest-timeout' 'python-slycot' 'xorg-server-xvfb')
options=('staticlibs')
source=("https://files.pythonhosted.org/packages/source/c/control/control-${pkgver}.tar.gz")
md5sums=('f20f849e5e0e82836f1a8bfa74dbb129')

build() {
  export LDFLAGS="$LDFLAGS -shared"

  cd control-$pkgver
  python setup.py build
}

check() {
  cd control-$pkgver
  # slycot 0.4 precision errors
  donttest="test_bdschur or test_modal_form or testBalred"
  xvfb-run --auto-servernum pytest control/tests -k "not ($donttest)"
}

package() {
  export LDFLAGS="$LDFLAGS -shared"

  cd control-$pkgver
  python setup.py install --skip-build --root="${pkgdir}" --optimize=1

  install -m755 -d "${pkgdir}/usr/share/licenses/python-control"
  install -m644 LICENSE "${pkgdir}/usr/share/licenses/python-control/"
}
