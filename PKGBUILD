# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="epson-laser-printer-filter"
pkgver=1.0.2 # see NEWS
pkgrel=2
pkgdesc="Epson laser printer filter used with CUPS"
arch=('i686' 'x86_64')
url="https://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('LGPL-2.1-or-later' 'custom:Epson End User Software License Agreement')
depends=('cups' 'ghostscript' 'glibc' 'libcups' 'psutils' 'sh')
# there are no standalone filter or driver sources, both are shipped together
# so we download some driver bundle and only install the filter
# source bundle chosen arbitrarily; all of them ship identical filter sources
# _pkgsrc="${pkgname}-${pkgver}"
_bundlesrc="epson-laser-printer-lp-s8180-1.0.2"
#  download.ebz.epson.net blocks some user-agents and returns 403
# download3.ebz.epson.net works fine (for now)
# DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")
source=("https://download3.ebz.epson.net/dsc/f/03/00/15/66/64/07f66171f4e7803095987a360c19d6607c780bb0/${_bundlesrc}-1.src.rpm")
sha256sums=('1623be97a5125f31fae2b6e793999290318371e1bc377a3498ea678d09427e6c')

prepare() {
  cd "${srcdir}"
  bsdtar -xzf "${_bundlesrc}.tar.gz"

  cd "${_bundlesrc}"
  # typo?
  find "src" -type f \( -name '*.h' -o -name '*.c' \) -exec \
    sed -i 's/debug_msga/debug_msg/g' "{}" +
}

build() {
  export CFLAGS+=" -Wno-error=implicit-function-declaration -Wno-error=return-mismatch"
  export LDFLAGS+=" -no-pie"

  cd "${srcdir}/${_bundlesrc}"
  libtoolize
  autoreconf -vfi
  ./configure \
    --prefix='/usr'
    # --prefix="/opt/epson-laser-printer-${_model}"
  make
}

package() {
  cd "${srcdir}/${_bundlesrc}"
  make DESTDIR="${pkgdir}" install

  install -vDm644 "AUTHORS"       "${pkgdir}/usr/share/doc/${pkgname}/AUTHORS"
  # install -vDm644 "ChangeLog"     "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG"
  install -vDm644 "NEWS"          "${pkgdir}/usr/share/doc/${pkgname}/NEWS"
  # install -vDm644 "README"        "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -vDm644 "COPYING.EPSON" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.EPSON"
  install -vDm644 "COPYING.LIB"   "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.LIB"

  cd "${pkgdir}/usr"
  rm -rf "share"

  cd "lib/cups/filter"
  chmod +x *
  sed -i 's|^EPS_FILTER=.*|EPS_FILTER=/usr/lib/cups/filter/epson-escpage|g' 'escpage-wrapper.sh'
}
