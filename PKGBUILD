# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=openai-agents
pkgname=python-${_name}
pkgver=0.2.3
pkgrel=1
pkgdesc="OpenAI Agents SDK."
arch=('any')
url='https://github.com/openai/openai-agents-python'
license=('MIT')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name/-/_}-$pkgver.tar.gz")
sha256sums=('95d4ad194c5c0cf1a40038cb701eee8ecdaaf7698d87bb13e3c2c5cff80c4b4d')
depends=('python' 'python-openai' 'python-pydantic' 'python-griffe' 'python-typing_extensions' 'python-requests' 'python-mcp')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-asyncio' 'python-pytest-mock' 'python-inline-snapshot' 'python-sounddevice' 'python-websockets' 'python-graphviz' 'python-fastapi' 'litellm')
optdepends=('python-numpy: voice' 'python-websockets: voice' 'python-graphviz: viz' 'litellm: litellm' 'python-websockets: realtime')

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
