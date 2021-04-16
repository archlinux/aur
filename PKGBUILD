# Maintainer: dreieck

_pkgname="python-condconfigparser"
pkgname="${_pkgname}-git"
pkgdesc="Python library designed to help parsing configuration files. Main specificity: Allows to define conditions using boolean operators and specific sections in the configuration file that are only applied when the corresponding condition is fulfilled."
url="http://frougon.net/projects/CondConfigParser/"
license=("custom")
epoch=0
pkgver=1.0.5+r31.20200602.043c858
pkgrel=1
arch=(
  'any'
)
depends=(
  'python>=3.4'
)
makedepends=(
  'git'
  'gitlog-to-changelog'
  'python-setuptools'
)
provides=(
  "python3-condconfigparser=${pkgver}"
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "python3-condconfigparser"
  "${_pkgname}"
)
optdepends=()
source=(
  "${_pkgname}::git+https://github.com/frougon/CondConfigParser"
)
sha256sums=(
  'SKIP'
)
validpgpkeys=(
  '125B5A0FDB788FDD0EF41A9DC785B90B5053A3A2'
)


pkgver() {
  cd "${srcdir}/${_pkgname}"
  _rev="$(git rev-list HEAD --count)"
  _date="$(git log -1 --format=%cd --date=format:%Y%m%d)"
  _hash="$(git rev-parse --short HEAD)"
  cd condconfigparser
  _ver="$(python -c 'import version; print(version.__version__)')"
  if [ -z ${_ver} ]; then
    error "Could not determine version."
    exit 1
  else
    printf '%s' "${_ver}+r${_rev}.${_date}.${_hash}"
  fi
}


build() {
  cd "${srcdir}/${_pkgname}"
  printf '%s\n' "${url}" > "upstream.url"

  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}"

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  for _docfile in AUTHORS README.distributors README.rst INSTALL.txt TODO upstream.url; do
    install -D -m644 -v "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done

  for _license in COPYING COPYING.Sphinx; do
    install -D -m644 -v "${_license}" "${pkgdir}/usr/share/licenses/${pkgname}/${_license}"
    ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/${_license}" "${pkgdir}/usr/share/doc/${_pkgname}/${_license}"
  done
}

