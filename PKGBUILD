# Maintainer: MOON Sungjoon <sumoon at seoulsaram dot com>
pkgname=libsane-oki
pkgver=1.7.0
_pkgver=1.7-0
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="SANE drivers OKI multifunctional printers"
url="https://www.oki.com/us/printing/support/drivers-and-utilities/"
license=('custom')
depends=('sane')
# The driver may need to be be downloaded manually from:
#   https://www.oki.com/us/printing/support/drivers-and-utilities/ 
#
# 1. select the printer
# 2. select Linux drivers and Utilities
# 3. download either "Scanner Driver (Debian i386)" or "Scanner Driver (Debian x86_64)"
_debfile_i686=("okimfpsdrv_${_pkgver}_i386_231226.deb")
_debfile_x86_64=("okimfpsdrv_${_pkgver}_amd64_231225.deb")
source_i686=("https://www.oki.com/us/printing/download/okimfpsdrv_${_pkgver}_i386_231226.deb")
source_x86_64=("https://www.oki.com/us/printing/download/okimfpsdrv_${_pkgver}_amd64_231225.deb")
sha256sums_i686=('95619a5329b25c0cae3cc91a8dfba7d303a489c1a3c34bb0d30c60bb8f5c748c')
sha256sums_x86_64=('354fecb4e970747c9da21cd343e3a410b3e1b4c109f0e2bcff0a2918e3a77896')

prepare() {
  [ "$CARCH" = "x86_64" ] && ar x ${_debfile_x86_64}
  [ "$CARCH" = "x86" ] && ar x ${_debfile_i686}
  bsdtar -xf data.tar.gz
  rm -f data.tar.gz
}

package() {
  # install the license
  install -d -m755 "$pkgdir/usr/share/licenses/$pkgname"
  cp -r ./usr/share/doc/okimfpsdrv/* "${pkgdir}/usr/share/licenses/${pkgname}"

  # install the sane backend
  install -d -m755 "$pkgdir/usr/lib"
  install -d -m755 "$pkgdir/usr/lib/sane"
  cp -r $srcdir/usr/lib/libokiutl.* -t "${pkgdir}/usr/lib"
  cp -r $srcdir/usr/lib/libokiscandif.* -t "${pkgdir}/usr/lib"
  cp -r $srcdir/usr/lib/sane "${pkgdir}/usr/lib"
  chmod 755 ${pkgdir}/usr/lib/libokiutl.so.1.5.0
  chmod 755 ${pkgdir}/usr/lib/libokiscandif.so.1.5.0
  chmod 755 ${pkgdir}/usr/lib/sane/libsane-oki.so.1.2.0

  install -d -m755 "$pkgdir/usr/share/sane"
  cp -r ./usr/share/sane/xsane "$pkgdir/usr/share/sane"
}
