# Maintainer: Erich Eckner <arch at eckner dot net>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=python-ipympl
_pkgname="${pkgname#*-}"
pkgver=0.8.4
pkgrel=1
pkgdesc="Matplotlib Jupyter Extension"
url="https://pypi.org/project/ipympl/"
depends=(
  'python')
makedepends=(
  'jupyter'
  'jupyterlab'
  'jupyterlab_pygments'
  'npm'
  'python-setuptools'
  'python-jupyter_packaging')
license=('BSD')
arch=(any)
source=("https://pypi.python.org/packages/a8/ad/835a71e225b5378979a4b1526f1f23948a19e57379f3cdc829b1f9a2dac2/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('6c878c06179895cfccb47b53817a64a5715545437031f77c33a37c3da868fd380111029f5318b3f3128913d76269250c7ea38dcc2b0deab74d0cd9ea5f165adf')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  py_ver=$(python --version | cut -d' ' -f2 | cut -d. -f1,2)
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  # install (and enable) extension according to
  # https://jupyterlab.readthedocs.io/en/latest/extension/extension_dev.html#distributing-a-prebuilt-extension
  prebuilt_extension_dir_lab="$pkgdir"/usr/share/jupyter/labextensions
  mkdir -p $prebuilt_extension_dir_lab
  ln -s /usr/lib/python${py_ver}/site-packages/ipympl/labextension "${prebuilt_extension_dir_lab}/jupyter-matplotlib"

  # for classic interface
  prebuilt_extension_dir_classic="$pkgdir"/usr/share/jupyter/nbextensions
  mkdir -p $prebuilt_extension_dir_classic
  ln -s /usr/lib/python${py_ver}/site-packages/ipympl/nbextension "${prebuilt_extension_dir_classic}/jupyter-matplotlib"

  install -D "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
