# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=shell-gpt
_pkgname=${pkgname/-/_}
pkgver=1.4.4
pkgrel=1
pkgdesc="A command-line productivity tool powered by OpenAI's ChatGPT"
arch=(any)
url="https://github.com/TheR1D/shell_gpt"
license=(MIT)
depends=(
  litellm
  python
  python-click
  python-distro
  python-instructor
  python-openai
  python-pydantic
  python-rich
  python-typer
)
makedepends=(
  python-build
  python-hatchling
  python-installer
  python-wheel
)
checkdepends=(python-pytest)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('b858c4f88604499cbbe23908e369652895ffcbedde13afe24b05d39a2cfe2498')

prepare() {
  cd "$_pkgname-$pkgver"

  # If building inside a Git repository, hatch will determine which files to
  # install using the unrelated .gitignore file. This is likely to exclude all
  # files from the package.
  echo "[tool.hatch.build]" >> pyproject.toml
  echo "ignore-vcs = true" >> pyproject.toml

  # Python 3.12 compatibility - called_once_with has been replaced with
  # assert_called_once_with.
  sed -i 's/mock_system.called_once_with/mock_system.assert_called_once_with/' \
    tests/test_shell.py
}

build() {
  cd "$_pkgname-$pkgver"

  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname-$pkgver"

  # Randomly generated mock API key
  export OPENAI_API_KEY=sk-dBAe8c5a9bc4294cca9bed292cd61e0ff9030bB94647adfb
  pytest \
    --deselect tests/test_default.py::test_markdown \
    --deselect tests/test_default.py::test_show_chat_use_markdown \
    --deselect tests/test_integration.py
}

package() {
  cd "$_pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
