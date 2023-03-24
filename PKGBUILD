# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

_name=tzdata
pkgname=python-tzdata
pkgver=2023.2
pkgrel=1
pkgdesc='Provider of IANA time zone data'
arch=('any')
url=https://github.com/python/tzdata
license=('Apache')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-subtests')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('c3b51b235b07f9f1889089c2264bcbeaaba260a63f89bea09e350ea4205eb95f')
b2sums=('dd24fe482a34292f2ed2f8b1e6a4da67ace27f447cb21e8ce3a9cc00443d2dccc38230ed9110b3541942aafadb5e9411704309e0d695300a4f085a1f3a9816aa')

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
