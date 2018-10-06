# Maintainer: dreieck

# PKGBUILD last time manually edited: At least on 2017-12-17.

_year=18

_pkgname=idos-timetable-data-chaps-trains-common
pkgname="${_pkgname}-latest"
epoch=0
pkgver=2018_10_5
pkgrel=1
pkgdesc="Common files needed for train timetable data for the timetable search engines by CHAPS."
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
  "idos-timetable-data-trains-common=${pkgver}"
)

conflicts=(
  "${_pkgname}"
)

_zipfile="VLAK${_year}C.ZIP"
_target="vlak${_year}c.zip"

source=(
  "${_target}::http://ttakt.chaps.cz/TTAktual/Win/Zip/${_zipfile}"
  "IDOS-Licence.pdf::http://chaps.cz/files/idos/IDOS-Licence.pdf"
  "license-dummy.txt"
)

sha256sums=(
  'SKIP'
  "e904d167ccdcfb2743f4cfd596aaa9dce8b751fb5c8315b972b42b7cbb3189e6"
  "c6bb216055d3670d3100b7a74e04ce0644030f365f4349a09e630ef60fbcb9a4"
)

pkgver() {
  wget -nv -O- "${url}" | tr -d '\a' | tr '\n' '\a' | sed  's|^.*File '"${_zipfile}"'\(.*\)Zip/'"${_zipfile}"'.*$|\1\n|g' | tr '\a' '\n' | grep 'Update date:' | cut -d, -f1 | sed -r 's|([0-9]+)\.([0-9]+)\.([0-9]+).|\n\3_\2_\1\n|g' | grep -E '^[0-9]+_[0-9]+_[0-9]+'
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
