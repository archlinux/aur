# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=shell-gpt
_pkgname=${pkgname/-/_}
pkgver=1.3.1
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
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('8e84e4fe5aa933273cc0d342c13bec8f1f9935038218b644fd25c6617975b63a')

_archive="$_pkgname-$pkgver"

prepare() {
  cd "$_archive"

  # If building inside a Git repository, hatch will determine which files to
  # install using the unrelated .gitignore file. This is likely to exclude all
  # files from the package.
  echo "[tool.hatch.build]" >> pyproject.toml
  echo "ignore-vcs = true" >> pyproject.toml
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
    --ignore tests/test_integration.py \
    --deselect tests/test_default.py::test_show_chat_use_markdown
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
