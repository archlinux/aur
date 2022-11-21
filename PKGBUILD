# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Maintainer: Bruno Pagani <archange@archlinux.org>

_name=matplotlib-inline
pkgname=python38-matplotlib-inline
pkgver=0.1.6
pkgrel=2
pkgdesc='Inline Matplotlib backend for Jupyter'
arch=('any')
url=https://github.com/ipython/matplotlib-inline
license=('BSD')
depends=('python38-traitlets')
makedepends=('python38-build' 'python38-installer' 'python38-setuptools'
             'python38-wheel')
checkdepends=('ipython' 'python38-matplotlib')
optdepends=('python38-matplotlib')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('f887e5f10ba98e8d2b150ddcf4702c1e5f8b3a20005eb0f74bfdbd360ee6f304')
b2sums=('3c8579660c36f790604c2ddcc99b587b8f54135f823d1a04b3e7ad5709bf7ba49cecd22da164c7bd6ffba4b84d61681f063ca036fba2d4a0cfaf81a9ea66a7e2')

build() {
  cd $_name-$pkgver
  python3.8 -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd $_name-$pkgver
  python3.8 -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -c 'from matplotlib_inline.backend_inline import show'
}

package() {
  cd $_name-$pkgver
  python3.8 -m installer --destdir="$pkgdir" dist/*.whl

  # Symlink license file
  local site_packages=$(python3.8 -m "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/matplotlib_inline-$pkgver.dist-info/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
