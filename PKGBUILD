# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Roman Abreu <romanlx at gmail.com>

set -u
pkgname='canon-pixma-ip1500' # pixmaip1500
_casepkgname=iP1500Linux
pkgver='2.50'
pkgrel='3'
pkgdesc="Canon BJ Printer Driver for Pixma ip1500"
arch=('i686' 'x86_64')
url='https://www.canon.co.uk/support/consumer_products/products/printers/inkjet/pixma_ip_series/pixma_ip1500.aspx' # Software, not drivers
license=('GPL2' 'LGPL2' 'custom')
depends=('cups' 'ghostscript' 'libglade' 'avahi' 'lz4') # 'hplip' 'foomatic'
_libpng='libpng12'
depends_i686=('glibc' 'popt' "${_libpng}" 'xz' 'libjpeg-turbo' 'zlib' 'libtiff')
depends_x86_64=("${depends_i686[@]/#/lib32-}")
makedepends_x86_64=("${_libpng}")
_srcdir='bjfilter-common-2.50'
#source=("http://software.canon-europe.com/files/soft22415/software/${_casepkgname}.tar.gz")
source=("http://gdlp01.c-wss.com/gds/7/0900007177/01/bjfilter-common-2.50-3.src.rpm")
md5sums=('2c702ccf2bea05d3d585325f148a044f')
sha256sums=('925b17953348953546781bb08efd1d48227f97cfe234e749d289496efae3bdb5')

prepare() {
  set -u
  bsdtar -xf 'bjfilter-common-2.50-3.tar.gz'

  cd "${_srcdir}"
  sed -e '# Fix many clib prototype warnings' \
      -e 's:^#include <stdlib.h>$:&\n#include <unistd.h>\n#include <string.h>\n#include <ctype.h>:g' \
      -e '# Set version of libpng' \
      -e 's:^#include <png.h>$:'"#include <${_libpng}/png.h>:g" \
    -i 'bjfilter/src/bjfimage.c'

  # Fix /usr/local/bin
  sed -e 's:/usr/local:/usr:g' -i $(grep --include '*.c' --include '*.h' --include 'Makefile' --include '_*' --include 'configure.in' -larF '/local' .)
  set +u
}

package() {
  set -u
  cd "${_srcdir}"

  set +u; msg2 'Installing ppd and common'; set -u
  install -d "${pkgdir}/usr/share/cups/model"
  cp 'ppd/canonpixmaip1500.ppd' "${pkgdir}/usr/share/cups/model"
  install -Dp '214/libs_bin'/** -t "${pkgdir}/usr/lib"
  install -Dp '214/database'/* -t "${pkgdir}/usr/lib/bjlib"

  set +u; msg2 'Building libs'; set -u
  cd "${srcdir}/${_srcdir}/libs"
  ./autogen.sh --prefix="${pkgdir}/usr"
  make
  make install

  set +u; msg2 'Building bjfilter'; set -u
  cd "${srcdir}/${_srcdir}/bjfilter"
  ./autogen.sh --prefix="${pkgdir}/usr" --program-suffix='pixmaip1500'
  sed -e 's:CFLAGS =.*$:& -Wno-unused-result -m32:g' \
      -e "s:-lpng:-l${_libpng#lib}:g" \
    -i 'src/Makefile'
  make
  make install

  set +u; msg2 'Building pstocanonbj'; set -u
  cd "${srcdir}/${_srcdir}/pstocanonbj"
  install -d "${pkgdir}/usr/lib/cups/filter/"
  ./autogen.sh --prefix="${pkgdir}/usr"
  make
  make install

  cd "${pkgdir}/usr/lib"
  local _l
  for _l in *.so.*; do
    ln -sf "${_l}" "${_l%%.so*}.so"
  done

  cd "${pkgdir}"

  # I can't find this /usr/local to fix it
  install -d "${pkgdir}/usr/local/bin"
  ln -s '/usr/bin/bjfilterpixmaip1500' -t "${pkgdir}/usr/local/bin"

  gzip 'usr/share/cups/model'/*.ppd

  if ! :; then
    depends+=('strace')
    mv 'usr/lib/cups/filter/pstocanonbj'{,.arch}
    install -Dm755 <(cat << EOF
#!/bin/bash
umask 000
set > "/tmp/pstocanonbj.\$\$.env"
echo -n 'strace -o foo -f ' > "/tmp/pstocanonbj.\$\$.cmd"
printf '%s' "\$0.arch" >> "/tmp/pstocanonbj.\$\$.cmd"
printf ' %q' "\$@" >> "/tmp/pstocanonbj.\$\$.cmd"
echo "" >> "/tmp/pstocanonbj.\$\$.cmd"
cat > "/tmp/pstocanonbj.\$\$.prn"
<"/tmp/pstocanonbj.\$\$.prn" \
strace -f -o "/tmp/pstocanonbj.\$\$.strace" '/usr/lib/cups/filter/pstocanonbj.arch' "\$@" 2>"/tmp/pstocanonbj.\$\$.debug" | tee "/tmp/pstocanonbj.\$\$.ufr"
EOF
    ) 'usr/lib/cups/filter/pstocanonbj'
  fi
  set +u
}
set +u
