# Maintainer: dreieck

# PKGBUILD last time manually edited: At least on 2016-12-13.

_pkgname=idos-timetable-data-zsr-sk
pkgname="${_pkgname}-latest"
epoch=0
pkgver=2017_02_16
pkgrel=1
pkgdesc="Timetable data for the offline railway and other public transport timetable search engines by CHAPS: Slovak train data, provided by ŽSR."
arch=(any)
# url="http://www.zsr.sk/slovensky.html?page_id=378"
url="http://www.zsr.sk/slovensky/cestovny-poriadok-vlakov-osobnej-dopravy-elis-cp-2015-2016-a-aktualizacia-dat-na-stiahnutie.html?page_id=378"
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
)

replaces=(
  "${_pkgname}<=${pkgver}"
)

conflicts=(
  "${_pkgname}"
)

_get_download_url_2017() {
  wget -O- -nv "${url}" | grep -i 'vlak17sk.exe' | sed -n "s|^.*<a href=[\"']\([^\"']*\)[\"'].*$|\1|p"
}

_source0="$(_get_download_url_2017)"

source=(
  "vlak17sk.exe::${_source0}"
  "license-dummy.txt"
)

sha256sums=(
  'SKIP'
  "14279a732be7d04304ff3860d54e0cf8c1a8ba0a46343eaf9b7ce3a105815946"
)

pkgver() {
  _day="$(basename "${_source0}" .exe | cut -d_ -f2)"
  _month="$(basename "${_source0}" .exe | cut -d_ -f3)"
  _year="$(basename "${_source0}" .exe | cut -d_ -f4)"
  
  echo "${_year}_${_month}_${_day}"
}


package() {
  _instdirbase='/opt/idos-timetable'
  _instdir="${pkgdir}/${_instdirbase}"

  install -d -m755 "${_instdir}"

  cd "${_instdir}" && {
    7z x "${srcdir}/vlak17sk.exe"
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
