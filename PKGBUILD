# Maintainer: Erich Eckner <arch at eckner dot net>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=python-ipympl
_pkgname="${pkgname#*-}"
pkgver=0.5.6
pkgrel=1
pkgdesc="Matplotlib Jupyter Extension"
url="https://pypi.org/project/ipympl/"
_depends=(
  'python')
makedepends=(
  'python-setuptools')
license=('BSD')
arch=(any)
source=("https://pypi.python.org/packages/39/fb/0f16ff93510797e76658d29c4f567ac66dba03a7422d7a0fd3b5cc551030/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('119faf9be08c5a3456b5faa9aadad21865c12d92173815464a81c428b51a9e6a8586535c63ebd110130f950272a40915e77c8b6809608579fbffaf3825da08bd')

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
