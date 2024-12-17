# Maintainer: dreieck

# PKGBUILD last time manually edited: At least on 2024-12-17.
url="https://chaps.cz/eng/download/idos/zip#kotvamap"
_zipfile="VLAK_M.ZIP"
_pkgver() {
  # Reason for a _pkgver(): Have something to run before source download so that we can have version aware source downloads.
  wget -nv -O- "${url}" | tr -d '\a' | tr '\n' '\a' | sed  's|^.*File '"${_zipfile}"'\(.*\)Zip/'"${_zipfile}"'.*$|\1\n|g' | tr '\a' '\n' | grep 'Update date:' | cut -d, -f1 | sed -r 's|([0-9]+)\.([0-9]+)\.([0-9]+).|\n\3_\2_\1\n|g' | grep -E '^[0-9]+_[0-9]+_[0-9]+'
}

_pkgname=idos-timetable-maps-chaps-trains-europe
pkgname="${_pkgname}-latest"
epoch=0
_pkgver="$(_pkgver)" # This should be set _before_ sources get downloaded.
pkgver="${_pkgver}"
pkgrel=1
pkgdesc="Map data for the timetable search engines by CHAPS: European railway."
arch=(any)
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
  
  "idos-timetable-maps=${pkgver}"
  "idos-timetable-maps-trains=${pkgver}"
  
  "idos-timetable-maps-trains-cz=${pkgver}"
  "idos-timetable-maps-trains-sk=${pkgver}"
  "idos-timetable-maps-trains-europe=${pkgver}"
)

conflicts=(
  "${_pkgname}"
  "idos-timetable-maps-chaps-all"
)

_target="vlak_m-${_pkgver}.zip"

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

  cp -r "${srcdir}"/Data* "${_instdir}/"
  chmod 755 "${_instdir}"/Data*
  chmod 644 "${_instdir}"/Data*/*

  install -d -m755 "${pkgdir}/usr/share/doc/${_pkgname}"
  echo "${url}" > "${pkgdir}/usr/share/doc/${_pkgname}/info.url"
  chmod 644 "${pkgdir}/usr/share/doc/${_pkgname}/info.url"

  install -D -m644 "${srcdir}/license-dummy.txt" "${pkgdir}/usr/share/licenses/${pkgname}/copying.txt"
  install -D -m644 "${srcdir}/IDOS-Licence.pdf" "${pkgdir}/usr/share/licenses/${pkgname}/IDOS-Licence.pdf"
}
