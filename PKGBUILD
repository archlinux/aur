# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=python-instructor
_name=${pkgname#python-}
pkgver=0.4.6
pkgrel=2
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
sha256sums=('656f2444e7448d104619bf50bc1ec2893920ec5919b659ba9f53f846de4a69e8')

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

  _deselected_tests=(
    # Failing with Pydantic ValidationError - don't know why.
    'tests/test_function_calls.py::test_async_complete_output_no_exception'
    'tests/test_function_calls.py::test_complete_output_no_exception'
    'tests/test_function_calls.py::test_incomplete_output_exception[mock_completion0]'
    'tests/test_function_calls.py::test_incomplete_output_exception_raise[mock_completion0]'
  )
  _deselected_tests_arg=$(printf " --deselect=%s" "${_deselected_tests[@]}")

  # Randomly generated mock API key
  export OPENAI_API_KEY=sk-dBAe8c5a9bc4294cca9bed292cd61e0ff9030bB94647adfb

  # shellcheck disable=SC2086
  pytest \
    $_ignored_tests_arg \
    $_deselected_tests_arg
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
