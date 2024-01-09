# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=shell-gpt
_name=${pkgname/-/_}
pkgver=1.1.0
pkgrel=1
pkgdesc="A command-line productivity tool powered by OpenAI's ChatGPT"
arch=(any)
url="https://github.com/TheR1D/shell_gpt"
license=(MIT)
depends=(
  python
  python-click
  python-distro
  python-instructor
  python-openai
  python-pydantic
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

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('67b18d3042968f75c0c2aa82bb6d25a7e12d5f858ea4400301a1575669611dd1')

_archive="$_name-$pkgver"

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
    --ignore tests/test_integration.py
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm 644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
