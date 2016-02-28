# Maintainer: dreieck

_pkgname=idos-timetable-data-zsr-sk
pkgname="${_pkgname}-latest"
epoch=0
pkgver=2016_02_25
pkgrel=1
pkgdesc="Timetable data for the offline railway and other public transport timetable search engines by CHAPS: Slovak train data, provided by ŽSR."
arch=('i686' 'x86_64')
url="http://www.zsr.sk/slovensky/cestovny-poriadok-vlakov-osobnej-dopravy-elis-cp-2015-2016-a-aktualizacia-dat-na-stiahnutie.html?page_id=378"
license=('custom')

depends=()

makedepends=(
  "p7zip"
  "wget"
)

optdepends=()

provides=(
  "${_pkgname}=${pkgver}"
  "idos-timetable-data-sk=${pkgver}"
  "idos-timetable-data=${pkgver}"
)

replaces=(
  "${_pkgname}<=${pkgver}"
)

conflicts=(
  "${_pkgname}"
)

_get_download_url() {
  wget -O- -nv "${url}" | grep -i 'vlak16sk.exe' | sed -n "s|^.*<a href=[\"']\([^\"']*\)[\"'].*$|\1|p"
}

_source0="$(_get_download_url)"

source=(
  "vlak16sk.exe::${_source0}"
  "license-dummy.txt"
  "info.url"
)

sha256sums=(
  'SKIP'
  "14279a732be7d04304ff3860d54e0cf8c1a8ba0a46343eaf9b7ce3a105815946"
  "eba7d7bd3836b5d67f9a5179f8318c3d62e6bb84d133fbcba326b713c4333a15"
)

pkgver() {
  _day="$(basename "${_source0}" .exe | cut -d_ -f2)"
  _month="$(basename "${_source0}" .exe | cut -d_ -f3)"
  _year="$(basename "${_source0}" .exe | cut -d_ -f4)"
  
  echo "${_year}_${_month}_${_day}"
}


package() {
  _instdirbase='/opt/idos-timetable/timetables'
  _instdir="${pkgdir}/${_instdirbase}"

  install -d -m755 "${_instdir}"
  cd "${_instdir}"

  7z x "${srcdir}/vlak16sk.exe"
  mv Data1/* .
  rmdir Data1
  chmod 644 *

  install -D -m644 "${srcdir}/info.url" "${pkgdir}/usr/share/doc/${_pkgname}/info.url"

  install -D -m644 "${srcdir}/license-dummy.txt" "${pkgdir}/usr/share/licenses/${pkgname}/copying.txt"
}
