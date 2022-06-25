# Maintainer: dreieck

_pkgname=csv2md
pkgname="${_pkgname}-git"
epoch=0
pkgver=r53.20200214.897bb15
pkgrel=2
pkgdesc='Command line tool for converting CSV files into Markdown tables.'
url='https://pypi.org/project/csv2md/'
arch=(any)
license=(MIT)
depends=(
  'python>=3.6'
)
makedepends=(
  'git'
  'python-setuptools'
)
provides=(
  "${_pkgname}"
  "python-csv2md"
  "python-csv2md-git=${pkgver}"
)
conflicts=(
  "${_pkgname}"
  "python-csv2md"
  "python-csv2md-git"
)
source=(
  "${_pkgname}::git+https://github.com/lzakharov/csv2md.git"
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "${srcdir}/${_pkgname}"

  # _ver="$(git describe --tags | sed 's|^[vV]||' | sed 's|-[^-]*$||' | tr '-' '+')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_rev}" ]; then
    error "Commit count could not be determined."
    return 1
  else
    printf '%s' "r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  cd "${srcdir}/${_pkgname}"

  python ./setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}"

  python ./setup.py install --skip-build --root="${pkgdir}" --optimize=1

  for _docfile in README.md; do
    install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done
  install -D -v -m 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
