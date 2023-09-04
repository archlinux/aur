# Maintainer: dreieck

# PKGBUILD last time manually edited: At least on 2023-09-04.

_year='22'
_prevyear="$(( ${_year} - 1 ))"

_pkgname="idos-timetable-data-chaps-trains-cz-20${_year}"
pkgname="${_pkgname}-latest"
epoch=0
_pkgver=2022_12_07
pkgver="${_pkgver}"
pkgrel=1
pkgdesc="20${_prevyear}/20${_year} Timetable data for the timetable search engines by CHAPS: Czech trains."
arch=(any)
url="http://chaps.cz/eng/download/idos/zip#kotvatt"
# url="http://chaps.cz/eng/download/idos-new/zip#kotvatt" # URL valid for the time when the timetable is still in the future.
license=('custom')

groups=(
        "idos-timetable"
       )

depends=(
         "idos-timetable-data-trains-common"
        )

makedepends=(
  "wget"
)

optdepends=(
            "idos-timetable-tariff-trains-cz: For showing prices."
            "idos-timetable-maps-trains-cz: For displaying routes on maps."
            "idos-timetable-additionalinfo-trains-cz: For (links to) additional information about train composition and stations."
           )

provides=(
  "${_pkgname}=${pkgver}"

  "idos-timetable-data=${pkgver}"
  "idos-timetable-data-trains=${pkgver}"

  "idos-timetable-data-trains-cz=${pkgver}"
  "idos-timetable-data-trains-cz-20${_year}=${pkgver}"
)

replaces=(
  'idos-timetable-data-chaps-trains-cz-latest'
  "${_pkgname}<=${pkgver}"
)

conflicts=(
  "${_pkgname}"
  ### The conflict will be handled by idos-timetable-data-chaps-all, if needed. Sometimes idos-timetable-data-chaps-all does not provide the train data, and then idos-timetable-data-chaps-all will depend on this package, thus this package should not have idos-timetable-data-chaps-all as conflict.
  # "idos-timetable-data-chaps-all"
)

_zipfile="VLAK${_year}C.ZIP"
_target="vlak${_year}c-${_pkgver}.zip"

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

package() {
  _instdirbase='/opt/idos-timetable'
  _instdir="${pkgdir}/${_instdirbase}"
  install -d -m755 "${_instdir}"

  cp -r "${srcdir}"/Data* "${_instdir}/"
  chmod 755 "${_instdir}"/Data*
  chmod 644 "${_instdir}"/Data*/*
  rm -f "${_instdir}/Data1"/[vV][lL][aA][kK].[tT][tT][rR] # This one is provided by idos-timetable-data-trains-common.

  install -d -m755 "${pkgdir}/usr/share/doc/${_pkgname}"
  echo "${url}" > "${pkgdir}/usr/share/doc/${_pkgname}/info.url"
  chmod 644 "${pkgdir}/usr/share/doc/${_pkgname}/info.url"

  install -D -m644 "${srcdir}/license-dummy.txt" "${pkgdir}/usr/share/licenses/${pkgname}/copying.txt"
  install -D -m644 "${srcdir}/IDOS-Licence.pdf" "${pkgdir}/usr/share/licenses/${pkgname}/IDOS-Licence.pdf"
}
