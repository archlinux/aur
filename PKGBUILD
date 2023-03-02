# Maintainer: Specter119 <spcter119 AT gmail.com>

pkgname=jupyterlab-lsp
pkgver=3.10.2
pkgrel=1
pkgdesc='Coding assistance for JupyterLab with Language Server Protocol.'
arch=(any)
url=https://pypi.org/project/$pkgname
license=(MIT)
depends=(python jupyter-lsp jupyterlab)
makedepends=(python-setuptools)
source=(https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('559ad4692f97f42dd6b9f0b330ab92703f02b8e45bbaf6e9cf59898a897222a0')

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
