# Maintainer: dreieck

# PKGBUILD last time manually edited: At least on 2023-09-04.

_pkgname=idos-timetable-data-chaps-trains-europe-2016
pkgname="${_pkgname}-latest"
epoch=0
_pkgver=2016_08_06
pkgver="${_pkgver}"
pkgrel=6
pkgdesc="2015/2016 Timetable data for the timetable search engines by CHAPS: European trains."
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
            "idos-timetable-tariff-trains-europe: For showing prices."
            "idos-timetable-tariff-trains-cz: For showing prices (for Czech Republic only)."
            "idos-timetable-tariff-trains-sk: For showing prices (for Slovakia only)."
            "idos-timetable-maps-trains-europe: For displaying routes on maps."
            "idos-timetable-maps-trains-cz: For displaying routes on (for Czech Republic only)."
            "idos-timetable-maps-trains-sk: For displaying routes on (for Slovakia only)."
            "idos-timetable-additionalinfo-trains-europe: For (links to) additional information about train composition and stations."
            "idos-timetable-additionalinfo-trains-cz: For (links to) additional information about train composition and stations (for Chech Republic only)"
            "idos-timetable-additionalinfo-trains-sk: For (links to) additional information about train composition and stations (for Slovakia only)."
           )

provides=(
  "${_pkgname}=${pkgver}"
  
  "idos-timetable-data=${pkgver}"
  "idos-timetable-data-trains=${pkgver}"
  
  "idos-timetable-data-trains-europe=${pkgver}"
  "idos-timetable-data-trains-europe-2016=${pkgver}"
)

conflicts=(
  "${_pkgname}"
  ### The conflict will be handled by idos-timetable-data-chaps-all, if needed. Sometimes idos-timetable-data-chaps-all does not provide the train data, and then idos-timetable-data-chaps-all will depend on this package, thus this package should not have idos-timetable-data-chaps-all as conflict.
  # "idos-timetable-data-chaps-all"
)

_zipfile="VLAK16E.EXE"
_target="vlak16e-${_pkgver}.exe"

source=(
  "${_target}::https://web.archive.org/web/20160806152205/http://ttakt.chaps.cz/TTAktual/Win/${_zipfile}"
  "IDOS-Licence.pdf::https://web.archive.org/web/20160806152205/http://chaps.cz/files/idos/IDOS-Licence.pdf"
  "license-dummy.txt"
)

sha256sums=(
  'be895b093a2989b999624b7749268ca40b4316d72235d497ace2ce382e307aec'
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
