# Maintainer: Brendan Van Hook <brendan at vastactive dot com>

_pkgname=matlab_kernel
pkgname=jupyter-$_pkgname-git
pkgver=r156.3755cb2
pkgrel=1
pkgdesc="A Jupyter/IPython kernel for Matlab"
arch=('any')
url="https://github.com/Calysto/matlab_kernel.git"
license=('BSD')
depends=('python' 'jupyter' 'matlab-engine-for-python' 'jupyter-metakernel')
makedepends=('git' 'jupyter-metakernel')
provides=(jupyter-$_pkgname)
conflicts=(jupyter-$_pkgname)
source=("$_pkgname::git+https://github.com/Calysto/matlab_kernel.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $srcdir/$_pkgname
  python setup.py build
  python -W ignore -c "import json; from matlab_kernel.kernel import MatlabKernel; print(json.dumps(MatlabKernel.kernel_json))" > kernel.json
}

package() {
  cd $srcdir/$_pkgname
  python setup.py install --root="${pkgdir}" --optimize=1

  install -D -m644 LICENSE.txt $pkgdir/usr/share/licenses/${pkgname}/LICENSE
  install -D -m644 kernel.json "$pkgdir/usr/share/jupyter/kernels/$_pkgname/kernel.json"

  local _pyver=$(python --version | grep -o "3\.[0-9]")
  local _pydir=/usr/lib/python${_pyver}/site-packages
  cd $pkgdir/usr/share/jupyter/kernels/$_pkgname
  ln -s "$_pydir/metakernel/images/logo-32x32.png"
  ln -s "$_pydir/metakernel/images/logo-64x64.png"
}
