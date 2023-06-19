# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=ruff-lsp
_name=${pkgname/-/_}
pkgver=0.0.32
pkgrel=1
pkgdesc='Language Server Protocol implementation for Ruff'
arch=('any')
url=https://github.com/astral-sh/ruff-lsp
license=('MIT')
depends=('python-pygls' 'python-typing_extensions' 'ruff')
makedepends=('python-build' 'python-hatchling' 'python-installer')
checkdepends=('python-lsp-jsonrpc' 'python-pytest-asyncio')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('9faf486e6f921698c49303e86002715669a0b6b461cd68743cb7d17be88bc5da')
b2sums=('f6cb0e9be8ec1c7b448020cb8fc817ae9407dfa933d0c582cc32fe141d29e1503e1572eb8ce7189a2aca02271311f64c2f9f994562e5138a69d4af4e57a1ab42')

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
