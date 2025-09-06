# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=langgraph-cli
pkgname=python-$_name
pkgver=0.4.2
pkgrel=1
pkgdesc='CLI for interacting with LangGraph API.'
arch=('any')
url='https://github.com/langchain-ai/langgraph/tree/main/libs/cli'
license=('MIT')
depends=('python' 'python-click' 'python-langgraph-sdk')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-asyncio' 'python-pytest-mock' 'python-msgspec')
optdepends=('python-langgraph-api: inmem' 'python-langgraph-runtime-inmem: inmem' 'python-dotenv: inmem')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz")
validpgpkeys=('2EECE5156D8DE0C50636E37621707FBE029E96B5')
sha256sums=('074d93a2ebb9c60629a83bc4c149e837bd09e51222d48daacb498299d818ee9f')

prepare(){
  # Fix tests
  cd "$srcdir"/${_name//-/_}-$pkgver
  sed -i "s/cli_1/${_name//-/_}-$pkgver/g" tests/unit_tests/cli/test_cli.py
}

build() {
  cd "$srcdir"/${_name//-/_}-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    # Need docker
    --deselect tests/unit_tests/cli/test_cli.py::test_dockerfile_command_with_docker_compose
    --deselect tests/unit_tests/cli/test_cli.py::test_build_command_shows_wolfi_warning
    --deselect tests/unit_tests/cli/test_cli.py::test_build_generate_proper_build_context
    --deselect tests/unit_tests/cli/test_cli.py::test_build_command_with_api_version_and_base_image
    --deselect tests/unit_tests/cli/test_cli.py::test_build_command_with_api_version
  )
  cd "$srcdir"/${_name//-/_}-$pkgver
  PYTHONPATH="$srcdir"/${_name//-/_}-$pkgver pytest "${pytest_options[@]}" tests
}

package() {
  cd "$srcdir"/${_name//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
