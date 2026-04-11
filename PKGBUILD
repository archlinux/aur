# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgbase="epson-tm-series-printer-driver"
pkgname=(
  "epson-tm-series-printer-impact-receipt"
  "epson-tm-series-printer-impact-slip"
  "epson-tm-series-printer-thermal-receipt"
)
pkgver=3.0.0.0
pkgrel=1
pkgdesc="Epson TM-series printer driver"
arch=(
  'i686'
  'x86_64'
)
url="https://support.epson.net/setupnavi/?PINF=category&OSC=WS&GROUP=pos_product"
license=(
  'GPL-2.0-or-later'
  # 'GPL-3.0-or-later'
)
depends=(
  'cups'
  'glibc'
  'libcups'
)
# makedepends=(
#   'cmake>=2.8'
# )
_pkgsrc="tmx-cups-src-ImpactReceipt-${pkgver}_pck"
source=(
  "https://download3.ebz.epson.net/dsc/f/03/00/15/35/42/b1a708bb8b21d7a68ae7394287db440974b68a0e/${_pkgsrc}_e.zip"
)
sha256sums=('94bdc542274ff9b2291781d8a6b0daad19178b1eb9ae9c2e751ce0f250caa1e2')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  find . -maxdepth 1 -type f -name '*.tar*' -exec \
    bsdtar -xzf "{}" \;
}

build() {
  cd "${srcdir}/${_pkgsrc}/Impact Receipt/filter"
  gcc ${CFLAGS} ${LDFLAGS} -o "rastertotmir" "TmImpactReceipt.c"  -lcups -lcupsimage

  cd "${srcdir}/${_pkgsrc}/Impact Slip/filter"
  gcc ${CFLAGS} ${LDFLAGS} -o "rastertotmis" "TmImpactSlip.c"     -lcups -lcupsimage

  cd "${srcdir}/${_pkgsrc}/Thermal Receipt/filter"
  gcc ${CFLAGS} ${LDFLAGS} -o "rastertotmtr" "TmThermalReceipt.c" -lcups -lcupsimage
}

package_epson-tm-series-printer-impact-receipt() {
  pkgdesc+=" (TM-U220)"

  cd "${srcdir}/${_pkgsrc}/Impact Receipt"
  install -vDm644 "README"  "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -vDm644 "LISENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  find "ppd" -type f -name '*.ppd' -execdir \
    install -vDm644 "{}" "${pkgdir}/usr/share/cups/model/${pkgname}/{}" \;

  cd "filter"
  install -vDm755 "rastertotmir" "${pkgdir}/usr/lib/cups/filter/rastertotmir"
}

package_epson-tm-series-printer-impact-slip() {
  pkgdesc+=" (TM-H6000IV)"

  cd "${srcdir}/${_pkgsrc}/Impact Slip"
  install -vDm644 "README"  "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -vDm644 "LISENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  find "ppd" -type f -name '*.ppd' -execdir \
    install -vDm644 "{}" "${pkgdir}/usr/share/cups/model/${pkgname}/{}" \;

  cd "filter"
  install -vDm755 "rastertotmis" "${pkgdir}/usr/lib/cups/filter/rastertotmis"
}

package_epson-tm-series-printer-thermal-receipt() {
  pkgdesc+=" (TM-m30, TM-T88VI, TM-H6000V)"

  cd "${srcdir}/${_pkgsrc}/Thermal Receipt"
  install -vDm644 "README"  "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -vDm644 "LISENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  find "ppd" -type f -name '*.ppd' -execdir \
    install -vDm644 "{}" "${pkgdir}/usr/share/cups/model/${pkgname}/{}" \;

  cd "filter"
  install -vDm755 "rastertotmtr" "${pkgdir}/usr/lib/cups/filter/rastertotmtr"
}
