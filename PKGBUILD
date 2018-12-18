# Maintainer: dreieck

# PKGBUILD last time manually edited: At least on 2018-02-09.

_year='18'
_prevyear="$(( ${_year} - 1 ))"

_pkgname="idos-timetable-data-zsr-sk-20${_year}"
pkgname="${_pkgname}-latest"
epoch=1
pkgver=2018_12_11
pkgrel=1
pkgdesc="20${_prevyear}/20${_year} Timetable data for the offline railway and other public transport timetable search engines by CHAPS: Slovak train data, provided by Inprop (Slovakia)."
arch=(any)
url="http://www.inprop.sk/download.aspx"
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
            "idos-timetable-tariff-trains-sk: For showing prices."
            "idos-timetable-maps-trains-sk: For displaying routes."
           )

provides=(
  "${_pkgname}=${pkgver}"

  "idos-timetable-data=${pkgver}"
  "idos-timetable-data-trains=${pkgver}"

  "idos-timetable-data-trains-sk=${pkgver}"
  "idos-timetable-data-trains-sk-20${_year}=${pkgver}"
)

replaces=(
  'idos-timetable-data-zsr-sk-latest'
  "${_pkgname}<=${pkgver}"
)

conflicts=(
  "${_pkgname}"
)

_get_download_url() {
  echo "http://www.inprop.sk/Data/Vlak${_year}Sk.exe"
}

_source0="$(_get_download_url)"
_target0="vlak${_year}sk.exe"

source=(
  "${_target0}::${_source0}"
  "license-dummy.txt"
)

sha256sums=(
  'SKIP'
  "14279a732be7d04304ff3860d54e0cf8c1a8ba0a46343eaf9b7ce3a105815946"
)

pkgver() {
  _ver="$(wget -nv -O- "${url}" | grep --text -E "Data/Vlak${_year}Sk\.exe" | sed -r 's|[^0-9]([0-9]{1,2}\.[0-9]{1,2}\.[0-9]{4})[^0-9]|\n\1\n|' | grep --text -E '^[0-9]{1,2}\.[0-9]{1,2}\.[0-9]{4}$' | awk -F. '{print $3"_"$2"_"$1}')"

  echo "${_ver}"
}


package() {
  _instdirbase='/opt/idos-timetable'
  _instdir="${pkgdir}/${_instdirbase}"

  install -d -m755 "${_instdir}"

  cd "${_instdir}" && {
    7z x "${srcdir}/${_target0}"
    chmod 755 Data*
    chmod 644 Data*/*
  }
  rm -f "${_instdir}/Data1"/[vV][lL][aA][kK].[tT][tT][rR] # This one is provided by idos-timetable-data-trains-common.
  rm -f "${_instdir}/Data1"/*.[tT][tT][mM] # Don't install map data here; use a seperate package for that.
  rm -f "${_instdir}/Data1"/*.[tT][tT][pP] # Don't install tariff data here; use a seperate package for that.
  
  install -d -m755 "${pkgdir}/usr/share/doc/${_pkgname}"
  echo "${url}" > "${pkgdir}/usr/share/doc/${_pkgname}/info.url"
  chmod 644 "${pkgdir}/usr/share/doc/${_pkgname}/info.url"

  install -D -m644 "${srcdir}/license-dummy.txt" "${pkgdir}/usr/share/licenses/${pkgname}/copying.txt"
}
