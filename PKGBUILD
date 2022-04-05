
# Maintainer: Specter119 <spcter119 AT gmail.com>
# Contributor: Erich Eckner <arch at eckner dot net>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=python-ipympl
_name=${pkgname#python-}
pkgver=0.8.8
pkgrel=2
pkgdesc="Matplotlib Jupyter Extension"
url="https://pypi.org/project/ipympl/"
depends=(
  'python')
makedepends=(
  'jupyter-notebook'
  'jupyterlab'
  'jupyterlab_pygments'
  'python-setuptools')
license=('BSD')
arch=(any)
source=("https://pypi.python.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('5e9448c57cc871a93c318b37d1a6ed5384b7ba77a34777e304b02ead88e3cc43812f8f0d7199402522513d5dec561f641362e58b4c0e7ba9acc1ec23f128a6c5')

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
