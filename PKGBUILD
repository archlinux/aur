# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=aiothreads
pkgname=python-$_name
pkgver=1.1.4
pkgrel=1
pkgdesc='Glue between async and thread worlds.'
arch=('any')
url='https://github.com/mosquito/aiothreads'
license=('Apache-2.0')
depends=('python')
makedepends=('python-hatchling'
             'python-build'
             'python-installer')
checkdepends=('python-markdown-pytest'
              'python-pytest'
              'python-pytest-asyncio'
              'python-pytest-mypy-plugins')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('ab20438de2879310baa4d06ab5026edc1363a5124120669f18ffd9b17b1dc900')

prepare() {
  cd "$_name-$pkgver"
  # Set the version from the release tag, as upstream's publish workflow does
  sed -i "s/^version = .*/version = \"$pkgver\"/" pyproject.toml
  # Replace python-async-timeout with asyncio.timeout from the standard library
  sed -i 's/^from async_timeout import timeout$/from asyncio import timeout/' tests/test_decorators.py tests/test_iterator_wrapper.py
  # Match the type names printed by the current mypy, which no longer prefixes builtins
  sed -i 's/builtins\\\.//g' tests/test_type_checking.yml
}

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
    --override-ini="addopts="
  )
  cd "$_name-$pkgver"
  PYTHONPATH=$PWD pytest "${pytest_options[@]}" tests README.md
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
