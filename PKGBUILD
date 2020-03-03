# Maintainer: Erich Eckner <arch at eckner dot net>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=python-ipympl
_pkgname="${pkgname#*-}"
pkgver=0.5.3
pkgrel=1
pkgdesc="Matplotlib Jupyter Extension"
url="https://pypi.org/project/ipympl/"
_depends=(
  'python')
makedepends=(
  'python-setuptools')
license=('BSD')
arch=(any)
source=("https://pypi.python.org/packages/f0/e4/282cac109b555638b73dabd23c17813c0ebdf6a0d195109d44fa5c2be431/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('5d8b42fd6f4442b9367282bce611b37d9e907406d7ecb5cc4aa06b7108ac29541bb5d28498cd1d59936c54c3b730744e0ac2996274207181d8f7a278efddd1b8')

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
