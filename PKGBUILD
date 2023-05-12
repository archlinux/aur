# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=ruff-lsp
_name=${pkgname/-/_}
pkgver=0.0.27
pkgrel=1
pkgdesc='Language Server Protocol implementation for Ruff'
arch=('any')
url=https://github.com/charliermarsh/ruff-lsp
license=('MIT')
depends=('python-pygls' 'python-typing_extensions' 'ruff')
makedepends=('python-build' 'python-hatchling' 'python-installer')
checkdepends=('python-lsp-jsonrpc')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('329e4f5fced415400397f20dc59a6d4ec1d407136969246a76c3e044d9cb09a4')
b2sums=('14beebc9c2c7d823bb363d53b87fd2652e2daf83102f27f24a29d355bfaf7194e17f4895e04aade581aa2c89303f3c3d3fbd65c26c745c2da32e96c8cab9b682')

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
