# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="epson-pc-fax"
pkgver=1.1.1
pkgrel=2
pkgdesc="Epson PC-FAX driver filter used with CUPS"
arch=('i686' 'x86_64')
url="https://download.ebz.epson.net/man/linux/pc-fax_e.html"
license=('LGPL-2.1-or-later' # source for binaries
         'MIT')              # .ppd's
depends=('cups' 'gcc-libs' 'glibc' 'libcups')
_pkgsrc="${pkgname}-${pkgver}"
# DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")
source=("https://download3.ebz.epson.net/dsc/f/03/00/15/39/04/a3b02d240a7e2d771302753a0d95aca5ae33c170/${_pkgsrc}-1.src.rpm"
        "${pkgname}_cups_deprecated_ppd_api.patch")
sha256sums=('ceb42c81f0f56d5c8847b80a326427fe0ed374e256f905705f935358c1f01993'
            '97bea9de793faed5607ff660ea5647d89d1d5d588772b5380d74e824a6613c39')

prepare() {
  cd "${srcdir}"
  bsdtar -xzf "${_pkgsrc}.tar.gz"

  cd "${_pkgsrc}"
  # https://github.com/IntegersOfK/Hoin-POS-58-80/pull/7
  patch -Np1 -i "${srcdir}/${pkgname}_cups_deprecated_ppd_api.patch"
}

build() {
  export CFLAGS+=" -Wno-error=implicit-function-declaration \
                   -Wno-error=incompatible-pointer-types \
                   -Wno-error=return-mismatch"
  export LDFLAGS+=" -no-pie"

  cd "${srcdir}/${_pkgsrc}"
  libtoolize
  autoreconf -vfi
  ./configure \
    --prefix='/usr'
    # --prefix="/opt/${pkgname}"
  make

  find "ppd" -type f -name '*.ppd' -exec \
    sed -i "s|/opt/${pkgname}/cups/lib/filter/pcfax_filter|/usr/lib/cups/filter/pcfax_filter|g" "{}" +
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" install

  install -vDm644 "AUTHORS"       "${pkgdir}/usr/share/doc/${pkgname}/AUTHORS"
  # install -vDm644 "ChangeLog"     "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG"
  install -vDm644 "NEWS"          "${pkgdir}/usr/share/doc/${pkgname}/NEWS"
  install -vDm644 "README"        "${pkgdir}/usr/share/doc/${pkgname}/README"
  # install -vDm644 "COPYING.EPSON" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.EPSON"
  install -vDm644 "COPYING.LIB"   "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"

  find "ppd" -type f -name '*.ppd' -execdir \
    install -vDm644 "{}" "${pkgdir}/usr/share/cups/model/${pkgname}/{}" \;

  cd "${pkgdir}/usr/lib"
  install -vDm755 "epfax" "${pkgdir}/usr/bin/epfax"
  rm -f "epfax"
}
