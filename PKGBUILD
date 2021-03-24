# Maintainer: Erich Eckner <arch at eckner dot net>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=python-ipympl
_pkgname="${pkgname#*-}"
pkgver=0.7.0
pkgrel=2
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
source=("https://pypi.python.org/packages/97/4e/d4b5fee6517b56ad4e5b356d53ab65f780bd313ade652711630d60e52c4e/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('23b22f4449ca67fc2e282ce8fd45dc2e4fa2b88e833c24f3065ed441590d25014898ad4e3a076ddff195d5685107177903d600015d5739cd4ee69c1e07f06bbc')

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
