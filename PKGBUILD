# Maintainer: Erich Eckner <arch at eckner dot net>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=python-ipympl
_pkgname="${pkgname#*-}"
pkgver=0.5.2
pkgrel=1
pkgdesc="Matplotlib Jupyter Extension"
url="https://pypi.org/project/ipympl/"
_depends=(
  'python')
makedepends=(
  'python-setuptools')
license=('BSD')
arch=(any)
source=("https://pypi.python.org/packages/2e/5e/007059dcec577d2b174e782cbfd53fceb437c4b14bb0d1e108f55bd4c70e/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('4309f748dc0102cad4fff44d09960245406ce47d74497995d952dae267d09518a98c60e963f2cb2464867b61c61b8c873c584c0cd49565460c04f97b664f09ca')

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
