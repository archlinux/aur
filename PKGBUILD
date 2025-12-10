# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=langgraph-sdk
pkgname=python-$_name
pkgver=0.2.15
pkgrel=1
pkgdesc="SDK for interacting with LangGraph API."
arch=('any')
license=('MIT')
url="https://github.com/langchain-ai/langgraph/tree/main/libs/sdk-py"
depends=('python' 'python-httpx' 'python-orjson')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-asyncio' 'python-pytest-mock')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz"
        "https://raw.githubusercontent.com/langchain-ai/langgraph/refs/tags/${_name//langgraph-/}==$pkgver/docs/docs/cloud/reference/api/openapi.json")
sha256sums=('8faaafe2c1193b89f782dd66c591060cd67862aa6aaf283749b7846f331d5334'
            '4900e3006fb8d0543b28273d8b1aa8cfeafdf2184591d8f9dfa4c737fb2714b2')

prepare(){
  mkdir -p "$srcdir"/../docs/docs/cloud/reference/api
  cp -f "$srcdir"/openapi.json "$srcdir"/../docs/docs/cloud/reference/api/openapi.json
}

build() {
    cd "$srcdir"/${_name//-/_}-$pkgver
    python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
  )
  cd "$srcdir"/${_name//-/_}-$pkgver
  PYTHONPATH=$PWD pytest "${pytest_options[@]}" tests
}

package() {
  cd "$srcdir"/${_name//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
