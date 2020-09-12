# Maintainer: Erich Eckner <arch at eckner dot net>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=python-ipympl
_pkgname="${pkgname#*-}"
pkgver=0.5.8
pkgrel=1
pkgdesc="Matplotlib Jupyter Extension"
url="https://pypi.org/project/ipympl/"
depends=(
  'python>=3.8'
  'python<3.9')
makedepends=(
  'python-setuptools')
license=('BSD')
arch=(any)
source=("https://pypi.python.org/packages/55/87/546ba490deb925f27bba713d646ec0290676cc2a7f4ff60486810a2766c6/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('dc3f6c767d764e3b77d7b4ef26698bceebd6d81d8eea9953ea44e40efbf74f110e1a98f74c4f093c83ca71b8e344b4ac86899005f4dfa8b66d7bf614ee9b8d47')

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
