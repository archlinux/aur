# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=jupyter-server-mathjax
pkgver=0.2.3
pkgrel=3
pkgdesc='MathJax resources as a Jupyter Server Extension'
arch=(any)
url='https://jupyter.org/'
license=(BSD)
depends=(jupyter-server mathjax2)
makedepends=(python-setuptools python-jupyter_packaging)
source=(https://pypi.io/packages/source/j/${pkgname//-/_}/${pkgname//-/_}-$pkgver.tar.gz)
sha256sums=('564e8d1272019c6771208f577b5f9f2b3afb02b9e2bff3b34c042cef8ed84451')

build() {
  cd ${pkgname//-/_}-$pkgver
  python setup.py build 
}

package() {
  cd ${pkgname//-/_}-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  mv "$pkgdir"{/usr,}/etc

# Unbundle mathjax
  _pythonpath=`python -c "from sysconfig import get_path; print(get_path('platlib'))"`
  rm -r "$pkgdir"/$_pythonpath/jupyter_server_mathjax/static
  ln -s /usr/share/mathjax2 "$pkgdir"/$_pythonpath/jupyter_server_mathjax/static

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
