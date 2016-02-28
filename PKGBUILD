# Maintainer: dreieck

_pkgname=ttf-timetable
pkgname="${_pkgname}"
pkgver=1.31.r20151125
pkgrel=3
pkgdesc="Font with train timetable symbols, used by the offline timetable by CHAPS (IDOS, Timetable-Browser) or INPROP (CP, ELIS) (also retailed by České Dráhy or ŽSR)."
arch=('any')
url="http://www.chaps.cz/eng/download/idos#kotvaprg"
license=('custom')

depends=(
  "fontconfig"
  "xorg-mkfontscale"
  "xorg-mkfontdir"
  "xorg-xset"
)

makedepends=(
  "unrar"
  "fontconfig"
  "xorg-mkfontscale"
  "xorg-mkfontdir"
  "xorg-xset"
)

provides=()
replaces=()
conflicts=()

install='tt.install'

source=(
  "http://ttakt.chaps.cz/TTAktual/Win/TTFONT.EXE"
  "license-dummy.txt"
  "info.url"
  "${install}"
)

sha256sums=(
  "fb4df9e89e472511d0007e00416d1fed7cd649023c194237a9cc7f1e6ac6d3e8"
  "c6bb216055d3670d3100b7a74e04ce0644030f365f4349a09e630ef60fbcb9a4"
  "4c021678394399056573ae7f85779a7fde86f0c70fec6e64f6e1a379195ef4da"
  "6a00ba2e7e0e7610dd4a4a064716bcf368b4269f75046aee585208dd3d6a998f"
)

_fontfile="TT.ttf"

pkgver() {
  _unpackeddir="${srcdir}"
  cd "${_unpackeddir}"
  
  # _ver="$(fc-query -f "%{fontversion}" "${_fontfile}")"
  # _ver="$(wget -q -O- "${url}" | html2text -b 0 | grep 'Font Timetable, version' | sed 's|^.*version[[:space:]]\([0-9\.]*\)[^0-9].*$|\1|g')"
  _ver="$(wget -nv -O- "${url}" | sed -n 's|^.*Font Timetable, version[[:space:]]*\([0-9\.]*\)[^0-9].*$|\1|p')"
  _rel="$(wget -nv -O- "${url}" | sed -n 's|^.*/updates/ttfont_d#\([0-9]*\)[^0-9].*$|\1|p')"

  _exitcode=0
  if [ -z "${_ver}" ]; then
    echo "$0: Error: Could not determine version." > /dev/stderr
    false
    _exitcode=1
  fi
  
  if [ -z "${_rel}" ]; then
    echo "$0: Error: Could not determine release date." > /dev/stderr
    false
    _exitcode=2
  fi

  echo "${_ver}.r${_rel}"
  return ${_exitcode}
}

prepare() {
  _unpackeddir="${srcdir}"
  cd "${_unpackeddir}"
  msg "Extracting font from RAR-archive ..."
  unrar x -xInstFont.exe TTFONT.EXE
}

package() {
  _unpackeddir="${srcdir}"
  cd "${_unpackeddir}"

  install -D -m644 "${_fontfile}" "${pkgdir}/usr/share/fonts/timetable/TT.ttf"
  ln -s TT.ttf "${pkgdir}/usr/share/fonts/timetable/tt.ttf"
  ln -s TT.ttf "${pkgdir}/usr/share/fonts/timetable/timetable.ttf"
  
  install -D -m644 info.url "${pkgdir}/usr/share/doc/${pkgname}/info.url"

  install -D -m644 license-dummy.txt "${pkgdir}/usr/share/licenses/${pkgname}/copying.txt"
}
