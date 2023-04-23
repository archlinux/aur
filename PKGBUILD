
# Maintainer: Specter119 <spcter119 AT gmail.com>
# Contributor: Erich Eckner <arch at eckner dot net>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=python-ipympl
_name=${pkgname#python-}
pkgver=0.9.3
pkgrel=1
pkgdesc="Matplotlib Jupyter Extension"
url="https://pypi.org/project/ipympl/"
depends=(
  'python'
  'ipython<9'
  'python-numpy'
  'python-ipython-genutils'
  'python-pillow'
  'python-traitlets<6'
  'python-ipywidgets<9'
  'python-matplotlib<4'
)
makedepends=(
  'jupyter-notebook'
  'jupyterlab'
  'jupyterlab_pygments'
  'python-setuptools')
license=('BSD')
arch=(any)
source=("https://pypi.python.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('49bab75c05673a6881d1aaec5d8ac81d4624f73d292d154c5fb7096f10236a2b')

build() {
  cd $_name-$pkgver
  python setup.py build
}

package() {
  cd $_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
  _extname=jupyter-matplotlib
  mkdir -p $pkgdir/usr/share/jupyter/{nb,lab}extensions
  _dir_sitepackage=$(python -c 'import sysconfig; print(sysconfig.get_paths()["purelib"])')
  ln -s ${_dir_sitepackage}/$_name/labextension $pkgdir/usr/share/jupyter/labextensions/$_extname
  ln -s ${_dir_sitepackage}/$_name/nbextension $pkgdir/usr/share/jupyter/nbextensions/$_extname
  install -Dm 644 jupyter-matplotlib.json $pkgdir/etc/jupyter/nbconfig/notebook.d/jupyterlab-matplotlib.json
  install -Dm 644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
