# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=python-instructor
_pkgname=${pkgname#python-}
pkgver=0.6.2
pkgrel=1
pkgdesc="Structured outputs for LLMs"
arch=(any)
url="https://github.com/jxnl/instructor"
license=(MIT)
depends=(
  python
  python-aiohttp
  python-docstring-parser
  python-httpx
  python-openai
  python-pydantic
  python-regex
  python-rich
  python-tenacity
  python-typer
  python-typing_extensions
)
makedepends=(
  python-build
  python-installer
  python-poetry
  python-wheel
)
checkdepends=(python-pytest)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('182e362df5975d277d2eb325ed65c4710c42bf32543685ab51319d17b33ebacb')

_archive="$_pkgname-$pkgver"

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  # Tests in tests/openapi/ interact with OpenAI's API and requires a valid API
  # key
  export OPENAI_API_KEY=sk-dBAe8c5a9bc4294cca9bed292cd61e0ff9030bB94647adfb
  pytest --ignore=tests/openai
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
