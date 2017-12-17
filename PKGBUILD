# Maintainer: dreieck

# PKGBUILD last time manually edited: At least on 2017-12-17.

_year='18'
_prevyear="$(( ${_year} - 1 ))"

_pkgname="idos-timetable-data-zsr-sk-20${_year}"
pkgname="${_pkgname}-latest"
epoch=0
pkgver=2017_12_14
pkgrel=2
pkgdesc="20${_prevyear}/20${_year} Timetable data for the offline railway and other public transport timetable search engines by CHAPS: Slovak train data, provided by ŽSR."
arch=(any)
# url="http://www2.zsr.sk/pre-cestujucich/elis-vas-pocitac/instalacny-program-elis-k-cestovnemu-poriadku-cp-2016-2017-vnutrostatne-spoje-2.html"
url="http://www.zsr.sk/slovensky/cestovny-poriadok-vlakov-osobnej-dopravy-cp2017-2018-a-aktualizacia-dat-na-stiahnutie.html?page_id=5772"
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
  wget -O- -nv "${url}" | grep -i "vlak${_year}sk.exe" | sed -n "s|^.*<a href=[\"']\([^\"']*\)[\"'].*$|\1|p"
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
  # Do not use metadata of the source file, but do website parsing: So we do not need to download the file to (AUR-)update the package version with our own crude hacked script 'idos-aur-update-versions.sh'.
  #date -r "${srcdir}/${_target0}" +"%Y_%m_%d"
  
  _day="$(basename "${_source0}" .exe | cut -d- -f4)"
  _month="$(basename "${_source0}" .exe | cut -d- -f3)"
  _year="$(basename "${_source0}" .exe | cut -d- -f2)"
  
  echo "${_year}_${_month}_${_day}"
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
