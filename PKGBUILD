# Maintainer: Antonio Rojas <arojas@archlinux.org>

_pyname=nbclassic
pkgname=jupyter-$_pyname
pkgver=1.2.0
pkgrel=1
pkgdesc='Jupyter Notebook as a Jupyter Server Extension'
arch=(any)
url='https://jupyter.org/'
license=(BSD-3-Clause)
depends=(jupyter-nbconvert
         jupyter-nbformat
         jupyter-notebook-shim
         jupyter-server
         mathjax2
         python
         python-ipython-genutils
         python-jupyter-core
         python-jupyter-server-terminals
         python-tornado
         python-traitlets)
makedepends=(bower
             git
             npm
             python-build
             python-installer
             python-jupyter-packaging)
checkdepends=(python-pytest-jupyter
              python-pytest-tornasync)
source=(git+https://github.com/jupyter/nbclassic#tag=v$pkgver)
sha256sums=('1b4de38a4b459c57964d00a97dde4c1cd137dbc6e775306d2314e82e78a29c06')

prepare() {
  cd $_pyname
  git cherry-pick -n 2545d900b40bbb9fa3ea266afa617e6e0be70c71 # Fix build with Python 3.13
}

build() {
  cd $_pyname
  python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
  cd $_pyname
  pytest -v
}

package() {
  cd $_pyname
  python -m installer --destdir="$pkgdir" dist/*.whl
  mv "$pkgdir"/{usr/,}etc
# Unbundle mathjax
  _pythonpath=`python -c "from sysconfig import get_path; print(get_path('platlib'))"`
  rm -r "$pkgdir"$_pythonpath/nbclassic/static/components/MathJax
  ln -s /usr/share/mathjax2 "$pkgdir"$_pythonpath/nbclassic/static/components/MathJax

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
# Remove tests
  rm -r "$pkgdir"/usr/lib/python*/site-packages/nbclassic/tests/
}
