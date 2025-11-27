# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=gradio-client
pkgname=python-$_name
pkgver=2.0.0
pkgrel=1
pkgdesc='Python library for easily interacting with trained machine learning models.'
arch=(any)
_repo='https://github.com/gradio-app/gradio'
url="$_repo/tree/main/client/python"
license=('Apache-2.0')
depends=('python' 'python-fsspec' 'python-httpx' 'python-huggingface-hub' 'python-packaging' 'python-typing_extensions')
makedepends=('python-hatchling' 'python-hatch-requirements-txt' 'python-hatch-fancy-pypi-readme' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest-asyncio' 'python-pytest' 'python-pytest-xdist' 'python-gradio' 'python-pydub')
optdepends=('python-discord: Chat with discord bot')
source=("$_repo/archive/refs/tags/@${_name//-/\/}@$pkgver.tar.gz")
sha256sums=('2c2c88561bb94dff848b9997a77f1adbb7fc5d9f9ebf00d6eaa8d9a495089ba8')

build() {
  cd "$srcdir"/${_name//-client/}--$_name-$pkgver/${_name//gradio-/}/python
  python -m build --wheel --no-isolation

}

check() {
  local pytest_options=(
    -vv
    --deselect test/test_client.py # Need HF_TOKEN
  )
  cd "$srcdir"/${_name//-client/}--$_name-$pkgver/${_name//gradio-/}/python
  PYTHONPATH=$PWD:$PWD/../.. pytest "${pytest_options[@]}" test
}

package() {
  cd "$srcdir"/${_name//-client/}--$_name-$pkgver/${_name//gradio-/}/python
  python -m installer --destdir="$pkgdir" dist/*.whl
}
