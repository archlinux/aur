# Maintainer: Ke Liu <spcter119 AT gmail.com>

pkgname=jupyterlab_code_formatter
pkgver=1.4.11
pkgrel=2
pkgdesc='A universal code formatter for JupyterLab.'
arch=(any)
url=https://pypi.org/project/${pkgname//_/-}
license=(MIT)
depends=(python
         jupyter-notebook
         jupyterlab
         python-jupyter_packaging)
makedepends=(python-setuptools)
optdepends=(autopep8 yapf python-isort python-black)
source=(https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('b05f65b4b1499feeccae0d273b8fad8d37f6c8acaa32da10d4fc00dc223d2bde')

build() {
  cd $srcdir/$pkgname-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$pkgname-$pkgver
  python setup.py install --root $pkgdir --skip-build --optimize=1
  _dev_ups=ryantam626
  mkdir -p $pkgdir/{etc,usr/share/jupyter/labextensions/@$_dev_ups}
  _dir_sitepackage=$(python -c 'import sysconfig; print(sysconfig.get_paths()["purelib"])')
  ln -s ${_dir_sitepackage}/$pkgname/labextension $pkgdir/usr/share/jupyter/labextensions/@$_dev_ups/$pkgname
  cp -r $srcdir/$pkgname-$pkgver/jupyter-config $pkgdir/etc/jupyter
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
