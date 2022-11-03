# Maintainer: Antonio Rojas <arojas@archlinux.org>

_pipname=nbclassic
pkgname=jupyter-$_pipname
pkgver=0.4.8
pkgrel=1
pkgdesc='Jupyter Notebook as a Jupyter Server Extension'
arch=(any)
url='https://jupyter.org/'
license=(custom)
depends=(jupyter-server jupyter-notebook-shim mathjax2)
makedepends=(python-build python-installer python-setuptools)
checkdepends=(python-pytest-tornasync)
source=(https://pypi.io/packages/source/${_pipname:0:1}/$_pipname/$_pipname-$pkgver.tar.gz)
sha256sums=('c74d8a500f8e058d46b576a41e5bc640711e1032cf7541dde5f73ea49497e283')

build() {
  cd $_pipname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_pipname-$pkgver
  pytest -v
}

package() {
  cd $_pipname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  mv "$pkgdir"/{usr/,}etc
# Unbundle mathjax
  _pythonpath=`python -c "from sysconfig import get_path; print(get_path('platlib'))"`
  rm -r "$pkgdir"$_pythonpath/nbclassic/static/components/MathJax
  ln -s /usr/share/mathjax2 "$pkgdir"$_pythonpath/nbclassic/static/components/MathJax

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
