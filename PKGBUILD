# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=bump-pydantic
pkgver=0.6.0
pkgrel=1
pkgdesc='Convert Pydantic from V1 to V2 ♻'
arch=('any')
url=https://github.com/pydantic/bump-pydantic
license=('MIT')
depends=('python-libcst' 'python-rich' 'python-typer' 'python-typing_extensions')
makedepends=('git' 'python-build' 'python-hatchling' 'python-installer')
checkdepends=('python-pytest')
source=("git+$url.git#tag=$pkgver")
b2sums=('SKIP')

build() {
  cd $pkgname
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd $pkgname
  PYTHONPATH="$pkgname:$PYTHONPATH" pytest
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/"$_name"-$pkgver.dist-info/licenses/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
