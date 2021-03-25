# Maintainer: Tyler Veness <calcmogul at gmail dot com>

pkgname=python-control-git
pkgver=1318.203cae8
pkgrel=1
pkgdesc="Implements basic operations for analysis and design of feedback control systems in Python"
arch=('any')
license=('BSD')
url="https://github.com/python-control/python-control"
depends=('python-scipy'
         'python-matplotlib')
optdepends=('python-slycot-git: matrix equation support, model simplification tools, and state feedback')
makedepends=('git' 'python-setuptools')
checkdepends=('python-nose' 'python-pytest' 'python-slycot-git' 'xorg-server-xvfb')
options=('staticlibs')
source=("git+https://github.com/python-control/python-control.git"
        "LICENSE")
md5sums=('SKIP'
         '5e21e2b8826c3345f50711d5634bc975')

pkgver() {
  cd "$srcdir/python-control"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  export LDFLAGS="$LDFLAGS -shared"

  cd python-control
  python setup.py build
}

check() {
  cd python-control
  xvfb-run --auto-servernum pytest control/tests
}

package() {
  export LDFLAGS="$LDFLAGS -shared"

  cd python-control
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1

  install -m755 -d "${pkgdir}/usr/share/licenses/python-control"
  install -m644 ../LICENSE "${pkgdir}/usr/share/licenses/python-control/"
}
