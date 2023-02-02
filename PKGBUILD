# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=ruff-lsp
_name=${pkgname/-/_}
pkgver=0.0.17
pkgrel=1
pkgdesc='Language Server Protocol implementation for Ruff'
arch=('any')
url=https://github.com/charliermarsh/ruff-lsp
license=('MIT')
depends=('python-pygls' 'python-typing_extensions' 'ruff')
makedepends=('python-build' 'python-hatchling' 'python-installer')
checkdepends=('python-lsp-jsonrpc')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('e7128884bcf4eb2d42c4b86d26950e85ca01ec73a2e6614428835c819b3876c5')
b2sums=('fc2eeb0346498c26bfbbd4cf05e903e2faaedb637382f95543a4f04b640f42c1437540a5d76f1a331c148b3d25533b4af6d7cb4f5715f8f21cee89228ea6fc9f')

build() {
  cd "$_name"-$pkgver
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd "$_name"-$pkgver
  python -m unittest
}

package() {
  cd "$_name"-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/"$_name"-$pkgver.dist-info/licenses/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
