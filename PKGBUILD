# Maintainer: Antonio Rojas <arojas@archlinux.org>

_pyname=nbclassic
pkgname=jupyter-$_pyname
pkgver=1.3.3
pkgrel=2
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
             python-babel
             python-build
             python-hatch-jupyter-builder
             python-hatchling
             python-installer
             yarn)
checkdepends=(python-pytest-jupyter
              python-pytest-tornasync)
source=(git+https://github.com/jupyter/nbclassic#tag=v$pkgver)
sha256sums=('44fba34a96c0c029d074254cc7706d28b36f532b774857b2ad3cae04532f2ede')

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
