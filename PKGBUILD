# Maintainer: dreieck

# PKGBUILD last time manually edited: At least on 2016-12-11.

_pkgname=idos-timetable-tariff-chaps-trains-cz+sk
pkgname="${_pkgname}-latest"
epoch=0
pkgver=2017_2_2
pkgrel=1
pkgdesc="Tariff data for the timetable search engines by CHAPS: Czech ans Slovak trains."
arch=(any)
url="http://chaps.cz/eng/download/idos/zip#kotvatar"
license=('custom')

groups=(
        "idos-timetable"
       )

depends=(
         "idos-timetable-data-trains"
        )

makedepends=(
  "wget"
)

optdepends=()

provides=(
  "${_pkgname}=${pkgver}"
  
  "idos-timetable-tariff=${pkgver}"
  "idos-timetable-tariff-trains=${pkgver}"
  
  "idos-timetable-tariff-trains-cz=${pkgver}"
  "idos-timetable-tariff-trains-sk=${pkgver}"
)

conflicts=(
  "${_pkgname}"
  "idos-timetable-tariff-chaps-all"
  "idos-timetable-tariff-trains-cz"
)

source=(
  "vlak_p.zip::http://ttakt.chaps.cz/TTAktual/Win/Zip/VLAK_P.ZIP"
  "IDOS-Licence.pdf::http://chaps.cz/files/idos/IDOS-Licence.pdf"
  "license-dummy.txt"
)

sha256sums=(
  'SKIP'
  "e904d167ccdcfb2743f4cfd596aaa9dce8b751fb5c8315b972b42b7cbb3189e6"
  "c6bb216055d3670d3100b7a74e04ce0644030f365f4349a09e630ef60fbcb9a4"
)

pkgver() {
  wget -nv -O- "${url}" | tr -d '\a' | tr '\n' '\a' | sed  's|^.*File VLAK_P.ZIP\(.*\)Zip/VLAK_P.ZIP.*$|\1\n|g' | tr '\a' '\n' | grep 'Update date:' | cut -d, -f1 | sed -r 's|([0-9]+)\.([0-9]+)\.([0-9]+).|\n\3_\2_\1\n|g' | grep -E '^[0-9]+_[0-9]+_[0-9]+'
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
