# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="epson-pc-fax"
pkgver=1.1.2
pkgrel=1
pkgdesc="Epson PC-FAX driver used with CUPS"
arch=('i686' 'x86_64')
url="https://download.ebz.epson.net/man/linux/pc-fax_e.html"
license=('custom:Epson End User Software License Agreement' 'LGPL-2.1-or-later'
         'MIT')
depends=('cups' 'gcc-libs' 'glibc' 'libcups' 'opencflite') # 'icu55' 'util-linux-libs'
_pkgsrc="${pkgname}-${pkgver}"
# DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")
source=("https://download3.ebz.epson.net/dsc/f/03/00/16/72/92/465165eb827848c10080bfda6e9980dcdbea518f/${_pkgsrc}-1.src.rpm"
        "${pkgname}-MANUAL.en.pdf::https://download3.ebz.epson.net/dsc/f/03/00/16/72/99/5eddaa38be4b45c881c279fa8b57990f6dced116/pc-fax_e.pdf"
        "${pkgname}-MANUAL.jp.pdf::https://download3.ebz.epson.net/dsc/f/03/00/16/72/99/abcfe101ac9c0b1d5b9e53088e6bd428a529d4cd/pc-fax_j.pdf"
        "${pkgname}_cups_deprecated_ppd_api.patch"
        "${pkgname}_system_shared_libraries.patch")
sha256sums=('5a939770c44d91b14b7aa55f3ba4a6edc89be7018ecfdcd8dfe40efd09c933ed'
            '33b132592515734e844a2da08ebd31500fe75d726609270836b37f6904833812'
            'e451e6940b5f90b3e053eb3dc06b0369563f623dfd1f4f54afff9fcce1840742'
            '97bea9de793faed5607ff660ea5647d89d1d5d588772b5380d74e824a6613c39'
            '93b1a9cc223d941bbaa50651b17181bb6ac586bbaf96cf66bd1ba793a8779ad2')

prepare() {
  cd "${srcdir}"
  bsdtar -xzf "${_pkgsrc}.tar.gz"

  cd "${_pkgsrc}"
  # https://www.cups.org/doc/api-ppd.html
  patch -Np1 -i "${srcdir}/${pkgname}_cups_deprecated_ppd_api.patch"
  patch -Np1 -i "${srcdir}/${pkgname}_system_shared_libraries.patch"
}

build() {
  export CFLAGS+=" -Wno-error=implicit-function-declaration \
                   -Wno-error=incompatible-pointer-types \
                   -Wno-error=return-mismatch"
  # export LDFLAGS+=" -no-pie"

  cd "${srcdir}/${_pkgsrc}"
  libtoolize
  autoreconf -vfi
  ./configure \
    --prefix='/usr'
    # --prefix="/opt/${pkgname}"
  make
}

package() {
  cd "${srcdir}"
  install -vDm644 "${pkgname}-MANUAL.en.pdf" "${pkgdir}/usr/share/doc/${pkgname}/MANUAL.en.pdf"
  install -vDm644 "${pkgname}-MANUAL.jp.pdf" "${pkgdir}/usr/share/doc/${pkgname}/MANUAL.jp.pdf"

  cd "${_pkgsrc}"
  make DESTDIR="${pkgdir}" install

  install -vDm644 "AUTHORS"       "${pkgdir}/usr/share/doc/${pkgname}/AUTHORS"
  # install -vDm644 "ChangeLog"     "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG"
  install -vDm644 "NEWS"          "${pkgdir}/usr/share/doc/${pkgname}/NEWS"
  install -vDm644 "README"        "${pkgdir}/usr/share/doc/${pkgname}/README"
  # install -vDm644 "APPLE_LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.APPLE"
  install -vDm644 "COPYING.EPSON" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.EPSON"
  install -vDm644 "COPYING.LIB"   "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.LIB"

  find "ppd" -type f -name '*.ppd' \
    -exec sed -i "s|/opt/${pkgname}/cups/lib/filter/pcfax_filter|/usr/lib/cups/filter/pcfax_filter|g" "{}" + \
    -execdir install -vDm644 "{}" "${pkgdir}/usr/share/cups/model/${pkgname}/{}" \;

  cd "${pkgdir}/usr/lib"
  install -vDm755 "epfax" "${pkgdir}/usr/bin/epfax"

  find . -maxdepth 1 -type f,l -delete
}
