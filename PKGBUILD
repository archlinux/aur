# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-xlsx2csv-git
_gitpkgname=xlsx2csv
pkgver=0
pkgrel=1
pkgdesc="XSLX to CSV converter (Git)"
arch=(any)
url="https://github.com/dilshod/xlsx2csv"
license=('MIT')
depends=('python')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools-scm'
  'python-wheel'
  'perl'
  'pod2man'
)

source=(
  "git+https://github.com/dilshod/xlsx2csv.git"
)

sha512sums=('SKIP')

pkgver() {
  cd "$_gitpkgname"
  _ver="$(git describe | sed 's/^v//;s/-.*//')"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

prepare() {
  # Disable Python 2 tests
  sed -i -e 's/^\(PYTHON_VERSIONS =\).*/\1 ["3"]/' \
    "$_gitpkgname/test/run"
}

build() {
  cd "$_gitpkgname"
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

  echo >&2 'Building wheel'
  python -m build --wheel --no-isolation

  echo >&2 'Generating man page'
  make -C man
}

check() {
  cd "$_gitpkgname"

  echo >&2 'Running unit tests'
  test/run

  echo >&2 'Testing the executable'
  ./"${_gitpkgname}.py" --version > actual.txt
  if ! grep -qF "${pkgver}" actual.txt; then
    printf >&2 '%s\n' 'Unexpected test output:' '==='
    cat >&2 actual.txt
    printf >&2 '\n%s\n' '==='
    exit 1
  fi
}

package() {
  cd "$_gitpkgname"

  echo >&2 'Packaging the wheel'
  python -I -m installer --destdir="${pkgdir}" dist/*.whl

  echo >&2 'Packaging the documentation'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    README.md
  install -D -m 644 -t "${pkgdir}/usr/share/man/man1" \
    man/*.1

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    LICENSE.txt
}
