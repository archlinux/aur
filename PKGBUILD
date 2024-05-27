# Maintainer: dreieck

_pkgname=normalmap
pkgname="${_pkgname}-git"
pkgver=r20.20200602.fb90c69
pkgrel=2
pkgdesc="Allows to create a RGB normal map from a heightmap. The output picture is RGBA and you can store various combination of the height in the Alpha channel."
arch=(
  'i686'
  'x86_64'
)
url="https://github.com/eatdust/normalmap"
license=('GPL2')
depends=(
  'imagemagick>=7'
)
makedepends=(
  'git'
  'waf'
)
optdepends=()
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
source=(
  "${_pkgname}::git+https://github.com/eatdust/normalmap.git"
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "${srcdir}/${_pkgname}"
  _rev="$(git rev-list HEAD --count)"
  _date="$(git log -1 --format=%cd --date=format:%Y%m%d)"
  _hash="$(git rev-parse --short HEAD)"
  printf '%s' "r${_rev}.${_date}.${_hash}"
}

build() {
  cd "${srcdir}/${_pkgname}"
  printf '%s\n' "${url}" > "upstream.url"

  PREFIX=/usr waf configure
  waf build
}

package() {
  cd "${srcdir}/${_pkgname}"

  DESTDIR="${pkgdir}" waf install

  for _docfile in upstream.url README.md; do
    install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done

  install -D -v -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/COPYING" "${pkgdir}/usr/share/doc/${_pkgname}/COPYING"
}
