# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=shell-gpt
_name=${pkgname/-/_}
pkgver=1.0.1
pkgrel=2
pkgdesc="A command-line productivity tool powered by OpenAI's ChatGPT"
arch=(any)
url="https://github.com/TheR1D/shell_gpt"
license=(MIT)
depends=(
  python
  python-click
  python-distro
  python-requests
  python-rich
  python-typer
)
makedepends=(
  python-build
  python-hatchling
  python-installer
  python-wheel
)
checkdepends=(
  python-pytest
  python-requests-mock
)

source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/${pkgver}.tar.gz"
  "hatch-ignore-vcs.patch"
)
sha256sums=(
  'ecbbf7f707952b29c68d9e394f2196835da8e1d5cc3047e8a46e6d97ceb1e525'
  'd0eddae80416ad719369ba6d83f101f710ff2c875c78d858bce0cded8ab1c6bd'
)

_archive="$_name-$pkgver"

prepare() {
  cd "$_archive"

  patch --forward --strip=1 --input="$srcdir/hatch-ignore-vcs.patch"
}

build() {
  cd "$_archive"

  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver \
    python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  # Randomly generated mock API key
  OPENAI_API_KEY=sk-dBAe8c5a9bc4294cca9bed292cd61e0ff9030bB94647adfb \
    python -m pytest --ignore tests/test_integration.py
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm 644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
