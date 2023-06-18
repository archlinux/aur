# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=ruff-lsp
_name=${pkgname/-/_}
pkgver=0.0.31
pkgrel=1
pkgdesc='Language Server Protocol implementation for Ruff'
arch=('any')
url=https://github.com/astral-sh/ruff-lsp
license=('MIT')
depends=('python-pygls' 'python-typing_extensions' 'ruff')
makedepends=('python-build' 'python-hatchling' 'python-installer')
checkdepends=('python-lsp-jsonrpc' 'python-pytest-asyncio')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('72a907842d312bafb1f367f5d15db35beb67f7b370d104a5fb6c356414e383ef')
b2sums=('a194a7b7f6cc92e663f48bc857750a03a556c0c704d85e63488a1508e5f4341cd7c33248bfb3236272a5b8b3f2cf2dc2f94f202b59629c422e4709509ae8dadf')

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
