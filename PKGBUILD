# Maintainer: Erich Eckner <arch at eckner dot net>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=python-ipympl
_pkgname="${pkgname#*-}"
pkgver=0.8.8
pkgrel=1
pkgdesc="Matplotlib Jupyter Extension"
url="https://pypi.org/project/ipympl/"
depends=(
  'jupyter'
  'jupyterlab'
  'jupyterlab_pygments'
  'npm'
  'python')
makedepends=(
  'python-setuptools')
license=('BSD')
arch=(any)
source=("https://pypi.python.org/packages/a7/f4/cf0df832bf9d5de54641fe31721df380e5c6a5cb95861c757881e87e3065/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('5e9448c57cc871a93c318b37d1a6ed5384b7ba77a34777e304b02ead88e3cc43812f8f0d7199402522513d5dec561f641362e58b4c0e7ba9acc1ec23f128a6c5')

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
