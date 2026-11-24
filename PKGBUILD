# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=spitch
pkgname=python-$_name
pkgver=1.52.0
pkgrel=1
pkgdesc='The official Python library for the spitch API.'
arch=('any')
url='https://github.com/spi-tch/spitch-python'
license=('Apache-2.0')
depends=('python'
         'python-httpx'
         'python-pydantic'
         'python-typing_extensions'
         'python-anyio'
         'python-distro'
         'python-sniffio')
makedepends=('python-hatchling'
             'python-hatch-fancy-pypi-readme'
             'python-build'
             'python-installer')
checkdepends=('python-respx'
              'python-pytest'
              'python-pytest-asyncio'
              'python-pytest-xdist'
              'python-time-machine'
              'python-dirty-equals'
              'python-rich'
              'python-httpx-aiohttp'
              'python-aiohttp')
optdepends=('python-aiohttp: aiohttp'
            'python-httpx-aiohttp: aiohttp')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('aa55cea25eb2f5908fc155ac439e8a7d78ad4f45614a43b924534e4d3f23d377')

prepare() {
  cd "$_name-python-$pkgver"
  # Use the hatchling version shipped by Arch
  sed -i '/^requires = /s/"hatchling[<>=!~][^"]*"/"hatchling"/' pyproject.toml
}

build() {
  cd "$_name-python-$pkgver"
  python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
  export DEFER_PYDANTIC_BUILD=false
  local pytest_options=(
    -vv
    --disable-warnings
    -p 'no:benchmark'
  )
  cd "$_name-python-$pkgver"
  PYTHONPATH="$PWD"/src python scripts/mock pytest "${pytest_options[@]}" tests
}

package() {
  cd "$_name-python-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
