# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=groq
pkgname=python-$_name
pkgver=1.6.0
pkgrel=1
pkgdesc='The official Python library for the groq API.'
arch=('any')
url='https://github.com/groq/groq-python'
license=('Apache-2.0')
depends=('python' 'python-httpx' 'python-pydantic' 'python-typing_extensions' 'python-anyio' 'python-distro' 'python-sniffio')
makedepends=('python-hatchling' 'python-hatch-fancy-pypi-readme' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-respx' 'python-pytest' 'python-pytest-asyncio' 'python-time-machine' 'python-dirty-equals' 'python-rich' 'python-pytest-xdist' 'python-aiohttp' 'python-httpx-aiohttp' 'npm' 'nodejs')
optdepends=('python-aiohttp: aiohttp' 'python-httpx-aiohttp: aiohttp')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e1ec3cf68a43bbc8f69f911abf26f57d04af55fdefd78223c2d1abae632dcb0c')

build() {
  cd "$srcdir"/$_name-python-$pkgver
  python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
  export DEFER_PYDANTIC_BUILD=false
  local pytest_options=(
    -vv
    --disable-warnings
    -p 'no:benchmark'
  )
  cd "$srcdir"/$_name-python-$pkgver
  trap 'pkill -f steady' EXIT
  ./scripts/mock --daemon
  PYTHONPATH=$PWD/src pytest "${pytest_options[@]}" tests
}

package() {
  cd "$srcdir"/$_name-python-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
