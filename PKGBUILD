# Maintainer: dreieck

_pkgname="toppler-upstream-levels"
pkgname="${_pkgname}-git"
_pkgver=latest
pkgver=1.3+8.r542.20220323.c8bf02b
pkgrel=1
pkgdesc='Provides the upstream levels ("towers") of the game "toppler" as stand-alone mission files (one file mission per tower), to be played individually and to be loaded into the level editor.'
arch=(
  'i686'
  'x86_64'
)
url="https://gitlab.com/roever/toppler/"
license=('GPL3')
depends=(
  'sdl2_image'
)
makedepends=(
  'git'
  'libpng'
  'sdl2_mixer'
  'zlib'
)
optdepends=(
  "toppler: To actually play the game."
)
provides=(
  "toppler-levels=${pkgver}"
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
replaces=(
  "toppler-levels-darcs"
  "toppler-levels<=1.2+10+r531.20220201.8596a68"
)
source=(
  "toppler::git+https://gitlab.com/roever/toppler.git"
)

sha256sums=(
  'SKIP'
)


pkgver () {
  cd "${srcdir}/toppler"
  _ver="$(git describe --tags | sed 's|^[vV]||' | sed 's|-[^-]*$||' | tr '-' '+')"
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


build() {
  cd "${srcdir}/toppler"

  # Build mission creator
  make _build/tools/cremission

  cd "${srcdir}/toppler/datafile/levels"

  # Create single mission per tower -- to be able to play them directly.
  find [a-zA-Z]* -maxdepth 0 -type d | while read _mission; do
    find "${_mission}" -maxdepth 1 -mindepth 1 -type f | while read _tower; do
      _towerfile="$(basename "${_tower}")"
      _name="${_mission}: ${_towerfile}"
      "${srcdir}/toppler/_build/tools/cremission" "${_name}" "${_mission}.${_towerfile}" 80 "${_mission}.${_towerfile}.info" "${_tower}"
    done
  done
}


package() {
  cd "${srcdir}/toppler/datafile/levels"

  for _mission in *.ttm; do
    install -D -m644 -v "${_mission}" "${pkgdir}/usr/share/toppler/${_mission}"
  done
  install -D -m755 -v "${srcdir}/toppler/_build/tools/cremission" "${pkgdir}/usr/share/doc/toppler/levels/cremission"
  find [a-zA-Z]* -maxdepth 0 -type d | while read _mission; do
    find "${_mission}" -maxdepth 1 -mindepth 1 -type f | while read _tower; do
      install -D -m644 -v "${_tower}" "${pkgdir}/usr/share/doc/toppler/levels/${_mission}/$(basename ${_tower})"
    done
  done
  for _docfile in key.txt; do
    install -D -m644 -v "${_docfile}" "${pkgdir}/usr/share/doc/toppler/levels/${_docfile}"
  done
  install -D -v -m644 "${srcdir}/toppler/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.GPL3.txt"
}
