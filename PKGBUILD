# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="epson-inkjet-printer-filter"
pkgname="${_name}-lsb"
pkgver=1.0.0
pkgrel=2
pkgdesc="Epson inkjet printer filter used with CUPS (legacy LSB version)"
arch=('i686' 'x86_64')
url="https://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('LGPL-2.1-or-later' 'custom:Epson End User Software License Agreement')
depends=('cups' 'gcc-libs' 'glibc' 'libcups' 'libjpeg')
# source bundle chosen arbitrarily; all of them ship identical filter sources
_pkgsrc="${_name}-${pkgver}"
_bundlesrc="epson-inkjet-printer-workforce-635-nx625-series-1.0.1"
DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")
source=("https://download.ebz.epson.net/dsc/op/stable/SRPMS/${_bundlesrc}-1lsb3.2.src.rpm"
        "${pkgname}_release_build_flags.patch"
        "${pkgname}_lib_res_path.patch"
        "${pkgname}_raster_helper.patch")
sha256sums=('c2fdb47e0a1bf0f0a4ed3ad689fe96335d853572c208795e367be7e40114cba6'
            '94a18c4839ebb3bbd8224c02075fe3489dd7dfe873b683adf3149250c6a8ad16'
            'b7b242611a1d7395c54465f4955879dd8ac02747e05e3df21a98b87b10a1db6c'
            '85b0493972dcb92befd2bbf8d0ce705fc6280d54d83e985e9f7d0301bb01af50')

prepare() {
  cd "${srcdir}"
  bsdtar -xzf "${_pkgsrc}.tar.gz"
  bsdtar -xzf "${_bundlesrc}.tar.gz" "${_bundlesrc}/watermark"

  cd "${_pkgsrc}"
  patch -Np1 -i "${srcdir}/${pkgname}_release_build_flags.patch"
  patch -Np1 -i "${srcdir}/${pkgname}_lib_res_path.patch"
  patch -Np1 -i "${srcdir}/${pkgname}_raster_helper.patch"
}

pkgver() {
  cd "${srcdir}/${_pkgsrc}"
  sed -n -E 's/AC_INIT\([^,]+,\s*([^,]+).*/\1/p' 'configure.ac'
}

build() {
  export LDFLAGS+=" -Wl,--no-as-needed"

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
  install -vDm755 "${_name//-/_}" "${pkgdir}/usr/lib/cups/filter/${pkgname//-/_}"

  cd "${srcdir}/${_bundlesrc}"
  find "watermark" -type f -exec \
    install -vDm644 "{}" "${pkgdir}/usr/share/${pkgname}/{}" \;
}
