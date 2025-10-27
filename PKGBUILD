# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=langgraph-cli
pkgname=python-$_name
pkgver=0.4.4
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
sha256sums=('bcc959c9270115e6b1be3971d98924552731d67ef2d4f2d05eadccf9b53d00a5')

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
  PYTHONPATH=$PWD pytest "${pytest_options[@]}" tests
}

package() {
  cd "$srcdir"/${_name//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
