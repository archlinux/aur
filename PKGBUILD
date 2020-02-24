# Maintainer: Erich Eckner <arch at eckner dot net>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=python-ipympl
_pkgname="${pkgname#*-}"
pkgver=0.4.1
pkgrel=2
pkgdesc="Matplotlib Jupyter Extension"
url="https://pypi.org/project/ipympl/"
_depends=(
  'python>=3.8'
  'python<3.9')
makedepends=(
  'python-setuptools')
license=('BSD')
arch=(any)
source=("https://pypi.python.org/packages/38/27/fc9dee4779bd3ff3086b8776cea47094548a84e3e9887a45426ab9d0c539/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('2cb2b38f5a1a32f8fe3bf33fc63b55ba60953faadea1282ff4591f44556dd8fcff1a6da59af6e6491d474765a82f7e69a7fc213b39b9b46e6b5e5000cca7f731')

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
  mv "${pkgdir}/usr/etc" "${pkgdir}/"
  rm -rf --one-file-system "${pkgdir}/usr/share/jupyter/lab"
  install -D "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
