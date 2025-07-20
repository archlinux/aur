# Maintainer: 
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Felix Yan <felixonmars@archlinux.org>
pkgname=python-pytest-black
_name=${pkgname#python-}
pkgver=0.6.0
pkgrel=2
pkgdesc="A pytest plugin to enable formatting checks with black"
arch=('any')
url="https://github.com/coherent-oss/pytest-black"
license=('MIT')
depends=(
  'python-black'
  'python-pytest'
  'python-toml'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools-scm'
  'python-wheel'
)
checkdepends=('python-pytest')
source=("$_name-$pkgver.tar.gz::https://github.com/coherent-oss/pytest-black/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('90500bd9deb30ecf4985f496d5390f5366817faba3738898f1994db8eb53dce7')

build() {
  cd "$_name-$pkgver"
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"

  # Hack entry points by installing it
  python -m installer --destdir="$PWD/tmp_install" dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  PYTHONPATH="$PWD/tmp_install/${site_packages}:$PYTHONPATH:$PWD/tests" pytest
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
