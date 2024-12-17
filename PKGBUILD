# Maintainer: dreieck

# PKGBUILD last time manually edited: At least on 2024-12-17.

url="https://www.inprop.eu/Home/Downloads"
_pkgver() {
  # Reason for a _pkgver(): Have something to run before source download so that we can have version aware source downloads.
  # Use the version of the newest updated file.
  wget -nv -O- "${url}" | tr -d '\a' | tr '\n' '\a' | sed -E -e 's|<tr>|\n|g' -e 's|</tr>|\n|g' | grep -E '<span.*>MHD' | sed -E 's|^.*Updated:.*<span>([0-9]+/[0-9]+/[0-9]+).*$|\1|g' | awk -F/ '{print $3"_"$1"_"$2}' | sed -E -e 's|_([0-9])_|_0\1_|g' -e 's|_([0-9])$|_0\1|g' | sort -Vr | head -n1
}

_pkgname=idos-timetable-data-inprop-mhd-sk-all
pkgname="${_pkgname}-latest"
epoch=0
_pkgver="$(_pkgver)" # This should be set _before_ sources get downloaded.
pkgver="${_pkgver}"
pkgrel=1
pkgdesc="Public transport data of many Slovak cities for the IDOS timetable browser, data provided by INPROP."
arch=(any)
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
  wget -nv -O- "${url}" | tr -d '\a' | tr '\n' '\a' | sed -E -e 's|<tr>|\n|g' -e 's|</tr>|\n|g' | grep -E '<span.*>MHD' | sed 's|^.*href="/Home/\(DownloadFile/[^"]*\)".*$|\1|g' | while read _line; do
    echo "$(basename "${_line}")-${_pkgver}.exe::$(dirname "${url}")/${_line}"
  done
}

_sources=($(_list_sources))

source=(
  "${_sources[@]}"
  "license-dummy.txt"
)

sha256sums=()

for i in $(seq 1 ${#_sources[@]}); do
  sha256sums+=('SKIP')
done

sha256sums=(
  "${sha256sums[@]}"
  "14279a732be7d04304ff3860d54e0cf8c1a8ba0a46343eaf9b7ce3a105815946"
)

pkgver() {
  printf '%s' "${_pkgver}"
}


prepare() {
  cd "${srcdir}"
  mkdir -p "unzip"
  cd "unzip"
  msg2 "Extracting .exe source files ..."
  for _source in "${source[@]}"; do
    _archive="$(sed 's|::.*$||' <<<"${_source}")"
    case "${_archive}" in
      *.exe)
        printf "Extracting ${_archive}" ...
        7z x "${srcdir}/${_archive}"
      ;;
    esac
  done
}

package() {
  _instdirbase='/opt/idos-timetable'
  _instdir="${pkgdir}/${_instdirbase}"

  install -d -m755 "${_instdir}"

  cp -av "${srcdir}"/unzip/Data* "${_instdir}"/

  chmod 755 "${_instdir}"/Data*
  chmod 644 "${_instdir}"/Data*/*

  install -d -m755 "${pkgdir}/usr/share/doc/${_pkgname}"
  echo "${url}" > "${pkgdir}/usr/share/doc/${_pkgname}/info.url"
  chmod 644 "${pkgdir}/usr/share/doc/${_pkgname}/info.url"

  install -D -m644 "${srcdir}/license-dummy.txt" "${pkgdir}/usr/share/licenses/${pkgname}/copying.txt"
}
