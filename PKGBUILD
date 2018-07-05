# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Eric Le Bras <eric.lebras@gmail.com>

set -u
pkgname='cnijfilter-ip1800series'
pkgver='2.70'
pkgrel='1'
pkgdesc='Canon IJ Printer Driver for Pixma IP1800 series multifunction'
arch=('i686' 'x86_64')
url='https://www.canon-europe.com/support/consumer_products/products/printers/inkjet/pixma_ip_series/pixma_ip1800.aspx'
license=('GPL2' 'LGPL2' 'custom')
depends=('cups' 'ghostscript' 'cnijfilter-common' 'libglade') # 'cnijfilter-common270'
_libpng='libpng12'
depends_i686=('glibc' 'popt' "${_libpng}" 'xz' 'libjpeg-turbo' 'zlib' 'libtiff' 'gtk' 'libxml')
depends_x86_64=("${depends_i686[@]/#/lib32-}")
makedepends_x86_64=("${_libpng}" 'gtk')
conflicts=('cnijfilter-ip1800-bin')
_srcdir="cnijfilter-common-${pkgver}"
source=(
  "http://gdlp01.c-wss.com/gds/5/0900007185/02/cnijfilter-common-${pkgver}-2.src.rpm"
  'cngpijmonip1800.desktop'
  'printuiip1800.desktop'
)
md5sums=('478aa71f6f4c81ef788d2136152af4c3'
         '0531790082c6e0dda3f9eaf8263ba402'
         '69be069048ce3e9013b6197114dd370f')
sha256sums=('0f9cc935050517890c0cda692d7085940bed32a118888c0e1920ecb73f49f5fa'
            '62fa901785a0648965e80edc49d0816eb5d35b1cbdf9a5148a7cf6f3d8da70bc'
            '75db0810e64f99666b86ee9e569d400cc729403a9ff44de7d6e01addb0c7b87e')

prepare() {
  set -u
  bsdtar -xvf "cnijfilter-common-${pkgver}-2.src.rpm"
  bsdtar -xf "cnijfilter-common-${pkgver}-2.tar.gz"

  cd "${_srcdir}"
  #find -type 'f' '(' -name '*.c' -o -name '*.h' -o -name '*.conf' ')' -exec chmod 644 '{}' '+'
  find -type 'f' -exec chmod 644 '{}' '+'
  find -type 'f' '(' -name 'configure' -o -name '*.sh' -o -name '*.so*' ')' -exec chmod 755 '{}' '+'

  sed -e '# Fix many clib prototype warnings' \
      -e 's:^#include <stdlib.h>$:&\n#include <unistd.h>\n#include <string.h>\n#include <ctype.h>:g' \
      -e '# Set version of libpng' \
      -e 's:^#include <png.h>$:'"#include <${_libpng}/png.h>:g" \
    -i 'cnijfilter/src/bjfimage.c'
  sed -e '# Fix many clib prototype warnings' \
      -e 's:^#include <stdlib.h>$:&\n#include <ctype.h>:g' \
    -i 'cnijfilter/src'/{bjfilter.c,bjfoption.c}
  # Fix internal prototype warnings
  sed -n -e '\:^/\* function prototypes \*/:,/^static/ p' 'cnijfilter/src/bjfpos.c' | grep -Fe $'SetExtLevel\nbjf_margin_init' > 'bjfilter.c.Arch'
  #cp 'cnijfilter/src/bjfilter.c'{,.Arch}
  sed -e '\:^/\* function prototypes \*/: r bjfilter.c.Arch' -i 'cnijfilter/src/bjfilter.c'
  test -s 'cnijfilter/src/bjfilter.c.Arch' && false
  rm 'bjfilter.c.Arch'

  # Fix cups compile
  sed -e 's:^#include <cups/cups.h>.*$:#define _IPP_PRIVATE_STRUCTURES 1\n&\n#include <cups/ppd.h>:g' -i 'cngpijmon/src/bjcupsmon_cups.c'
  sed -e 's:^#include <cups/cups.h>.*$:#define _IPP_PRIVATE_STRUCTURES 0\n&\n#include <cups/ppd.h>:g' -i 'cngpijmon/backend/cnij_backend_common.c'

  # Fix /usr/local/bin
  sed -e 's:/usr/local:/usr:g' -i $(grep --include '*.c' --include '*.h' --include 'Makefile' --include 'configure.in' -larF '/local' .)
  set +u
}

package() {
  set -u

  set +u; msg2 'Building ppd'; set -u
  cd "${srcdir}/${_srcdir}/ppd"
  ./autogen.sh --prefix='/usr'
  make install DESTDIR="${pkgdir}"

  set +u; msg2 'Building cnijfilter'; set -u
  cd "${srcdir}/${_srcdir}/cnijfilter"
  ./autogen.sh --prefix='/usr' --program-suffix='ip1800' --enable-libpath='/usr/lib/bjlib' --enable-binpath='/usr/bin'
  sed -e 's:CFLAGS =.*$:& -Wno-unused-result -m32:g' \
      -e "s:-lpng:-l${_libpng#lib}:g" \
    -i 'src/Makefile'
  make clean
  make -s
  make install DESTDIR="${pkgdir}"
  #install -d "${pkgdir}/usr/local/bin/"
  #ln -s '/usr/bin/cifip1800' -t "${pkgdir}/usr/local/bin/"

  # These all require GTK1
  set +u; msg2 'Building printui'; set -u
  cd "${srcdir}/${_srcdir}/printui"
  ./autogen.sh --prefix='/usr' --program-suffix='ip1800' --datadir='/usr/share'
  sed -e 's:CFLAGS =.*$:& -Wno-unused-result -m32:g' -i 'src/Makefile'
  make clean
  make
  make install DESTDIR="${pkgdir}"

  set +u; msg2 'Building lgmon'; set -u
  cd "${srcdir}/${_srcdir}/lgmon"
  ./autogen.sh --prefix='/usr' --program-suffix='ip1800' --enable-progpath='/usr/bin'
  sed -e 's:CFLAGS =.*$:& -Wno-unused-result -m32:g' -i 'src/Makefile'
  make clean
  make
  make install DESTDIR="${pkgdir}"

  set +u; msg2 'Building cngpijmon'; set -u
  cd "${srcdir}/${_srcdir}/cngpijmon"
  ./autogen.sh --prefix='/usr' --program-suffix='ip1800'
  sed -e 's:CFLAGS =.*$:& -Wno-unused-result -m32:g' -i 'src/Makefile'
  make clean
  make
  make install DESTDIR="${pkgdir}"

  set +u; msg2 'Adding common'; set -u
  cd "${srcdir}/cnijfilter-common-${pkgver}"
  install -Dpm755 '312/database'/* -t "${pkgdir}/usr/lib/bjlib"
  install -s -m755 '312/libs_bin'/*.so.* -t "${pkgdir}/usr/lib"
  # mv "${pkgdir}/usr/lib" "${pkgdir}/usr/lib32" # hardcoded paths
  install -Dp "LICENSE-cnijfilter-${pkgver}E.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}/"

  install -Dpm644 "${srcdir}/cngpijmonip1800.desktop" "${srcdir}/printuiip1800.desktop" -t "${pkgdir}/usr/share/applications/"

  #rm -r "${pkgdir}/usr/lib/cups/"
  rm "${pkgdir}/usr/share/cups/model"/canonip{3300,4300,2500,90}.ppd
  rm "${pkgdir}/usr/share/cups/model"/canonmp*.ppd
  gzip "${pkgdir}/usr/share/cups/model"/*.ppd
  set +u
}
set +u
