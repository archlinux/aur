# Maintainer: dreieck

_pkgname=idos-timetable-browser
pkgname="${_pkgname}-latest"
epoch=0
pkgver=1.27_lib2.8.0.1
pkgrel=1
pkgdesc="Offline railway and other public transport timetable search engine by CHAPS. (Czech language by default.)"
arch=('i686' 'x86_64')
url="http://chaps.cz/eng/download/idos/zip#kotvaprg"
license=('custom')

depends=(
  "ttf-timetable"
  "wine"
)

makedepends=(
  "unzip"
)

optdepends=(
  "idos-timetable-data: For timetable data. (You need at least one to use the software.)"
  "idos-timetable-tariff: For showing prices."
  "idos-timetable-maps: For displaying routes on maps."
  # "idos-timetable-lang: For translations in other languages."
  "idos-timetable-lang-de: For German translation."
  "idos-timetable-lang-en: For English translation."
)

provides=(
  "${_pkgname}=${pkgver}"
  "idos-timetable-lang-cz=${pkgver}"
)

conflicts=("${_pkgname}")

replaces=("${_pkgname}<=${pkgver}")


source=(
  "ttakt.zip::http://ttakt.chaps.cz/TTAktual/Win/Zip/TTAKT.ZIP"
  "idos-timetable-browser.sh"
  "IDOS-Licence.pdf::http://chaps.cz/files/idos/IDOS-Licence.pdf"
  "license-dummy.txt"
  "README.datafiles.txt"
)

sha256sums=(
  "SKIP" # "92a47f8947a15bdd3c0fcaac4e21db7d0ae6d9e70cfb9de94e5238081a91a817"
  "5d6e710d03d5832fcdb67726b3ce91ee1a4fe993f258e8a15c49bd51f5224bb5"
  "e904d167ccdcfb2743f4cfd596aaa9dce8b751fb5c8315b972b42b7cbb3189e6"
  "c6bb216055d3670d3100b7a74e04ce0644030f365f4349a09e630ef60fbcb9a4"
  "45bf7c462d7154360d0007a6d7c00c6aa6b49339b6f178cf24e5b1a40ca702d7"
)


pkgver() {
  wget -nv -O- "${url}" | grep 'Timetable browser, version' | head -n 1 | sed -r 's|^.*Timetable browser, version ([0-9\.]+),.*library version ([0-9\.]+).*$|\1_lib\2|g'
}


package() {
  _instdirbase='/opt/idos-timetable'
  _instdir="${pkgdir}/${_instdirbase}"
  _execdir="${pkgdir}/usr/bin"
  install -d -m755 "${_instdir}"

  cd "${_instdir}" && {
    unzip "${srcdir}/ttakt.zip"
    chmod 644 *
    chmod 755 TT.exe
  }

  install -d -m755 "${pkgdir}/usr/share/doc/${_pkgname}"
  echo "${url}" > "${pkgdir}/usr/share/doc/${_pkgname}/info.url"
  chmod 644 "${pkgdir}/usr/share/doc/${_pkgname}/info.url"
  install -D -m644 "${srcdir}/README.datafiles.txt"        "${pkgdir}/usr/share/doc/${_pkgname}/README.datafiles.txt"

  ln -s "/usr/share/doc/${_pkgname}/README.datafiles.txt"  "${_instdir}/README.datafiles.txt"

  install -D -m644 "${srcdir}/license-dummy.txt"           "${pkgdir}/usr/share/licenses/${pkgname}/copying.txt"
  install -D -m644 "${srcdir}/IDOS-Licence.pdf"            "${pkgdir}/usr/share/licenses/${pkgname}/IDOS-Licence.pdf"

  install -D -m755 "${srcdir}/idos-timetable-browser.sh"   "${_execdir}/idos-timetable-browser"
}
