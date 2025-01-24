# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="LP-S4290"
_model="${_Name,,}"
pkgname="epson-laser-printer-${_model}"
pkgver=1.0.1
pkgrel=1
pkgdesc="Epson laser printer driver (LP-S2290, LP-S3290, LP-S3590, ${_Name})"
arch=('any')
url="https://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('MIT')
depends=('epson-laser-printer-filter' 'cups' 'cups-filters')
_pkgsrc="${pkgname}-${pkgver}"
# DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")
source=("https://download3.ebz.epson.net/dsc/f/03/00/15/66/66/70f919a660091eb9522ecd79dfda13f4249c4f77/${_pkgsrc}-1.src.rpm")
sha256sums=('27489764bb40d1af0b04174a767a8897cfcb29da82417b7578774e6a84395bbe')

prepare() {
  cd "${srcdir}"
  bsdtar -xzf "${_pkgsrc}.tar.gz"
}

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
