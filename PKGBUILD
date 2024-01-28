# Maintainer: dreieck

# PKGBUILD last time manually edited: At least on 2023-09-04.

_pkgname=idos-timetable-data-chaps-trains-cz-2016
pkgname="${_pkgname}-latest"
epoch=0
_pkgver=2016_08_05
pkgver="${_pkgver}"
pkgrel=6
pkgdesc="2015/2016 Timetable data for the timetable search engines by CHAPS: Czech trains."
arch=(any)
url="https://web.archive.org/web/20160806152205/http://chaps.cz/eng/download/idos/#kotvatt"
license=('custom')

groups=(
        "idos-timetable"
       )

depends=(
         "idos-timetable-data-trains-common"
        )

makedepends=(
  "p7zip"
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
  "idos-timetable-data-trains-cz-2016=${pkgver}"
)

conflicts=(
  "${_pkgname}"
  ### The conflict will be handled by idos-timetable-data-chaps-all, if needed. Sometimes idos-timetable-data-chaps-all does not provide the train data, and then idos-timetable-data-chaps-all will depend on this package, thus this package should not have idos-timetable-data-chaps-all as conflict.
  # "idos-timetable-data-chaps-all"
)

_zipfile="VLAK16C.EXE"
_target="vlak16c-${_pkgver}.exe"

source=(
  "${_target}::https://web.archive.org/web/20160806152205/http://ttakt.chaps.cz/TTAktual/Win/${_zipfile}"
  "IDOS-Licence.pdf::https://web.archive.org/web/20160806152205/http://chaps.cz/files/idos/IDOS-Licence.pdf"
  "license-dummy.txt"
)

sha256sums=(
  '1dd619d84ed598ce6788fac3120457d41f0936f69882d8159796a3bc4671ccf3'
  "SKIP"
  "c6bb216055d3670d3100b7a74e04ce0644030f365f4349a09e630ef60fbcb9a4"
)


prepare() {
  cd "${srcdir}"
  7z x "${_target}"
}

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
