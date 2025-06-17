# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=openai-agents
pkgname=python-${_name}
pkgver=0.0.18
pkgrel=1
pkgdesc="OpenAI Agents SDK."
arch=('any')
url='https://github.com/openai/openai-agents-python'
license=('MIT')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name/-/_}-$pkgver.tar.gz")
sha256sums=('a8faf48c7fd9b6646f7afd83097d78f1575177482014b7d4d6d951b6f37dee51')
depends=('python' 'python-openai' 'python-pydantic' 'python-griffe' 'python-typing_extensions' 'python-requests' 'python-mcp')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-asyncio' 'python-pytest-mock' 'python-rich' 'python-playwright' 'python-inline-snapshot' 'python-pynput' 'python-sounddevice' 'python-textual' 'python-websockets' 'python-graphviz' 'python-fastapi' 'litellm')
optdepends=('python-numpy: voice' 'python-websockets: voice' 'python-graphviz: viz' 'litellm: litellm')

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
