# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=openai-agents
pkgname=python-${_name}
pkgver=0.2.0
pkgrel=1
pkgdesc="OpenAI Agents SDK."
arch=('any')
url='https://github.com/openai/openai-agents-python'
license=('MIT')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name/-/_}-$pkgver.tar.gz")
sha256sums=('573734f220dcc6c2713bdc400e8ffea819e3ca9ce0e5d8f37fd077f740429e35')
depends=('python' 'python-openai' 'python-pydantic' 'python-griffe' 'python-typing_extensions' 'python-requests' 'python-mcp')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-asyncio' 'python-pytest-mock' 'python-rich' 'python-playwright' 'python-inline-snapshot' 'python-sounddevice' 'python-textual' 'python-websockets' 'python-graphviz' 'python-fastapi' 'litellm')
optdepends=('python-numpy: voice' 'python-websockets: voice' 'python-graphviz: viz' 'litellm: litellm' 'python-websockets: realtime')

prepare(){
  # Fix tests with MCP>=1.10
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  sed -i 's/"type":"text","text":"result_test_tool_1_{}","annotations":null/"type":"text","text":"result_test_tool_1_{}","annotations":null,"meta":null/g' tests/mcp/test_mcp_tracing.py
  sed -i 's/"type":"text","text":"result_test_tool_2_{}","annotations":null/"type":"text","text":"result_test_tool_2_{}","annotations":null,"meta":null/g' tests/mcp/test_mcp_tracing.py
  sed -i 's/"type":"text","text":"result_test_tool_3_{}","annotations":null/"type":"text","text":"result_test_tool_3_{}","annotations":null,"meta":null/g' tests/mcp/test_mcp_tracing.py
}

build() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
  )
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  OPENAI_API_KEY=fake-for-tests test-env/bin/python -m pytest "${pytest_options[@]}" tests
}

package() {
  cd "${srcdir}"/${_name//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
