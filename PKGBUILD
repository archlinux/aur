# Maintainer: Erich Eckner <arch at eckner dot net>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=python-ipympl
_pkgname="${pkgname#*-}"
pkgver=0.8.2
pkgrel=38
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
source=("https://pypi.python.org/packages/8b/01/544cefd27f6b9b1d1722537bcd93f39035be136c18a268c743e0d51091aa/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('0878d8f0242c875a0bf258ca2718453afb83279a17660ff65f7d8c054fe0f34e83db99c8e450fe9c5b6c7e3621cccf8c4870a5ba1f49809e2e057c92969bcc10')

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
