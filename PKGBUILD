# Maintainer: Sander Vocke <sandervocke@gmail.com>

_pkgname=py-build-cmake
pkgname=python-$_pkgname
pkgver=0.1.8
pkgrel=2
pkgdesc='Modern, PEP 517 compliant build backend for creating Python packages with extensions built using CMake.'
arch=('any')
url='https://github.com/tttapa/py-build-cmake'
license=('MIT')
depends=('python-distlib' 'python-flit-core' 'python-tomli' 'python-click')
optdepends=('python-virtualenv: Use virtualenv for build isolation')
makedepends=('git' 'python-build' 'python-flit-core' 'python-installer')
checkdepends=('python-pytest')
source=("git+$url#tag=$pkgver")
# validpgpkeys=()
sha512sums=('SKIP')

build() {
  cd $_pkgname

  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd $_pkgname

  PYTHONPATH=src pytest
}

package() {
  cd $_pkgname

  python -m installer --destdir="$pkgdir" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/$_pkgname-$pkgver.dist-info/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
