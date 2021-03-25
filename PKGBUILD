# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=jupyter-server-mathjax
pkgver=0.2.0
pkgrel=1
pkgdesc="MathJax resources as a Jupyter Server Extension"
arch=(any)
url="https://jupyter.org/"
license=(BSD)
depends=(jupyter-server mathjax2)
makedepends=(python-setuptools python-jupyter_packaging)
source=(https://pypi.io/packages/source/j/${pkgname//-/_}/${pkgname//-/_}-$pkgver.tar.gz)
sha256sums=('61d6842b3cc2f019826f43f3bbda8ce76963d4798e4f5c75b269718abded2402')

build() {
  cd ${pkgname//-/_}-$pkgver
  python setup.py build 
}

package() {
  cd ${pkgname//-/_}-$pkgver
  python setup.py install --skip-build --root="$pkgdir" --optimize=1
  _pythonpath=`python -c "from sysconfig import get_path; print(get_path('platlib'))"`
  rm -r "$pkgdir"/$_pythonpath/jupyter_server_mathjax/static
  ln -s /usr/share/mathjax2 "$pkgdir"/$_pythonpath/jupyter_server_mathjax/static

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
