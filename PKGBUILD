# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=ruff-lsp
pkgver=0.0.36
pkgrel=1
pkgdesc='Language Server Protocol implementation for Ruff'
arch=('any')
url=https://github.com/astral-sh/ruff-lsp
license=('MIT')
depends=('python-pygls' 'python-typing_extensions' 'ruff')
makedepends=('python-build' 'python-hatchling' 'python-installer')
checkdepends=('python-lsp-jsonrpc' 'python-pytest-asyncio')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('4d1d1209a7977e63e6901a6bf4dd7ebf37a1fe65674d74d993944053bc41ff2d4384e4b8f3bba11523deeacb9a17395b410bc31120f7db0f47265948927beb0f')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd $pkgname-$pkgver
  pytest
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/${pkgname/-/_}-$pkgver.dist-info/licenses/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
