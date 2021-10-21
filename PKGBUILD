# Maintainer: Erich Eckner <arch at eckner dot net>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=python-ipympl
_pkgname="${pkgname#*-}"
pkgver=0.8.1
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
source=("https://pypi.python.org/packages/9d/ec/6f0430ac2947f42733bc60bbae91134cccb1c853f4dc40bda436620356ca/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('651ded94bc7f6702887693d9f4152ffad7cbac15bb195e11161210ab840fd2022cfb6a19a5e7c6a75b41edbebeae1bfb1fec958e4cab38f66268fbc2b0404488')

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
