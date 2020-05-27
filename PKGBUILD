# Maintainer: dreieck

_pkgbase=toppler
_pkgname="${_pkgbase}-levels"
pkgname="${_pkgname}-darcs"
_pkgver=latest
pkgver=1.1.6+r37.d20121219
pkgrel=2
pkgdesc='Provides the levels ("towers") of the game "toppler" as stand-alone mission files (one file mission per tower).'
arch=('any')
url="http://toppler.sourceforge.net/"
license=('GPL')
depends=()
makedepends=(
  'awk'
  'darcs'
  'sdl_mixer'
  'zlib'
)
optdepends=(
  "toppler: To actually play the game."
)
provides=("${_pkgname}=${pkgver}" "${_pkgname}-git=${pkgver}")
conflicts=("${_pkgname}" "${_pkgname}-git")
source=(
)

sha256sums=(
)


_darcs_src=(
  "http://toppler.sourceforge.net/repos/toppler/" # Is needed for decl.o
  "http://toppler.sourceforge.net/repos/levels/"
)

_configure_options=(
  --prefix=/usr
  --localstatedir=/usr/share
  --enable-nls
  --disable-rpath
)



prepare() {
  cd "${srcdir}/"
  msg2 "Checking out darcs sources. Need to do it in 'prepare()', since 'makepkg' does not know how to handle 'darcs' VCS. Also installs the levels, for reference."
  for _src in "${_darcs_src[@]}"; do
    msg2 "Checking out '${_src}' ..."
    if [ -d "$(basename "${_src}")" ]; then
      rm -Rf "$(basename "${_src}")"
    fi
    darcs clone --set-scripts-executable --lazy "${_src}"
  done
}


pkgver() {
  cd "${srcdir}/levels"
  _ver="$(< "${srcdir}/toppler/VERSION")"
  _rev="$(darcs log --all --number --no-summary --reverse | head -n1 | awk '{print $1}' | tr -d ':')"
  _date="$(date -d "$(darcs log --no-summary --last=1 --machine-readable | grep -E '^Date:' | head -n 1 | sed -E 's|^Date:[[:space:]]*||')" '+%Y%m%d')"

  if [ -z ${_ver} ]; then
    printf '%s\n' "Error in 'pkgver()': Could not determine version."
    return 1
  fi
  if [ -z ${_rev} ]; then
    printf '%s\n' "Error in 'pkgver()': Could not determine commit count."
    return 1
  fi
  if [ -z ${_date} ]; then
    printf '%s\n' "Error in 'pkgver()': Could not determine latest commit date."
    return 1
  fi

  printf '%s' "${_ver}+r${_rev}.d${_date}"
}


build() {
  cd "${srcdir}/toppler"

  # Build "toppler" in order to get 'decl.o'
  ./autogen.sh "${_configure_options}"
  ./configure "${_configure_options}"
  make toppler

  cd "${srcdir}/levels"
  # Create mission creator
  make cremission
  # Create single mission per tower -- to be able to play them directly
  find [a-zA-Z]* -maxdepth 0 -type d | while read _mission; do
    find "${_mission}" -maxdepth 1 -mindepth 1 -type f | while read _tower; do
      _name="${_mission}: $(basename "${_tower}")"
      ./cremission "${_name}" 80 "${_tower}"
      mv ~/.toppler/"${_name}".ttm .
    done
  done
}


package() {
  cd "${srcdir}/levels"
  # FIXME: Currently, missions created by `cremission` are broken, so do not install them.
  #for _mission in *.ttm; do
  #  install -D -m644 -v "${_mission}" "${pkgdir}/usr/share/toppler/${_mission}"
  #done
  find [a-zA-Z]* -maxdepth 0 -type d | while read _mission; do
    find "${_mission}" -maxdepth 1 -mindepth 1 -type f | while read _tower; do
      install -D -m644 -v "${_tower}" "${pkgdir}/usr/share/doc/${_pkgbase}/levels/${_mission}/$(basename ${_tower})"
    done
  done
  for _docfile in key.txt; do
    install -D -m644 -v "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgbase}/levels/${_docfile}"
  done
}
