# Maintainer: Specter119 <spcter119 AT gmail.com>

pkgname=jupyterlab-lsp
pkgver=3.10.0
pkgrel=1
pkgdesc='Coding assistance for JupyterLab with Language Server Protocol.'
arch=(any)
url=https://pypi.org/project/$pkgname
license=(MIT)
depends=(python jupyter-lsp jupyterlab)
makedepends=(python-setuptools)
source=(https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('f3f6464c8c2916e3e261519964b17ed4673c689716737062aed5dd6a160ac2df')

build() {
  cd $srcdir/$pkgname-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$pkgname-$pkgver
  python setup.py install --root $pkgdir --skip-build --optimize=1
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  _dev_ups=krassowski
  _dir_ext=$pkgdir/usr/share/jupyter/labextensions/@$_dev_ups/$pkgname
  rm -rf ${_dir_ext}
  _dir_sitepackage=$(python -c 'import sysconfig; print(sysconfig.get_paths()["purelib"])')
  ln -s ${_dir_sitepackage}/${pkgname//-/_}/labextensions/@$_dev_ups/$pkgname ${_dir_ext}
  cd $pkgdir/${_dir_sitepackage}/${pkgname//-/_}/labextensions/@$_dev_ups/$pkgname
  ln -sf ../../../install.json ./
}
