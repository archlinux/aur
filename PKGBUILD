# Maintainer: dreieck

# PKGBUILD last time manually edited: At least on 2016-12-16.

_pkgname=idos-timetable-data-inprop-mhd-sk-all
pkgname="${_pkgname}-latest"
epoch=0
pkgver=2018_12_14
pkgrel=1
pkgdesc="Public transport data of many Slovak cities for the IDOS timetable browser, data provided by INPROP."
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
            "idos-timetable-tariff-mhd: For showing prices."
            "idos-timetable-maps-mhd: For displaying routes."
           )

provides=(
  "${_pkgname}=${pkgver}"

  "idos-timetable-data=${pkgver}"
  "idos-timetable-data-mhd=${pkgver}"
  "idos-timetable-data-mhd-sk=${pkgver}"
  
  "idos-timetable-data-mhd-sk-all=${pkgver}"
)

conflicts=(
  "${_pkgname}"
  "idos-timetable-data-mhd-banskabystrica"
  "idos-timetable-data-mhd-bratislava"
  "idos-timetable-data-mhd-humenne"
  "idos-timetable-data-mhd-michalovce"
  "idos-timetable-data-mhd-povazskabystrica"
  "idos-timetable-data-mhd-presov"
  "idos-timetable-data-mhd-puchov"
)

_list_sources() {
  wget -nv -O- "${url}" | grep --text \.exe | sed -r 's|(Data/[a-zA-Z0-9]*\.exe)|\n\1\n|g' | grep -E 'Data/MD[a-zA-Z0-9]*\.exe' | while read line; do
    echo "$(dirname "${url}")/${line}"
  done
}

_sources=($(_list_sources))

source=(
  "${_sources[@]}"
  "license-dummy.txt"
)

sha256sums=()

for i in $(seq 1 ${#_sources[@]}); do
  sha256sums=(
    "${sha256sums[@]}"
    'SKIP'
  )
done

sha256sums=(
  "${sha256sums[@]}"
  "14279a732be7d04304ff3860d54e0cf8c1a8ba0a46343eaf9b7ce3a105815946"
)

pkgver() {
  # Use the version of the newest updated file.
  wget -nv -O- "${url}" | grep --text -E 'Data/MD[a-zA-Z0-9]*\.exe' | sed -r 's|[^0-9]([0-9]{1,2}\.[0-9]{1,2}\.[0-9]{4})[^0-9]|\n\1\n|' | grep --text -E '^[0-9]{1,2}\.[0-9]{1,2}\.[0-9]{4}$' | awk -F. '{print $3"_"$2"_"$1}' | sort -Vr | head -n 1
}


package() {
  _instdirbase='/opt/idos-timetable'
  _instdir="${pkgdir}/${_instdirbase}"

  install -d -m755 "${_instdir}"

  cd "${_instdir}" && {
    for _file in "${_sources[@]}"; do
      _sourcefile="$(basename "${_file}")"
      7z x "${srcdir}/${_sourcefile}"
    done
    chmod 755 Data*
    chmod 644 Data*/*
  }
  
  install -d -m755 "${pkgdir}/usr/share/doc/${_pkgname}"
  echo "${url}" > "${pkgdir}/usr/share/doc/${_pkgname}/info.url"
  chmod 644 "${pkgdir}/usr/share/doc/${_pkgname}/info.url"

  install -D -m644 "${srcdir}/license-dummy.txt" "${pkgdir}/usr/share/licenses/${pkgname}/copying.txt"
}
