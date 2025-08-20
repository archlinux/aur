# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=gradio-client
pkgname=python-$_name
pkgver=1.12.1
pkgrel=1
pkgdesc='Python library for easily interacting with trained machine learning models.'
arch=(any)
_repo='https://github.com/gradio-app/gradio'
url="$_repo/tree/main/client/python"
license=('Apache-2.0')
depends=('python' 'python-fsspec' 'python-httpx' 'python-huggingface-hub' 'python-packaging' 'python-typing_extensions' 'python-websockets')
makedepends=('python-hatchling' 'python-hatch-requirements-txt' 'python-hatch-fancy-pypi-readme' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest-asyncio' 'python-pytest' 'python-pytest-xdist' 'python-gradio' 'python-pydub')
source=("$_repo/archive/refs/tags/${_name//-/_}@$pkgver.tar.gz")
sha256sums=('ecca45bcd322edc0ae0f8fb60032ac2c56907fd090649b8f2ea7df2facf2acdc')

build() {
  cd "$srcdir"/${_name//-client/}-${_name//-/_}-$pkgver/${_name//gradio-/}/${pkgname//-gradio-client/}
  python -m build --wheel --no-isolation

}

check() {
  local pytest_options=(
    -vv
    --deselect test/test_client.py # Need HF_TOKEN
  )
  cd "$srcdir"/${_name//-client/}-${_name//-/_}-$pkgver/${_name//gradio-/}/${pkgname//-gradio-client/}
  PYTHONPATH="$srcdir"/${_name//-client/}-${_name//-/_}-$pkgver/${_name//gradio-/}/${pkgname//-gradio-client/} pytest "${pytest_options[@]}" test
}

package() {
  cd "$srcdir"/${_name//-client/}-${_name//-/_}-$pkgver/${_name//gradio-/}/${pkgname//-gradio-client/}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
