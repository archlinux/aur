# Maintainer: dreieck

_pkgname=idos-timetable-browser
pkgname="${_pkgname}"
pkgver=1.27_lib2.5.0.1
pkgrel=2
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
  "idos-timetable-lang-: For translations in other languages."
  # "idos-timetable-lang-de: For German translation."
  # "idos-timetable-lang-en: For English translation."
  # "idos-timetable-lang-nl: For Dutch translation."
)

provides=(
  "idos-timetable-lang-cz=${pkgver}"
)

replaces=()
conflicts=()

source=(
  "ttakt.zip::http://ttakt.chaps.cz/TTAktual/Win/Zip/TTAKT.ZIP"
  "idos-timetable-browser.sh"
  "IDOS-Licence.pdf::http://chaps.cz/files/idos/IDOS-Licence.pdf"
  "license-dummy.txt"
  "info.url"
)

sha256sums=(
  "38191549f039e7c89032cc790ce9004baad00778f6e9ca44f5cd769f27928ce7"
  "476d566165ab47445df1fa63ca569f1b786f8cad397dc5895dfe650658895cc1"
  "e904d167ccdcfb2743f4cfd596aaa9dce8b751fb5c8315b972b42b7cbb3189e6"
  "c6bb216055d3670d3100b7a74e04ce0644030f365f4349a09e630ef60fbcb9a4"
  "d302ccfd82cc9057751f79b6f0f310676b539a201e943ff7c2fd9b9dbaf29b53"
)


pkgver() {
  wget -nv -O- "${url}" | grep 'Timetable browser, version' | head -n 1 | sed -r 's|^.*Timetable browser, version ([0-9\.]+),.*library version ([0-9\.]+).*$|\1_lib\2|g'
}


package() {
  _instdirbase='/opt/idos-timetable'
  _instdir="${pkgdir}/${_instdirbase}"
  _execdir="${pkgdir}/usr/bin"
  install -d -m755 "${_instdir}"
  cd "${_instdir}"

  unzip "${srcdir}/ttakt.zip"
  chmod 644 *
  chmod 755 TT.exe

  install -d -m755 timetables

  install -D -m644 "${srcdir}/info.url" "${pkgdir}/usr/share/doc/${_pkgname}/info.url"

  install -D -m644 "${srcdir}/license-dummy.txt" "${pkgdir}/usr/share/licenses/${pkgname}/copying.txt"
  install -D -m644 "${srcdir}/IDOS-Licence.pdf" "${pkgdir}/usr/share/licenses/${pkgname}/IDOS-Licence.pdf"

  install -D -m755 "${srcdir}/idos-timetable-browser.sh" "${_execdir}/idos-timetable-browser"
}
