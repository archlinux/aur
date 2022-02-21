# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=jupyter-server-mathjax
pkgver=0.2.5
pkgrel=1
pkgdesc='MathJax resources as a Jupyter Server Extension'
arch=(any)
url='https://jupyter.org/'
license=(BSD)
depends=(jupyter-server mathjax2)
makedepends=(python-build python-installer python-jupyter_packaging)
source=(https://pypi.io/packages/source/j/${pkgname//-/_}/${pkgname//-/_}-$pkgver.tar.gz)
sha256sums=('64d96c8e6dfe6edba737902b2dc3a2dc058f17516776c25f4d30ca24617ee7b3')

build() {
  cd ${pkgname//-/_}-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd ${pkgname//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  mv "$pkgdir"{/usr,}/etc

# Unbundle mathjax
  _pythonpath=`python -c "from sysconfig import get_path; print(get_path('platlib'))"`
  rm -r "$pkgdir"/$_pythonpath/jupyter_server_mathjax/static
  ln -s /usr/share/mathjax2 "$pkgdir"/$_pythonpath/jupyter_server_mathjax/static

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
