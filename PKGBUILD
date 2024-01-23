# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=python-instructor
_name=${pkgname#python-}
pkgver=0.4.8
pkgrel=1
pkgdesc="Structured outputs for LLMs"
arch=(any)
url="https://github.com/jxnl/instructor"
license=(MIT)
depends=(
  python
  python-aiohttp
  python-docstring-parser
  python-openai
  python-pydantic
  python-regex
  python-rich
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
sha256sums=('29972c5d68f474544c8c1d72b6fb8f2559909a52cdaeae200668bad06e3f8959')

_archive="$_name-$pkgver"

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  _ignored_tests=(
    # Interacts with OpenAI's API and requires a valid API key.
    tests/openai/evals/test_classification_enums.py
    tests/openai/evals/test_classification_literals.py
    tests/openai/evals/test_entities.py
    tests/openai/evals/test_extract_users.py
    tests/openai/test_modes.py
    tests/openai/test_multitask.py
    tests/openai/test_patch.py
    tests/openai/test_validators.py
  )
  _ignored_tests_arg=$(printf " --ignore=%s" "${_ignored_tests[@]}")

  # Randomly generated mock API key
  export OPENAI_API_KEY=sk-dBAe8c5a9bc4294cca9bed292cd61e0ff9030bB94647adfb

  # shellcheck disable=SC2086
  pytest \
    $_ignored_tests_arg
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
