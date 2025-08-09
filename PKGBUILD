# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-xlsx2csv
_gitpkgname=xlsx2csv
pkgver=0.8.1
pkgrel=2
pkgdesc="XSLX to CSV converter"
arch=(any)
url="https://github.com/dilshod/xlsx2csv"
license=('MIT')
depends=('python')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools-scm'
  'python-wheel'
)

source=(
  "${_gitpkgname}-${pkgver}.tar.gz::https://github.com/dilshod/xlsx2csv/archive/${pkgver}.tar.gz"
)

sha512sums=(
  '110a82f21ccff7b3baf228ad43ce8520afdefc362ed266238622cd4d51dbc3ca36e9df37b79c9cad7db89c67e68b50669285c04da42323fb158c24ae77b2d1f7'
)

prepare() {
  # Disable Python 2 tests
  sed -i -e 's/^\(PYTHON_VERSIONS =\).*/\1 ["3"]/' \
    "${_gitpkgname}-${pkgver}/test/run"
}

build() {
  cd "${_gitpkgname}-${pkgver}"
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

  echo >&2 'Building wheel'
  python -m build --wheel --no-isolation

  echo >&2 'Generating man page'
  make -C man
}

check() {
  cd "${_gitpkgname}-${pkgver}"

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
  cd "${_gitpkgname}-${pkgver}"

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
