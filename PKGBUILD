# Maintainer: dreieck

# PKGBUILD last time manually edited: At least on 2023-05-17.

_pkgname=idos-timetable-additionalinfo-chaps-bus
pkgname="${_pkgname}-latest"
epoch=0
pkgver=2019_07_23
pkgrel=1
pkgdesc="Floor plans of some Czech bus stations/ stops, to be used with the timetable search engines by CHAPS."
arch=('any')
url="http://chaps.cz/eng/download/idos/zip#kotvainf"
license=('custom')

groups=(
        "idos-timetable"
       )

depends=(
         "idos-timetable-data-bus-cz"
        )

makedepends=(
  "wget"
)

optdepends=()

provides=(
  "${_pkgname}=${pkgver}"
  
  "idos-timetable-additionalinfo-bus=${pkgver}"
  
  "idos-timetable-additionalinfo-bus-cz=${pkgver}"
)

conflicts=(
  "${_pkgname}"
)

_target="c2.zip"

source=(
  "${_target}::http://ttakt.chaps.cz/TTAktual/Win/Zip/C2.ZIP"
  "IDOS-Licence.pdf::http://chaps.cz/files/idos/IDOS-Licence.pdf"
  "license-dummy.txt"
)

sha256sums=(
  'SKIP'
  "SKIP"
  "c6bb216055d3670d3100b7a74e04ce0644030f365f4349a09e630ef60fbcb9a4"
)

pkgver() {
  # date -r "${srcdir}/${_target}" +"%Y_%m_%d"

  wget -nv -O- "${url}" | tr -d '\a' | tr '\n' '\a' | sed  's|^.*File C2.ZIP\(.*\)Zip/C2.ZIP.*$|\1\n|g' | tr '\a' '\n' | grep 'Update date:' | cut -d, -f1 | sed -r 's|([0-9]+)\.([0-9]+)\.([0-9]+).|\n\3_\2_\1\n|g' | grep -E '^[0-9]+_[0-9]+_[0-9]+' | sed -E -e 's|_([0-9])_|_0\1_|g' -e 's|_([0-9])$|_0\1|g'
}


package() {
  _instdirbase='/opt/idos-timetable'
  _instdir="${pkgdir}/${_instdirbase}"
  install -d -m755 "${_instdir}"

  cp -r "${srcdir}"/Data* "${_instdir}/"
  chmod 755 "${_instdir}"/Data*
  chmod 755 "${_instdir}"/Data*/*
  chmod 644 "${_instdir}"/Data*/*/*

  install -d -m755 "${pkgdir}/usr/share/doc/${_pkgname}"
  echo "${url}" > "${pkgdir}/usr/share/doc/${_pkgname}/info.url"
  chmod 644 "${pkgdir}/usr/share/doc/${_pkgname}/info.url"

  install -D -m644 "${srcdir}/license-dummy.txt" "${pkgdir}/usr/share/licenses/${pkgname}/copying.txt"
  install -D -m644 "${srcdir}/IDOS-Licence.pdf" "${pkgdir}/usr/share/licenses/${pkgname}/IDOS-Licence.pdf"
}
