# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=ruff-lsp
pkgver=0.0.53
pkgrel=3
pkgdesc='Language Server Protocol implementation for Ruff'
arch=('any')
url=https://github.com/astral-sh/ruff-lsp
license=('MIT')
depends=('python-packaging' 'python-pygls' 'python-typing_extensions' 'ruff')
makedepends=('git' 'python-build' 'python-hatchling' 'python-installer')
checkdepends=('python-lsp-jsonrpc' 'python-pytest-asyncio')
source=("git+$url.git#tag=v$pkgver")
b2sums=('f6561b5c56b227e1ceb1de802c9defcfdeeffa9aae02b8513f831c2f1b6af3be7738135fe97c0541939cd653fd49167c845e3f4436b9030d2a9528add963bb97')

build() {
  cd $pkgname
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd $pkgname
  pytest
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/${pkgname/-/_}-$pkgver.dist-info/licenses/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
