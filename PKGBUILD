# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: dreieck

pkgname=gpx2svg-git
_pkgname=gpx2svg
pkgver=0.2.0+2.r33.20221223.fad0f1b
pkgrel=1
pkgdesc="Python script to convert GPX data to SVG"
arch=('any')
url="https://nasauber.de/opensource/gpx2svg/"
license=(
  'GPL3'
  'custom: CC0-1.0'
  'custom: CC-BY-SA-4.0'
)
depends=('python')
provides=("gpx2svg=${pkgver}")
conflicts=('gpx2svg')
source=("${_pkgname}::git+https://gitlab.com/l3u/gpx2svg.git")
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/${_pkgname}"

  git log > "${srcdir}/git.log"
}

pkgver() {
  cd "${srcdir}/${_pkgname}"
  _ver="$(git describe --tags | sed -E -e 's|^[vV]||' -e 's|-g[0-9a-f]*$||' -e 's|-|+|g')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Version could not be determined."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}


package() {
  cd "${srcdir}/${_pkgname}"

  install -D -v -m755 "gpx2svg" "${pkgdir}/usr/bin/gpx2svg"

  for _docfile in "${srcdir}/git.log" ChangeLog.rst README.md; do
    install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "${_docfile}")"
  done

  for _licensefile in README.md.license LICENSES/*; do
    install -D -v -m644 "${_licensefile}" "${pkgdir}/usr/share/licenses/${pkgname}/$(basename "${_licensefile}")"
    ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/$(basename "${_licensefile}")" "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "${_licensefile}")"
  done
}
