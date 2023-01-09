# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=ruff-lsp
_name=${pkgname/-/_}
pkgver=0.0.15
pkgrel=1
pkgdesc='Language Server Protocol implementation for Ruff'
arch=('any')
url=https://github.com/charliermarsh/ruff-lsp
license=('MIT')
depends=('python-pygls' 'python-typing_extensions' 'ruff')
makedepends=('python-build' 'python-hatchling' 'python-installer')
checkdepends=('python-lsp-jsonrpc')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('516097af23e55b28b772f66c06202d18b5ad795bd39a0229f2da61c2f40f86cf')
b2sums=('14fafc65486ba434985958f244555eba83b75631cece2373e3cad36a434be259310097d5b6a3469bbc7ebdeeeaa329e5f08803008610329cf8e545e5bb660f52')

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
