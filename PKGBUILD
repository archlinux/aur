# Maintainer: dreieck

# PKGBUILD last time manually edited: At least on 2025-12-18.

_year=26
url="https://chaps.cz/eng/download/idos/zip#kotvatt"
_zipfile="VLAK${_year}C.ZIP"
_pkgver() {
  # Reason for a _pkgver(): Have something to run before source download so that we can have version aware source downloads.
  wget -nv -O- "${url}" | tr -d '\a' | tr '\n' '\a' | sed  's|^.*File '"${_zipfile}"'\(.*\)Zip/'"${_zipfile}"'.*$|\1\n|g' | tr '\a' '\n' | grep 'Update date:' | cut -d, -f1 | sed -r 's|([0-9]+)\.([0-9]+)\.([0-9]+).|\n\3_\2_\1\n|g' | grep -E '^[0-9]+_[0-9]+_[0-9]+' | sed -E -e 's|_([0-9])_|_0\1_|g' -e 's|_([0-9])$|_0\1|g'
}

_pkgname=idos-timetable-data-chaps-trains-common
pkgname="${_pkgname}-latest"
epoch=0
_pkgver="$(_pkgver)" # This should be set _before_ sources get downloaded.
pkgver="${_pkgver}"
pkgrel=1
pkgdesc="Common files needed for train timetable data for the timetable search engines by CHAPS."
arch=(any)
license=('custom')

groups=(
        "idos-timetable"
       )

depends=(
         "idos-timetable-browser"
        )

makedepends=(
  "wget"
)

optdepends=()

provides=(
  "${_pkgname}=${pkgver}"
  "idos-timetable-data-trains-common=${pkgver}"
)

conflicts=(
  "${_pkgname}"
)

_target="vlak${_year}c-${_pkgver}.zip"

source=(
  "${_target}::https://ttakt.chaps.cz/TTAktual/Win/Zip/${_zipfile}"
  "IDOS-Licence.pdf::https://chaps.cz/files/idos/IDOS-Licence.pdf"
  "license-dummy.txt"
)

sha256sums=(
  'SKIP'
  "SKIP"
  "c6bb216055d3670d3100b7a74e04ce0644030f365f4349a09e630ef60fbcb9a4"
)

pkgver() {
  printf '%s' "${_pkgver}"
}


package() {
  _instdirbase='/opt/idos-timetable'
  _instdir="${pkgdir}/${_instdirbase}"
  install -d -m755 "${_instdir}"
  
  install -d -m755 "${_instdir}/Data1"
  install -D -m644 "${srcdir}/Data1/Vlak.ttr" "${_instdir}/Data1/Vlak.ttr"
  
  install -D -m644 "${srcdir}/license-dummy.txt" "${pkgdir}/usr/share/licenses/${pkgname}/copying.txt"
  install -D -m644 "${srcdir}/IDOS-Licence.pdf" "${pkgdir}/usr/share/licenses/${pkgname}/IDOS-Licence.pdf"
}
