# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=langgraph-cli
pkgname=python-$_name
pkgver=0.4.38
pkgrel=1
pkgdesc='CLI for interacting with LangGraph API.'
arch=('any')
url='https://github.com/langchain-ai/langgraph/tree/main/libs/cli'
license=('MIT')
depends=('python'
         'python-click'
         'python-httpx'
         'python-langgraph-sdk'
         'python-pathspec'
         'python-dotenv')
makedepends=('python-hatchling'
             'python-build'
             'python-installer')
checkdepends=('python-pytest'
              'python-pytest-asyncio'
              'python-pytest-mock'
              'python-msgspec'
              'python-requests')
optdepends=('python-langgraph-api: inmem'
            'python-langgraph-runtime-inmem: inmem')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('545211d0641cbbf1a923b47c18d86f76eb815531410c29b45217db348f4f2e90')

prepare(){
  # Fix tests
  cd "${_name//-/_}-$pkgver"
  sed -i "s/cli_1/${_name//-/_}-$pkgver/g" tests/unit_tests/cli/test_cli.py
}

build() {
  cd "${_name//-/_}-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
    --deselect tests/unit_tests/cli/test_cli.py::test_dockerfile_command_with_docker_compose
    --deselect tests/unit_tests/cli/test_cli.py::test_build_command_shows_wolfi_warning
    --deselect tests/unit_tests/cli/test_cli.py::test_build_generate_proper_build_context
    --deselect tests/unit_tests/cli/test_cli.py::test_build_command_with_api_version_and_base_image
    --deselect tests/unit_tests/cli/test_cli.py::test_build_command_with_api_version
  )
  cd "${_name//-/_}-$pkgver"
  PYTHONPATH=$PWD pytest "${pytest_options[@]}" tests
}

package() {
  cd "${_name//-/_}-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
