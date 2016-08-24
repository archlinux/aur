# Maintainer: dreieck

_pkgname=idos-timetable-maps-chaps-all
pkgname="${_pkgname}-latest"
epoch=0
pkgver=2016_8_23
pkgrel=1
pkgdesc="Map data for the timetable search engines by CHAPS: European railway, Czech/Slovak trains + bus, Czech public transport. Note that some timetables need the purchased version of IDOS to run."
arch=(any)
url="http://chaps.cz/eng/download/idos/zip#kotvamap"
license=('custom')

groups=(
        "idos-timetable"
       )

depends=(
         # "idos-timetable-data"
         "idos-timetable-data-chaps-all"
        )

makedepends=(
  "wget"
)

optdepends=()

provides=(
  "${_pkgname}=${pkgver}"
  
  "idos-timetable-maps=${pkgver}"
  
  "idos-timetable-maps-trains-cz=${pkgver}"
  "idos-timetable-maps-trains-sk=${pkgver}"
  "idos-timetable-maps-trains-europe=${pkgver}"
  "idos-timetable-maps-bus-cz=${pkgver}"
  "idos-timetable-maps-bus-sk=${pkgver}"
  "idos-timetable-maps-bus-MHD-all=${pkgver}"
)

conflicts=(
  "${_pkgname}"
)

source=(
  "komplet_m.zip::http://ttakt.chaps.cz/TTAktual/Win/Zip/KOMPLET_M.ZIP"
  "IDOS-Licence.pdf::http://chaps.cz/files/idos/IDOS-Licence.pdf"
  "license-dummy.txt"
)

sha256sums=(
  'SKIP'
  "e904d167ccdcfb2743f4cfd596aaa9dce8b751fb5c8315b972b42b7cbb3189e6"
  "c6bb216055d3670d3100b7a74e04ce0644030f365f4349a09e630ef60fbcb9a4"
)

pkgver() {
  wget -nv -O- "${url}" | tr -d '\a' | tr '\n' '\a' | sed  's|^.*File KOMPLET_M.ZIP\(.*\)Zip/KOMPLET_M.ZIP.*$|\1\n|g' | tr '\a' '\n' | grep 'Update date:' | cut -d, -f1 | sed -r 's|([0-9]+)\.([0-9]+)\.([0-9]+).|\n\3_\2_\1\n|g' | grep -E '^[0-9]+_[0-9]+_[0-9]+'
}


package() {
  _instdirbase='/opt/idos-timetable'
  _instdir="${pkgdir}/${_instdirbase}"
  install -d -m755 "${_instdir}"

  cp -r "${srcdir}"/Data* "${_instdir}/"
  chmod 755 "${_instdir}"/Data*
  chmod 644 "${_instdir}"/Data*/*

  install -d -m755 "${pkgdir}/usr/share/doc/${_pkgname}"
  echo "${url}" > "${pkgdir}/usr/share/doc/${_pkgname}/info.url"
  chmod 644 "${pkgdir}/usr/share/doc/${_pkgname}/info.url"

  install -D -m644 "${srcdir}/license-dummy.txt" "${pkgdir}/usr/share/licenses/${pkgname}/copying.txt"
  install -D -m644 "${srcdir}/IDOS-Licence.pdf" "${pkgdir}/usr/share/licenses/${pkgname}/IDOS-Licence.pdf"
}
