# Maintainer: dreieck

# PKGBUILD last time manually edited: At least on 2017-12-17.

_pkgname=idos-timetable-additionalinfo-chaps-trains
pkgname="${_pkgname}-latest"
epoch=0
pkgver=2018_12_11
pkgrel=1
pkgdesc="Links for additional information on Czech trains and railway stations, to be used with the timetable search engines by CHAPS."
arch=('any')
url="http://chaps.cz/eng/download/idos/zip#kotvainf"
license=('custom')

groups=(
        "idos-timetable"
       )

depends=(
         "idos-timetable-data-trains-cz"
        )

makedepends=(
  "wget"
)

optdepends=()

options=('!strip')

provides=(
  "${_pkgname}=${pkgver}"
  
  "idos-timetable-additionalinfo-trains=${pkgver}"
  
  "idos-timetable-additionalinfo-trains-cz=${pkgver}"
)

conflicts=(
  "${_pkgname}"
)

_target="c1.zip"

source=(
  "${_target}::http://ttakt.chaps.cz/TTAktual/Win/Zip/C1.ZIP"
  "IDOS-Licence.pdf::http://chaps.cz/files/idos/IDOS-Licence.pdf"
  "license-dummy.txt"
)

sha256sums=(
  'SKIP'
  "SKIP"
  "c6bb216055d3670d3100b7a74e04ce0644030f365f4349a09e630ef60fbcb9a4"
)

pkgver() {
  wget -nv -O- "${url}" | tr -d '\a' | tr '\n' '\a' | sed  's|^.*File C1.ZIP\(.*\)Zip/C1.ZIP.*$|\1\n|g' | tr '\a' '\n' | grep 'Update date:' | cut -d, -f1 | sed -r 's|([0-9]+)\.([0-9]+)\.([0-9]+).|\n\3_\2_\1\n|g' | grep -E '^[0-9]+_[0-9]+_[0-9]+'
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
