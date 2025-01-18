# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgbase="epson-thermal-printer-driver"
pkgname=("epson-thermal-printer-"{impact-{receipt,slip},thermal-receipt})
pkgver=3.0.0.0
pkgrel=1
pkgdesc="Epson thermal printer driver"
arch=('i686' 'x86_64')
url="https://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('GPL-2.0-or-later')
depends=('cups' 'glibc' 'libcups')
# makedepends=('cmake>=2.8')
_bundlesrc="tmx-cups-src-ImpactReceipt-${pkgver}_pck"
#  download.ebz.epson.net blocks some user-agents and returns 403
# download3.ebz.epson.net works fine (for now)
# DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")
source=("https://download3.ebz.epson.net/dsc/f/03/00/15/35/42/b1a708bb8b21d7a68ae7394287db440974b68a0e/${_bundlesrc}_e.zip")
sha256sums=('94bdc542274ff9b2291781d8a6b0daad19178b1eb9ae9c2e751ce0f250caa1e2')

prepare() {
  cd "${srcdir}/${_bundlesrc}"
  find . -maxdepth 1 -type f -name '*.tar.gz' -exec \
    bsdtar -xzf "{}" \;
}

build() {
  cd "${srcdir}/${_bundlesrc}/Impact Receipt/filter"
  gcc ${CFLACS} ${LDFLAGS} -o "rastertotmir" "TmImpactReceipt.c"  -lcups -lcupsimage

  cd "${srcdir}/${_bundlesrc}/Impact Slip/filter"
  gcc ${CFLACS} ${LDFLAGS} -o "rastertotmis" "TmImpactSlip.c"     -lcups -lcupsimage

  cd "${srcdir}/${_bundlesrc}/Thermal Receipt/filter"
  gcc ${CFLACS} ${LDFLAGS} -o "rastertotmtr" "TmThermalReceipt.c" -lcups -lcupsimage
}

package_epson-thermal-printer-impact-receipt() {
  pkgdesc+=" (TM-U220)"

  cd "${srcdir}/${_bundlesrc}/Impact Receipt"
  install -vDm644 "README"  "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -vDm644 "LISENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  find "ppd" -type f -name '*.ppd' -execdir \
    install -vDm644 "{}" "${pkgdir}/usr/share/cups/model/${pkgname}/{}" \;

  cd "filter"
  install -vDm755 "rastertotmir" "${pkgdir}/usr/lib/cups/filter/rastertotmir"
}

package_epson-thermal-printer-impact-slip() {
  pkgdesc+=" (TM-H6000IV)"

  cd "${srcdir}/${_bundlesrc}/Impact Slip"
  install -vDm644 "README"  "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -vDm644 "LISENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  find "ppd" -type f -name '*.ppd' -execdir \
    install -vDm644 "{}" "${pkgdir}/usr/share/cups/model/${pkgname}/{}" \;

  cd "filter"
  install -vDm755 "rastertotmis" "${pkgdir}/usr/lib/cups/filter/rastertotmis"
}

package_epson-thermal-printer-thermal-receipt() {
  pkgdesc+=" (TM-m30, TM-T88VI, TM-H6000V)"

  cd "${srcdir}/${_bundlesrc}/Thermal Receipt"
  install -vDm644 "README"  "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -vDm644 "LISENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  find "ppd" -type f -name '*.ppd' -execdir \
    install -vDm644 "{}" "${pkgdir}/usr/share/cups/model/${pkgname}/{}" \;

  cd "filter"
  install -vDm755 "rastertotmtr" "${pkgdir}/usr/lib/cups/filter/rastertotmtr"
}