# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Nina l1f <nina@l1f.de>

_modulename=pre-commit
_pkgbase="python-${_modulename}"
pkgname="${_pkgbase}-git"
pkgver=3.5.0.r12.g51df34e
pkgrel=1
pkgdesc="A framework for managing and maintaining multi-language pre-commit hooks (git build)"
arch=('any')
url="https://github.com/${_modulename}/${_modulename}"
license=('MIT')
depends=(
    'bash'
    'python-cfgv'
    'python-identify'
    'python-nodeenv'
    'python-setuptools'
    'python-virtualenv'
    'python-yaml'
)
makedepends=('git')
checkdepends=(
    'cabal-install'
    'git'
    'ghc'
    'go'
    'luarocks'
    'nodejs'
    'npm'
    'python-pytest'
    'python-pytest-env'
    'python-re-assert'
    'r'
    'rubygems'
    'rust'
)
provides=("pre-commit=${pkgver%.r*}" "python-pre-commit=${pkgver%.r*}")
conflicts=('pre-commit' 'python-pre-commit')
source=("${_pkgbase}::git+${url}.git")
b2sums=(SKIP)

pkgver() {
    cd "${_pkgbase}"

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
  cd "${_pkgbase}"
  python setup.py build
}

check() {
  cd "${_pkgbase}"
  git init
  git config user.email "pony@arch"
  git config user.name "Lucky Pony"
  git config --global protocol.file.allow always
  export GIT_AUTHOR_NAME="Lucky Pony"
  export GIT_COMMITTER_NAME="Lucky Pony"
  export GIT_AUTHOR_EMAIL="pony@arch"
  export GIT_COMMITTER_EMAIL="pony@arch"
  export VIRTUALENV_NO_DOWNLOAD=1
  export PRE_COMMIT_NO_CONCURRENCY=1

  # Set pytest tmpdir manually, to discard tmpdirs created for previous executions when starting a new pytest run
  local _pytest_tempdir="/tmp/pytest_${pkgname}_user-$(whoami)"

  # Empty venv so that `importlib` picks up the local "pre-commit" package
  python -m venv --system-site-packages venv
  source "$PWD/venv/bin/activate"
  python setup.py develop

  # Deselect some install_uninstall_tests that fail when pkg is already installed system-wide
  # Deselect conda because we don't have it!
  # Deselect coursier because we don't have it!
  # Deselect dart because it doesn't support 3.x.x!
  # Deselect swift because we don't have it!
  # test_install_ruby_with_version,test_run_a_ruby_hook: https://github.com/pre-commit/pre-commit/issues/1368
  # basetemp: use manually set tmpdir, keep only the one for the newest pytest run
  python -m pytest --basetemp="${_pytest_tempdir}" \
                   --deselect tests/commands/install_uninstall_test.py::test_environment_not_sourced \
                   --deselect tests/commands/install_uninstall_test.py::test_installed_from_venv \
                   --deselect tests/languages/conda_test.py \
                   --deselect tests/languages/coursier_test.py \
                   --deselect tests/languages/dart_test.py \
                   --deselect tests/languages/docker_image_test.py \
                   --deselect tests/languages/docker_test.py \
                   --deselect tests/languages/dotnet_test.py \
                   --deselect tests/languages/haskell_test.py::test_run_dep \
                   --deselect tests/languages/haskell_test.py::test_run_example_executable \
                   --deselect tests/languages/swift_test.py \
                   --deselect tests/languages/ruby_test.py::test_install_ruby_with_version \
                   --deselect tests/languages/ruby_test.py::test_ruby_hook_language_version \
                   --deselect tests/languages/ruby_test.py::test_ruby_with_bundle_disable_shared_gems \
                   --deselect tests/languages/rust_test.py::test_language_version_with_rustup
  deactivate
}

package() {
  cd "${_pkgbase}"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
