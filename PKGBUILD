# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=langgraph-cli
pkgname=python-$_name
pkgver=0.4.39
pkgrel=1
pkgdesc='CLI for interacting with LangGraph API.'
arch=('any')
_repo='https://github.com/langchain-ai/langgraph'
url="$_repo/tree/main/libs/cli"
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
source=("$_name-$pkgver.tar.gz::$_repo/archive/refs/tags/cli==$pkgver.tar.gz")
sha256sums=('d1ebcac21fe592cb30771b147f264d80d3f7f48965176760023e3972a8dc1b66')

build() {
  cd "langgraph-cli-$pkgver/libs/cli"
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
  cd "langgraph-cli-$pkgver/libs/cli"
  PYTHONPATH=$PWD pytest "${pytest_options[@]}" tests
}

package() {
  cd "langgraph-cli-$pkgver/libs/cli"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
