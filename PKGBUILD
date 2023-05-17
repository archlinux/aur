# Maintainer: dreieck

# PKGBUILD last time manually edited: At least on 2023-05-17.
### WARNING 2022-05-04: There does not seem to be flight data anymore available upstream. Download of LETADLA.ZIP gives error 404 not found.


_pkgname=idos-timetable-data-chaps-flights
pkgname="${_pkgname}-latest"
epoch=0
pkgver=2021_6_30
pkgrel=3
pkgdesc="Flight timetable data from Galileo to be used with IDOS timetable browser"
arch=(any)
url="http://chaps.cz/eng/download/idos/zip#kotvatt"
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
  "idos-timetable-data-flights=${pkgver}"
)

conflicts=(
  "${_pkgname}"
)

_zipfile="LETADLA.ZIP"
_target="letadla.zip"

source=(
  "${_target}::http://ttakt.chaps.cz/TTAktual/Win/Zip/${_zipfile}"
  "IDOS-Licence.pdf::http://chaps.cz/files/idos/IDOS-Licence.pdf"
  "license-dummy.txt"
)

sha256sums=(
  'SKIP'
  "SKIP"
  "c6bb216055d3670d3100b7a74e04ce0644030f365f4349a09e630ef60fbcb9a4"
)

pkgver() {
  wget -nv -O- "${url}" | tr -d '\a' | tr '\n' '\a' | sed  's|^.*File '"${_zipfile}"'\(.*\)Zip/'"${_zipfile}"'.*$|\1\n|g' | tr '\a' '\n' | grep 'Update date:' | cut -d, -f1 | sed -r 's|([0-9]+)\.([0-9]+)\.([0-9]+).|\n\3_\2_\1\n|g' | grep -E '^[0-9]+_[0-9]+_[0-9]+' | sed -E -e 's|_([0-9])_|_0\1_|g' -e 's|_([0-9])$|_0\1|g'
}


package() {
  _instdirbase='/opt/idos-timetable'
  _instdir="${pkgdir}/${_instdirbase}"
  install -d -m755 "${_instdir}"
  
  install -d -m755 "${_instdir}/Data4"
  install -D -m644 "${srcdir}/Data4/Letadla.tt" "${_instdir}/Data4/Letadla.tt"
  install -D -m644 "${srcdir}/Data4/Letadla.ttr" "${_instdir}/Data4/Letadla.ttr"
  
  install -D -m644 "${srcdir}/license-dummy.txt" "${pkgdir}/usr/share/licenses/${pkgname}/copying.txt"
  install -D -m644 "${srcdir}/IDOS-Licence.pdf" "${pkgdir}/usr/share/licenses/${pkgname}/IDOS-Licence.pdf"
}
