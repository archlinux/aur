# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=shell-gpt
_name=${pkgname/-/_}
pkgver=1.0.0
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

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('d25daa78e6763baa46bf4da49fd900ae30b8c851f964af1f3b443036a44f4ebf')

_archive="$_name-$pkgver"

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
