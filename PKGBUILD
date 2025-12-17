# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=jupyter-server-mathjax
pkgver=0.2.6
pkgrel=5
pkgdesc='MathJax resources as a Jupyter Server Extension'
arch=(any)
url='https://jupyter.org/'
license=(BSD)
depends=(jupyter-server mathjax2)
makedepends=(python-build python-installer python-jupyter_packaging python-setuptools)
source=(https://pypi.io/packages/source/j/${pkgname//-/_}/${pkgname//-/_}-$pkgver.tar.gz)
sha256sums=('bb1e6b6dc0686c1fe386a22b5886163db548893a99c2810c36399e9c4ca23943')

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
