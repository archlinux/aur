# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: PhrozenByte

# if you have problems, read more about the voodoo magic in these comments:
# https://aur.archlinux.org/packages/epson-inkjet-printer-workforce-635-nx625-series

pkgname="epson-inkjet-printer-filter"
pkgver=1.0.2
pkgrel=6
pkgdesc="Epson inkjet printer filter used with CUPS"
arch=('i686' 'x86_64')
url="https://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('LGPL-2.1-or-later'                                 # filter itself
         'custom:Epson End User Software License Agreement') # watermark .EIDs
depends=('cups' 'gcc-libs' 'glibc' 'libcups' 'libjpeg')
# there are no standalone filter or driver sources, both are shipped together
# so we download some driver bundle and extract the filter sources from there
# source bundle chosen arbitrarily; all of them ship identical filter sources
_pkgsrc="${pkgname}-${pkgver}"
_bundlesrc="epson-inkjet-printer-201207w-1.0.1"
#  download.ebz.epson.net blocks some user-agents and returns 403
# download3.ebz.epson.net works fine (for now)
# DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")
source=("https://download3.ebz.epson.net/dsc/f/03/00/15/64/87/25d34a13841e5e95d80266e6fd8dfcdf67c95634/${_bundlesrc}-1.src.rpm"
        "${pkgname}_release_build_flags.patch"
        "${pkgname}_lib_res_path.patch")
sha256sums=('ac757bb6d392b6662779228e518bb3e9b4de02d275235c4afd41465447d38b45'
            '94a18c4839ebb3bbd8224c02075fe3489dd7dfe873b683adf3149250c6a8ad16'
            '496ec60ac0d324bf9ebc652b0b1cbe73a98651d408f8903d41aa049bbc53807b')

prepare() {
  cd "${srcdir}"
  bsdtar -xzf "${_pkgsrc}.tar.gz"
  bsdtar -xzf "${_bundlesrc}.tar.gz" "${_bundlesrc}/watermark"

  cd "${_pkgsrc}"
  # release builds disrespect user build flags and replace them with '-O2'
  patch -Np1 -i "${srcdir}/${pkgname}_release_build_flags.patch"
  # we will install with the prefix '/usr' instead of "/opt/epson-inkjet-printer-${_model}"
  patch -Np1 -i "${srcdir}/${pkgname}_lib_res_path.patch"
}

pkgver() {
  cd "${srcdir}/${_pkgsrc}"
  # AC_INIT(epson-inkjet-printer-filter, ${pkgver}, epson@localdomain)
  sed -n -E 's/AC_INIT\([^,]+,\s*([^,]+).*/\1/p' 'configure.ac'
}

build() {
  # this will cause overlinking to 'gcc-libs' and 'libjpeg'
  # the filter itself doesn't depend on them,
  # but the .so libraries shipped with every driver do (at least on 'gcc-libs')
  # for some reason, older .so libraries aren't linked to them,
  # which causes missing symbol errors:
  # undefined symbol: _ZTVN10__cxxabiv117__class_type_infoE
  # this symbol is from 'libstdc++.so', which is provided by 'gcc-libs'
  # it is not known whether 'libjpeg' is actually needed
  # knowing that the filter is called ahead of the libraries,
  # we overlink the required dependencies here to load them into memory
  # this trick is reportedly not needed for the newer models with newer libraries
  # but is required for older 'LSB-dependent' drivers with 'lsb3.2' postfix
  # these were released in ~2012, mostly at v1.0.0, and come from download.ebz.epson.net
  export LDFLAGS="${LDFLAGS//-Wl,--as-needed/} -Wl,--no-as-needed"

  cd "${srcdir}/${_pkgsrc}"
  libtoolize
  autoreconf -vfi
  # if you have runtime problems: add '--enable-debug' 
  # and look into /tmp/epson-inkjet-printer-filter.txt
  # sometimes, CUPS log may be helpful too: /var/log/cups/error_log 
  ./configure \
    --prefix='/usr'
    # --prefix="/opt/epson-inkjet-printer-${_model}"
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
  # all drivers ship the same watermark .EID files,
  # so we install them once to a common location
  find "watermark" -type f -exec \
    install -vDm644 "{}" "${pkgdir}/usr/share/${pkgname}/{}" \;
}
