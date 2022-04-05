# Maintainer: Ke Liu <spcter119 AT gmail.com>

pkgname=jupyterlab_code_formatter
pkgver=1.4.10
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
sha256sums=('1645fd80b99d590d60fe0f3c078c9101ad62dfdbfac5e78b4c2d334896ab526f')

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
