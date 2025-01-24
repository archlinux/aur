# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="LP-S7160"
_model="${_Name,,}"
pkgname="epson-laser-printer-${_model}"
pkgver=1.0.1
pkgrel=1
pkgdesc="Epson laser printer driver (${_Name})"
arch=('any')
url="https://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('MIT')
depends=('epson-laser-printer-filter' 'cups' 'cups-filters')
_pkgsrc="${pkgname}-${pkgver}"
# DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")
source=("https://download3.ebz.epson.net/dsc/f/03/00/05/37/11/4aff6d0b43b3e28aaa4cf1d57ce7315df63286e2/${_pkgsrc}.tar.gz")
sha256sums=('0f1311072603d0903d494353f64f89e9b6044d824863d1f3502cd154c38b01e1')

build() {
  cd "${srcdir}/${_pkgsrc}"
  find "ppd" -type f -name '*.ppd' -exec \
    sed -e "s|/opt/epson-laser-printer-${_model}/cups/lib/filter|/usr/lib/cups/filter|g" \
        -e "s|pstolpf-${_model}.sh|escpage-wrapper.sh|g"\
        -i "{}" +
  # find "src" -type f -name '*.sh' -exec \
  #   sed -i "s|/opt/epson-laser-printer-${_model}/cups/lib/filter|/usr/lib/cups/filter|g" "{}" +
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  # install -vDm644 "AUTHORS"       "${pkgdir}/usr/share/doc/${pkgname}/AUTHORS"
  # install -vDm644 "ChangeLog"     "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG"
  install -vDm644 "NEWS"          "${pkgdir}/usr/share/doc/${pkgname}/NEWS"
  install -vDm644 "README"        "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -vDm644 "README.ja"     "${pkgdir}/usr/share/doc/${pkgname}/README.ja"
  # install -vDm644 "COPYING.EPSON" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.EPSON"
  # install -vDm644 "COPYING.LIB"   "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.LIB"

  find "ppd" -type f -name '*.ppd' -execdir \
    install -vDm644 "{}" "${pkgdir}/usr/share/cups/model/${pkgname}/{}" \;
  # find "src" -type f -name '*.sh' -execdir \
  #   install -vDm755 "{}" "${pkgdir}/usr/lib/cups/{}" \;
}
