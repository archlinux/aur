# Maintainer: dreieck

_pkgname=idos-timetable-data-inprop-mhd-bratislava
pkgname="${_pkgname}-latest"
epoch=0
pkgver=2016_8_19
pkgrel=1
pkgdesc="Bratislava public transport data for the IDOS timetable browser, data provided by INPROP."
arch=(any)
url="http://www.inprop.sk/download.aspx"
license=('custom')

groups=(
        "idos-timetable"
       )

depends=(
         "idos-timetable-browser"
        )

makedepends=(
  "p7zip"
  "wget"
)

optdepends=(
            "idos-timetable-tariff-mhd-bratislava: For showing prices."
            "idos-timetable-maps-mhd-bratislava: For displaying routes."
           )

provides=(
  "${_pkgname}=${pkgver}"

  "idos-timetable-data=${pkgver}"
  "idos-timetable-data-mhd=${pkgver}"

  "idos-timetable-data-mhd-bratislava=${pkgver}"
)

conflicts=(
  "${_pkgname}"
  "idos-timetable-data-mhd-sk-all"
)

_sourcefile="MDBaSk.exe"

source=(
  "http://www.inprop.sk/Data/${_sourcefile}"
  "license-dummy.txt"
)

sha256sums=(
  'SKIP'
  "14279a732be7d04304ff3860d54e0cf8c1a8ba0a46343eaf9b7ce3a105815946"
)

pkgver() {
  _rawver="$(wget -nv -O- "${url}" | grep --text "${_sourcefile}" | sed -r 's|[^0-9]([0-9]{1,2}\.[0-9]{1,2}\.[0-9]{4})[^0-9]|\n\1\n|' | sed -n 2p)"
  
  _day="$(echo "${_rawver}" | cut -d. -f1)"
  _month="$(echo "${_rawver}" | cut -d. -f2)"
  _year="$(echo "${_rawver}" | cut -d. -f3)"
  
  echo "${_year}_${_month}_${_day}"
}


package() {
  _instdirbase='/opt/idos-timetable'
  _instdir="${pkgdir}/${_instdirbase}"

  install -d -m755 "${_instdir}"

  cd "${_instdir}" && {
    7z x "${srcdir}/${_sourcefile}"
    chmod 755 Data*
    chmod 644 Data*/*
  }
  
  install -d -m755 "${pkgdir}/usr/share/doc/${_pkgname}"
  echo "${url}" > "${pkgdir}/usr/share/doc/${_pkgname}/info.url"
  chmod 644 "${pkgdir}/usr/share/doc/${_pkgname}/info.url"

  install -D -m644 "${srcdir}/license-dummy.txt" "${pkgdir}/usr/share/licenses/${pkgname}/copying.txt"
}
