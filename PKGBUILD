# Maintainer: Antonio Rojas <arojas@archlinux.org>

_pipname=nbclassic
pkgname=jupyter-$_pipname
pkgver=0.5.5
pkgrel=2
pkgdesc='Jupyter Notebook as a Jupyter Server Extension'
arch=(any)
url='https://jupyter.org/'
license=(custom)
depends=(python-jupyter-server-terminals jupyter-notebook-shim mathjax2)
makedepends=(python-build python-installer python-setuptools)
checkdepends=(python-pytest-tornasync python-pytest-jupyter)
source=(https://pypi.io/packages/source/${_pipname:0:1}/$_pipname/$_pipname-$pkgver.tar.gz)
sha256sums=('d2c91adc7909b0270c73e3e253d3687a6704b4f0a94bc156a37c85eba09f4d37')

build() {
  cd $_pipname-$pkgver
  python -m build --wheel --no-isolation --skip-dependency-check
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
