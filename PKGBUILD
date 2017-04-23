# Co-Maintainer: Ji_M (ji_m at mailbox dot org)
#   2017-04-22 added prepare(), parallel build, moved '-lX11' to ./configure
# Maintainer: 	kaptoxic (kaptoxic at yahoo dot com)
# Contributor: Frank Ickstadt (frank dot ickstadt at gmail dot com)
# adpoted from Caved since pkgver=0.4.0-pre1

pkgname=photoprint
arch=(i686 x86_64)
pkgver=0.4.2rc2
pkgrel=8
license=('GPL')
pkgdesc="A gtk-utility designed to assist printing of digital photographs with PDF-preview, adjustable page size, multiple images per page and optional border styles."
url="http://www.blackfiveimaging.co.uk/index.php?article=02Software%2F01PhotoPrint"
depends=('gtk2' 'gutenprint' 'lcms' 'netpbm' 'libjpeg' 'libtiff' 'hicolor-icon-theme' 'desktop-file-utils')
makedepends=('gutenprint' 'cups')
backup=()
install=${pkgname}.install
source=(http://www.blackfiveimaging.co.uk/photoprint/photoprint-0.4.2-pre2.tar.gz)
md5sums=('fbd33857d37081846df43cb52a9db3a8')

prepare() {
  local __BUILD_DIR="${srcdir}/photoprint-0.4.2-pre2"
  # old include style
  sed -i 's|^#include <glib/[^>]*>|#include <glib.h>|' \
    "${__BUILD_DIR}/gp_cppsupport/gprintersettings.cpp" \
    "${__BUILD_DIR}/gp_cppsupport/gprinter.cpp"         \
    "${__BUILD_DIR}/pixbufthumbnail/egg-pixbuf-thumbnail.c"
  # netpbm-typedef collides with std::tuple
  for __file in "${__BUILD_DIR}"/imagesource/*.{h,cpp}; do
    sed -i \
      -e 's|^\(using namespace std;\)|// \1|' \
      -e 's|<<[[:blank:]]*\(endl[[:blank:];]*\)|<< std::\1|g' \
      -e 's|^[^#]\([[:blank:]]\)*\([io]*fstream[[:blank:]]\)|\1std::\2|g' \
      -e 's#\([[:blank:]|&~^,()=+-]\)\(ios::\)#\1std::\2#g' \
      "$__file"
  done 
  sed -i '116s|false|NULL|' "${__BUILD_DIR}/effects/ppeffect.cpp"
  # limit use of 'g_type_init()' to GLIB<2.35 (deprecated use)
  sed -i 's/^\([[:blank:]]*g_type_init();[[:blank:]]*\)$/#if !GLIB_CHECK_VERSION(2,35,0)\n\1\n#endif/' "${__BUILD_DIR}/photoprint.cpp"
}

build() {
  # usually #CPUs/Cores/HTs+1 is a good value for parallel build jobs
  local __PARALLEL_JOBS=$((`grep -c '^processor' /proc/cpuinfo`+1))
  cd "${srcdir}/photoprint-0.4.2-pre2"
  ./configure --prefix=/usr LIBS=-lX11 && make -j"$__PARALLEL_JOBS" || return 1
}

package() {
  cd "${srcdir}/photoprint-0.4.2-pre2"
  make DESTDIR="${pkgdir}" install
}
