# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=ruff-lsp
_name=${pkgname/-/_}
pkgver=0.0.35
pkgrel=1
pkgdesc='Language Server Protocol implementation for Ruff'
arch=('any')
url=https://github.com/astral-sh/ruff-lsp
license=('MIT')
depends=('python-pygls' 'python-typing_extensions' 'ruff')
makedepends=('python-build' 'python-hatchling' 'python-installer')
checkdepends=('python-lsp-jsonrpc' 'python-pytest-asyncio')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('a91369b30a508adbd57331412ac50595ec3e5b5b848ed91b5a79b0051507ab4c')
b2sums=('0a5dab246274d0d3f68c08a5d38e2ef622de4241f657eed745f9d20103379efc485893131e7fa6f41947fd5a85e544b90408dc1812b3f2032e90ba3227bccc07')

build() {
  cd "$_name"-$pkgver
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd "$_name"-$pkgver
  pytest
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
