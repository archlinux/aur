# Maintainer: Erich Eckner <arch at eckner dot net>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=python-ipympl
_pkgname="${pkgname#*-}"
pkgver=0.6.3
pkgrel=1
pkgdesc="Matplotlib Jupyter Extension"
url="https://pypi.org/project/ipympl/"
depends=(
  'python'
  'python-matplotlib')
makedepends=(
  'jupyter'
  'jupyterlab'
  'jupyterlab_pygments'
  'npm'
  'python-setuptools'
  'python-jupyter_packaging')
license=('BSD')
arch=(any)
source=("https://pypi.python.org/packages/46/5a/1881283fd5978e6e57819656cb9833fdabb5c242e34f7d5a8419693199f2/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('0a8dc5d34740817efcf61debf71f4e4fbe0b8932c2c205641aefe5bf2e2d8f3eda6c6bb75fbcb26440b9ed09a805b8c2b32c53461ccc32e39981b7a0f5fdc121')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  py_ver=$(python --version | cut -d' ' -f2 | cut -d. -f1,2)
  mkdir -p "${pkgdir}/usr/lib/python${py_ver}/site-packages/jupyterlab"
  mkdir -p "${pkgdir}/usr/share/jupyter"
  ln -s "../../lib/python${py_ver}/site-packages/jupyterlab" "${pkgdir}/usr/share/jupyter/lab"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  rm -rf --one-file-system "${pkgdir}/usr/share/jupyter/lab"
  install -D "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
