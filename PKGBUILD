# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

_name=tzdata
pkgname=python-tzdata
pkgver=2022.5
pkgrel=1
pkgdesc='Provider of IANA time zone data'
arch=('any')
url=https://github.com/python/tzdata
license=('Apache')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-subtests')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('e15b2b3005e2546108af42a0eb4ccab4d9e225e2dfbf4f77aad50c70a4b1f3ab')
b2sums=('506352518815a22314ac3d8bcdffa9d999ed52ceb75f55a9591d1220a242519c9c7baf38d0495eedaf134af087bcedf8895fad1b52ac856e1aae646485911386')

build() {
  cd $_name-$pkgver
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd $_name-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  ln -s /etc/localtime "$pkgdir/$site_packages"/tzdata/zoneinfo/localtime
}
