# Maintainer: dreieck

# PKGBUILD last time manually edited: At least on 2025-12-10.

_year='26'
_fullyear="20${_year}"
_prevyear="$(( ${_year} - 1 ))"
url="https://www.inprop.eu/Home/Downloads"
_pkgver() {
  # Reason for a _pkgver(): Have something to run before source download so that we can have version aware source downloads.
  # Use the version of the newest updated file.
  wget -nv -O- "${url}" | tr -d '\a' | tr '\n' '\a' | sed -E -e 's|<tr>|\n|g' -e 's|</tr>|\n|g' | grep -E "<span.*>Vlaky Európa ${_fullyear}" | sed -E 's|^.*Updated:.*<span>([0-9]+/[0-9]+/[0-9]+).*$|\1|g' | awk -F/ '{print $3"_"$1"_"$2}' | sort -Vr | head -n1 | sed -E -e 's|_([0-9])_|_0\1_|g' -e 's|_([0-9])$|_0\1|g'
}


_pkgname="idos-timetable-data-zsr-europe+sk-20${_year}"
pkgname="${_pkgname}-latest"
epoch=0
_pkgver="$(_pkgver)" # This should be set _before_ sources get downloaded.
pkgver="${_pkgver}"
pkgrel=1
pkgdesc="20${_prevyear}/20${_year} Timetable data for the offline railway and other public transport timetable search engines by CHAPS: European and Slovak train data, provided by Inprop (Slovakia)."
arch=(any)
license=('custom')

groups=(
        "idos-timetable"
       )

depends=(
         "idos-timetable-data-trains-common"
        )

makedepends=(
  # "p7zip" # Extraction already happens automatically with 'bsdtar'.
  "wget"
)

optdepends=(
            "idos-timetable-tariff-trains-europe: For showing prices."
            "idos-timetable-tariff-trains-cz: For showing prices (Czech republic only)."
            "idos-timetable-tariff-trains-sk: For showing prices (Slovakia only)."
            "idos-timetable-maps-trains-europe: For displaying routes."
            "idos-timetable-maps-trains-cz: For displaying routes (Czech republic only)."
            "idos-timetable-maps-trains-sk: For displaying routes (Slovakia only)."
           )

provides=(
  "${_pkgname}=${pkgver}"

  "idos-timetable-data=${pkgver}"
  "idos-timetable-data-trains=${pkgver}"

  "idos-timetable-data-trains-sk=${pkgver}"
  "idos-timetable-data-trains-sk-20${_year}=${pkgver}"
  "idos-timetable-data-trains-europe=${pkgver}"
  "idos-timetable-data-trains-europe-20${_year}=${pkgver}"
)

replaces=(
  'idos-timetable-data-zsr-europe+sk-latest'
  "${_pkgname}<=${pkgver}"
  "idos-timetable-data-zsr-europe+sk-20${_prevyear}"
  "idos-timetable-data-zsr-europe+sk-20${_prevyear}-latest"
)

conflicts=(
  "${_pkgname}"
)

_list_sources() {
  wget -nv -O- "${url}" | tr -d '\a' | tr '\n' '\a' | sed -E -e 's|<tr>|\n|g' -e 's|</tr>|\n|g' | grep -E "<span.*>Vlaky Európa ${_fullyear}" | sed 's|^.*href="/Home/\(DownloadFile/[^"]*\)".*$|\1|g' | head -n1 | while read _line; do
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

  ## Extraction already happens automatically with 'bsdtar'.
  #for _file in *.exe; do
  #  7z x "${_file}"
  #done
}

package() {
  _instdirbase='/opt/idos-timetable'
  _instdir="${pkgdir}/${_instdirbase}"

  install -d -m755 "${_instdir}/Data1"

  cp -av "${srcdir}/Data1/Vlak${_year}E_Sk.tt" "${_instdir}/Data1"/

  chmod 755 "${_instdir}"/Data*
  chmod 644 "${_instdir}"/Data*/*

  install -d -m755 "${pkgdir}/usr/share/doc/${_pkgname}"
  echo "${url}" > "${pkgdir}/usr/share/doc/${_pkgname}/info.url"
  chmod 644 "${pkgdir}/usr/share/doc/${_pkgname}/info.url"

  install -D -m644 "${srcdir}/license-dummy.txt" "${pkgdir}/usr/share/licenses/${pkgname}/copying.txt"
}
