# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="epson-inkjet-printer-filter"
pkgver=1.0.2
pkgrel=4
pkgdesc="Epson inkjet printer filter used with CUPS"
arch=('x86_64' 'i686')
url="https://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('LGPL-2.1-or-later' 'custom:Epson End User Software License Agreement')
depends=('cups' 'glibc' 'libcups')
_pkgsrc="${pkgname}-${pkgver}"
_bundlesrc="epson-inkjet-printer-201207w-1.0.1"
# source bundle chosen arbitrarily; all of them ship identical filter sources
source=("https://download3.ebz.epson.net/dsc/f/03/00/15/64/87/25d34a13841e5e95d80266e6fd8dfcdf67c95634/${_bundlesrc}-1.src.rpm"
        "${pkgname}_release_build_flags.patch"
        "${pkgname}_lib_res_path.patch")
sha256sums=('ac757bb6d392b6662779228e518bb3e9b4de02d275235c4afd41465447d38b45'
            '94a18c4839ebb3bbd8224c02075fe3489dd7dfe873b683adf3149250c6a8ad16'
            '496ec60ac0d324bf9ebc652b0b1cbe73a98651d408f8903d41aa049bbc53807b')

prepare() {
  cd "${srcdir}"
  bsdtar -xzf "${_pkgsrc}.tar.gz"
  bsdtar -xzf "${_bundlesrc}.tar.gz"

  cd "${_pkgsrc}"
  patch -Np1 -i "${srcdir}/${pkgname}_release_build_flags.patch"
  patch -Np1 -i "${srcdir}/${pkgname}_lib_res_path.patch"
}

pkgver() {
  cd "${srcdir}/${_pkgsrc}"
  sed -n -E 's/AC_INIT\([^,]+,\s*([^,]+).*/\1/p' 'configure.ac'
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  libtoolize
  autoreconf -vfi
  # if you have runtime problems: add "--enable-debug" 
  # and look into /tmp/epson-inkjet-printer-filter.txt
  ./configure \
    --prefix='/usr'
  make
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  # make DESTDIR="${pkgdir}" install

  install -vDm644 "AUTHORS"       "${pkgdir}/usr/share/doc/${pkgname}/AUTHORS"
  # install -vDm644 "ChangeLog"     "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG"
  # install -vDm644 "NEWS"          "${pkgdir}/usr/share/doc/${pkgname}/NEWS"
  install -vDm644 "README"        "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -vDm644 "COPYING.EPSON" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.EPSON"
  install -vDm644 "COPYING.LIB"   "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.LIB"

  cd "src"
  install -vDm755 "${pkgname//-/_}" "${pkgdir}/usr/lib/cups/filter/${pkgname//-/_}"

  cd "${srcdir}/${_bundlesrc}"
  find "watermark" -type f -exec \
    install -vDm644 "{}" "${pkgdir}/usr/share/${pkgname}/{}" \;
}
