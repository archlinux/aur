# Maintainer: dreieck

# PKGBUILD last time manually edited: At least on 2024-05-19.

url="https://chaps.cz/eng/download/idos/zip#kotvaprg"
_zipfile="TTFONT.ZIP"
_fontfile="TT.ttf"
_pkgver() {
  # Reason for a $_pkgver(): Have something to run before source download so that we can have version aware source downloads.
  _unpackeddir="${srcdir}"
  cd "${_unpackeddir}"

  # _ver="$(fc-query -f "%{fontversion}" "${_fontfile}")"
  # _ver="$(wget -q -O- "${url}" | html2text -b 0 | grep 'Font Timetable, version' | sed 's|^.*version[[:space:]]\([0-9\.]*\)[^0-9].*$|\1|g')"
  _ver="$(wget -nv -O- "${url}" | sed -n 's|^.*Font Timetable, version[[:space:]]*\([0-9\.]*\)[^0-9].*$|\1|p')"
  _date="$(wget -nv -O- "${url}" | sed -n 's|^.*/updates/ttfont_d#\([0-9]*\)[^0-9].*$|\1|p')"

  _exitcode=0
  if [ -z "${_ver}" ]; then
    echo "$0: Error: Could not determine version." > /dev/stderr
    false
    _exitcode=1
  fi

  if [ -z "${_date}" ]; then
    echo "$0: Error: Could not determine release date." > /dev/stderr
    false
    _exitcode=2
  fi

  echo "${_ver}.${_date}"
  return ${_exitcode}
}

_pkgname=ttf-timetable
pkgname="${_pkgname}-latest"
epoch=0
_pkgver="$(_pkgver)" # This should be set _before_ sources get downloaded.
pkgver="${_pkgver}"
pkgrel=7
pkgdesc="Font with train timetable symbols, used by the offline timetable by CHAPS (IDOS, Timetable-Browser) or INPROP (CP, ELIS) (also retailed by České Dráhy or ŽSR)."
arch=('any')
license=('custom')

depends=(
  "fontconfig"
  "xorg-mkfontscale"
  "xorg-mkfontdir"
  "xorg-xset"
)

makedepends=(
  "fontconfig"
  "unzip"
  "xorg-mkfontscale"
  "xorg-mkfontdir"
  "xorg-xset"
)

provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
replaces=("${_pkgname}<=${pkgver}")

install='tt.install'

_target="ttfont-${_pkgver}.zip"

source=(
  "${_target}::https://ttakt.chaps.cz/TTAktual/Win/Zip/${_zipfile}"
  "IDOS-Licence.pdf::https://chaps.cz/files/idos/IDOS-Licence.pdf"
  "license-dummy.txt"
  "info.url"
  "${install}"
)

sha256sums=(
  "c14d08d6f58ab1c06f10786de03352599c940840166b515a47a5b0fa75907404"  # TTFONT.ZIP
  "SKIP"                                                              # IDOS-Licence.pdf
  "c6bb216055d3670d3100b7a74e04ce0644030f365f4349a09e630ef60fbcb9a4"  # license-dummy.txt
  "4c021678394399056573ae7f85779a7fde86f0c70fec6e64f6e1a379195ef4da"  # info.url
  "6a00ba2e7e0e7610dd4a4a064716bcf368b4269f75046aee585208dd3d6a998f"  # ${install}
)

pkgver() {
  printf '%s' "${_pkgver}"
}

package() {
  _unpackeddir="${srcdir}"
  cd "${_unpackeddir}"

  install -D -m644 "${_unpackeddir}/${_fontfile}" "${pkgdir}/usr/share/fonts/timetable/TT.ttf"
  ln -s TT.ttf "${pkgdir}/usr/share/fonts/timetable/tt.ttf"
  ln -s TT.ttf "${pkgdir}/usr/share/fonts/timetable/timetable.ttf"

  install -D -m644 info.url "${pkgdir}/usr/share/doc/${pkgname}/info.url"

  install -D -m644 license-dummy.txt "${pkgdir}/usr/share/licenses/${pkgname}/copying.txt"
  install -D -m644 "${srcdir}/IDOS-Licence.pdf" "${pkgdir}/usr/share/licenses/${pkgname}/IDOS-Licence.pdf"
}
