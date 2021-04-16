# Maintainer: dreieck

_pkgname="python-condconfigparser"
pkgname="${_pkgname}"
pkgdesc="Python library designed to help parsing configuration files. Main specificity: Allows to define conditions using boolean operators and specific sections in the configuration file that are only applied when the corresponding condition is fulfilled."
url="http://frougon.net/projects/CondConfigParser/"
license=("custom")
epoch=0
pkgver=1.0.5
pkgrel=1
arch=(
  'any'
)
depends=(
  'python>=3.4'
)
makedepends=(
  'git'
  'python-setuptools'
)
provides=(
  "python3-condconfigparser=${pkgver}"
)
conflicts=(
  "python3-condconfigparser"
)
optdepends=()
source=(
  "python-CondConfigParser-${pkgver}.tar.gz::http://frougon.net/projects/CondConfigParser/dist/${pkgver}/python3-CondConfigParser-${pkgver}.tar.gz"
  "python-CondConfigParser-${pkgver}.tar.gz.sig::http://frougon.net/projects/CondConfigParser/dist/${pkgver}/python3-CondConfigParser-${pkgver}.tar.gz.asc"
)
sha256sums=(
  '1616d8c387808639ac8e654fc358fe25e8f7e69df8da60cee9c03ba7abfb0d53'
  '21a9781c0276e8deeb39569abc1b5e2154909471050f386e135062413c051eb6'
)
validpgpkeys=(
  '125B5A0FDB788FDD0EF41A9DC785B90B5053A3A2'
)


build() {
  cd "${srcdir}/CondConfigParser-${pkgver}"
  printf '%s\n' "${url}" > "upstream.url"

  python setup.py build
}

package() {
  cd "${srcdir}/CondConfigParser-${pkgver}"

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  for _docfile in AUTHORS PKG-INFO README.rst INSTALL.txt TODO upstream.url; do
    install -D -m644 -v "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done

  for _license in COPYING COPYING.Sphinx; do
    install -D -m644 -v "${_license}" "${pkgdir}/usr/share/licenses/${pkgname}/${_license}"
    ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/${_license}" "${pkgdir}/usr/share/doc/${_pkgname}/${_license}"
  done
}
