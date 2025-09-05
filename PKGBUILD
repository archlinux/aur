# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=groq
pkgname=python-$_name
pkgver=0.31.1
pkgrel=1
pkgdesc='The official Python library for the groq API.'
arch=('any')
url='https://github.com/groq/groq-python'
license=('Apache-2.0')
depends=('python' 'python-httpx' 'python-pydantic' 'python-typing_extensions' 'python-anyio' 'python-distro' 'python-sniffio')
makedepends=('python-hatchling' 'python-hatch-fancy-pypi-readme' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-respx' 'python-pytest' 'python-pytest-asyncio' 'python-time-machine' 'python-dirty-equals' 'python-rich' 'python-nest-asyncio' 'python-pytest-xdist' 'python-aiohttp' 'python-httpx-aiohttp' 'npm' 'nodejs-lts-jod')
optdepends=('python-aiohttp: aiohttp' 'python-httpx-aiohttp: aiohttp')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
validpgpkeys=('2EECE5156D8DE0C50636E37621707FBE029E96B5')
sha256sums=('4063a917309d245e51f01c90bb1642c67460fc98f0a041df7fc63ba3d701c028')

build() {
  cd "$srcdir"/$_name-python-$pkgver
  python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
  export DEFER_PYDANTIC_BUILD=false
  local pytest_options=(
    -vv
  )
  cd "$srcdir"/$_name-python-$pkgver
  trap 'pkill "npm exec prism"' EXIT
  ./scripts/mock --daemon
  PYTHONPATH=$PWD/src pytest "${pytest_options[@]}" tests
}

package() {
  cd "$srcdir"/$_name-python-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
