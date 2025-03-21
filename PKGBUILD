# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=openai-agents
pkgname=python-${_name//-/_}
pkgver=0.0.6
pkgrel=1
pkgdesc="OpenAI Agents SDK."
arch=('any')
url='https://github.com/openai/openai-agents-python'
license=('MIT')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name/-/_}-$pkgver.tar.gz")
sha256sums=('34b7c25f74d6f31e43a12ec7b2de64527714746dd15ca245bfc41dc8e92dbe2b')
depends=('python>=3.9' 'python-openai' 'python-pydantic' 'python-griffe' 'python-typing_extensions' 'python-requests')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-asyncio' 'python-pytest-mock' 'python-playwright' 'python-inline-snapshot' 'python-pynput' 'python-sounddevice' 'python-textual' 'python-websockets')
optdepends=('python-numpy: voice' 'python-websockets: voice')

build() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
  local pytest_options=(
    -vv
    --override-ini="addopts="
    # Need OpenAI API
    --deselect tests/test_config.py::test_set_default_openai_api
    --deselect tests/test_openai_chatcompletions.py::test_get_response_with_text_message
    --deselect tests/test_openai_chatcompletions.py::test_get_response_with_refusal
    --deselect tests/test_openai_chatcompletions.py::test_get_response_with_tool_call
    --deselect tests/test_openai_chatcompletions_stream.py::test_stream_response_yields_events_for_text_content
    --deselect tests/test_openai_chatcompletions_stream.py::test_stream_response_yields_events_for_refusal_content
    --deselect tests/test_openai_chatcompletions_stream.py::test_stream_response_yields_events_for_tool_call
  )
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest "${pytest_options[@]}" tests
}

package() {
  cd "${srcdir}"/${_name//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
