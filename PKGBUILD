# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=shell-gpt
_pkgname=${pkgname/-/_}
pkgver=1.4.3
pkgrel=2
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
sha256sums=('0b7f6facf708a55ddc3b4a2495a445e90711b1100c489735afe289c062c33c45')

_archive="$_pkgname-$pkgver"

prepare() {
  cd "$_archive"

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
  cd "$_archive"

  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  # Randomly generated mock API key
  export OPENAI_API_KEY=sk-dBAe8c5a9bc4294cca9bed292cd61e0ff9030bB94647adfb
  pytest \
    --deselect tests/test_default.py::test_markdown \
    --deselect tests/test_default.py::test_show_chat_use_markdown \
    --deselect tests/test_integration.py
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
