# Maintainer: Specter119 <spcter119 AT gmail.com>
# Maintainer: Blair Bonnett <blair.bonnett AT gmail.com>
# Contributor: gökçe aydos <aur-2023 aydos.de>

pkgname=jupyterlab_code_formatter
pkgver=3.1.0
pkgrel=1
pkgdesc='A universal code formatter for JupyterLab.'
arch=(any)
url=https://jupyterlab-code-formatter.readthedocs.io/
license=(MIT)
depends=(
    python
    jupyterlab
    jupyter-lsp

    # Additional optional deps from jsonschema probably due to https://github.com/jupyter/jupyter_events/blob/9b99f6718a3bb2686aab51e17f5c7ee276baf316/pyproject.toml#L31C4-L33C112
    python-fqdn
    python-rfc3986-validator
    python-rfc3339-validator
    python-webcolors
    python-uri-template
    python-jsonpointer
    python-isoduration

    python-types-python-dateutil
    python-terminado
    python-debugpy
)
makedepends=(
  python-build
  python-hatch-jupyter-builder
  python-hatch-nodejs-version
  python-installer
)
checkdepends=(
  python-black
  python-isort
  python-pytest
  python-pytest-jupyter
  python-jupyter-server-terminals
  python-ruff
  yapf
)
optdepends=(
  'astyle: formatting of C, C++, C# and Java code'
  'autopep8: PEP8 compliant formatting of Python code using pycodestyle'
  'python-black: PEP8 compliant formatting of Python code with Black'
  'python-isort: sort imports in Python code'
  'python-ruff: Python formatting using Ruff'
  'r-formatr: automatic formatting of R code'
  'r-styler: R code formatting with Styler'
  'rust: formatting of Rust code'
  'scalafmt: Scala code formatting'
  'yapf: Python code formatting'
)

source=(https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('6d28a0f7e1a7013f35e1c7f47c09e21f56a2947e5760a5abbb792696fdb27023')

build() {
  cd $srcdir/$pkgname-$pkgver
  python -m build --wheel --no-isolation -x
}

check() {
  cd $srcdir/$pkgname-$pkgver

  # Skip a test that seems to use an outdated error message from black.
  local skip_tests=('test_return_error_if_any')

  # Skip r-styler tests if not installed.
  if ! pacman -Qqs r-styler > /dev/null; then
    skip_tests+=('test_can_use_styler')
  fi

  # Generate a filter expression from the array.
  local karg=""
  for testname in "${skip_tests[@]}"; do
    karg="$karg and not $testname"
  done
  karg="${karg:5}"  # Trim the leading ' and '.

  # And run the tests.
  JUPYTER_PLATFORM_DIRS=1 python -m pytest -k "$karg"
}

package() {
  cd $srcdir/$pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  mv "$pkgdir"/usr/etc "$pkgdir"
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

  # Remove unit tests from the final package.
  rm -rf "$pkgdir/"usr/lib/python*/site-packages/jupyterlab_code_formatter/tests
}
