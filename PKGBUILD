# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

_name=tzdata
pkgname=python-tzdata
pkgver=2021.3
pkgrel=1
pkgdesc='Provider of IANA time zone data'
arch=('any')
url=https://github.com/python/tzdata
license=('Apache')
depends=('python')
makedepends=('python-build' 'python-install' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-subtests')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('4996c063c777e06d5dcaf717b6dfb2798bc3767ea0091cb818c51f95f0eba0e1')
b2sums=('cb31e536b5d911060ff1ebf9400f6b504781e799dd048a6e1f6897e7475f1d48513e110f2636350eb3d37b8da6f674d12ba80dee50451962d3b558cc03ea0e46')

build() {
  cd $_name-$pkgver
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd $_name-$pkgver
  mkdir -p temp
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  python -m install --optimize=1 --destdir=temp dist/*.whl
  PYTHONPATH="$PWD/temp/$site_packages" pytest tests
}

package() {
  cd $_name-$pkgver
  python -m install --optimize=1 --destdir="$pkgdir" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/$_name-$pkgver.dist-info/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
