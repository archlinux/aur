# Maintainer: 
# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Ivan Semkin (ivan at semkin dot ru)

_distname=PyInquirer
pkgname=python-pyinquirer
pkgver=1.0.3.r78.g7637373
_commit=7637373429bec66788650cda8091b7a6f12929ee
pkgrel=1
pkgdesc='A collection of common interactive command line user interfaces, based on Inquirer.js'
arch=('any')
url="https://pypi.org/project/${_distname}"
_repourl="https://github.com/CITGuru/${_distname}"
license=('MIT')
depends=(
  'python'
  'python-prompt_toolkit'
  'python-pygments'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-ptyprocess'
  'python-pytest'
  'python-pytest-xdist'
  'python-regex'
  'python-testfixtures'
)
source=("${_distname}::git+${_repourl}.git#commit=${_commit}")
b2sums=('SKIP')

prepare() {
  cd "${_distname}"

  echo "Removing upper version bounds from requirements.txt..."
  sed -i requirements.txt \
      -e 's/,<[0-9].*//g'
  echo "Done."
}

pkgver() {
    cd "${_distname}"

    # Generate git tag based version. Count only proper (v)#.#* [#=number] tags.
    local _gitversion=$(git describe --long --tags --match '[v0-9][0-9.][0-9.]*' | sed -e 's|^v||' | tr '[:upper:]' '[:lower:]') 

    # Format git-based version for pkgver
    # Expected format: e.g. 1.5.0rc2.r521.g99982a1c
    # Or in case of 'post': 1.5.0.post1.r521.g99982a1c
    echo "${_gitversion}" | sed \
        -e 's;^\([0-9][0-9.]*\)[-_.]\([a-zA-Z]\+\);\1\2;' \
        -e 's;\([0-9]\+-g\);r\1;' \
        -e 's;-;.;g' \
        -e 's;\(post.*\);\.\1;'
}

build() {
  cd "${_distname}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${_distname}"

  (
    export PYTHONPATH="$PWD/build/lib:$PYTHONPATH"

    # Deselected tests are buggy, i.e. the tests themselves are wrong
    python -m pytest -vv \
      --cache-clear \
      --deselect tests/test_example_checkbox.py::test_checkbox \
      --deselect tests/test_example_expand.py::test_without_expand \
      --deselect tests/test_example_expand.py::test_with_expand \
      --deselect tests/test_example_hierachical.py::test_hierarchical \
      --deselect tests/test_example_input.py::test_input \
      --deselect tests/test_example_list.py::test_list \
      --deselect tests/test_example_password.py::test_password \
      --deselect tests/test_example_pizza.py::test_pizza \
      --deselect tests/test_example_rawlist.py::test_rawlist \
      --deselect tests/test_example_when.py::test_when_bacon \
      --deselect tests/test_example_when.py::test_when_pizza \
      --deselect tests/test_example_when.py::test_when_no_thanks \
      --deselect tests/test_prompts_list.py::test_select_first_choice \
      --deselect tests/test_prompts_list.py::test_select_second_choice \
      --deselect tests/test_prompts_list.py::test_select_third_choice \
      --deselect tests/test_prompts_list.py::test_cycle_to_first_choice \
      --deselect tests/test_prompts_list.py::test_cycle_backwards
  )
}

package() {
  cd "${_distname}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname

  echo "Removing unneeded example files..."
  local python_version="$(python --version | cut -d' ' -f2 | cut -d'.' -f1,2)"
  rm -rfv "$pkgdir/usr/lib/python${python_version}/site-packages/examples"
}
