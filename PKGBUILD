# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

_name=tzdata
pkgname=python-tzdata
pkgver=2022.6
pkgrel=1
pkgdesc='Provider of IANA time zone data'
arch=('any')
url=https://github.com/python/tzdata
license=('Apache')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-subtests')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('91f11db4503385928c15598c98573e3af07e7229181bee5375bd30f1695ddcae')
b2sums=('b74546378b99fc4fadf68308d29eaa5ca5611ddf5a4d28da5658ed0501d63e3aa78636a43ae5caa10a09e890454c0b84c5f939c0fd2b3b1192726de6e07bc024')

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
