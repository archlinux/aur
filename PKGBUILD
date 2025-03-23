# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=gradio-client
pkgname=python-${_name}
pkgver=1.8.0
pkgrel=1
pkgdesc='Python library for easily interacting with trained machine learning models.'
arch=(any)
url='https://github.com/gradio-app/gradio/tree/main/client/python'
license=('Apache-2.0')
source=("https://github.com/gradio-app/gradio/archive/refs/tags/${_name//-/_}@${pkgver}.tar.gz")
sha256sums=('bc7eb1430765f325503f0dfff00219a9df719256293955d18b0387b5c5be54d6')
depends=('python>=3.10' 'python-fsspec' 'python-httpx' 'python-huggingface-hub' 'python-packaging' 'python-typing_extensions' 'python-websockets')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest-asyncio' 'python-pytest' 'python-gradio' 'python-pydub')

prepare(){
  cd "${srcdir}"/${_name//-client/}-${_name//-/_}-${pkgver}/${_name//gradio-/}/${pkgname//-gradio-client/}
  sed -i 's/requires = \["hatchling", "hatch-requirements-txt", "hatch-fancy-pypi-readme>=22.5.0"\]/requires = ["hatchling"]/' pyproject.toml
}

build() {
  cd "${srcdir}"/${_name//-client/}-${_name//-/_}-${pkgver}/${_name//gradio-/}/${pkgname//-gradio-client/}
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --override-ini="addopts="
    --deselect test/test_client.py # Need HF_TOKEN
  )
  cd "${srcdir}"/${_name//-client/}-${_name//-/_}-${pkgver}/${_name//gradio-/}/${pkgname//-gradio-client/}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/pip install -U gradio # Prevent cercular dependencies
  test-env/bin/python -m pytest "${pytest_options[@]}" test
}

package() {
  cd "${srcdir}"/${_name//-client/}-${_name//-/_}-${pkgver}/${_name//gradio-/}/${pkgname//-gradio-client/}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
