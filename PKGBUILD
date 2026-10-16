# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=jdatestamp
pkgver=1.2
pkgrel=3
pkgdesc='losslessly imprint date/time of a picture into its JPEG image'
arch=(x86_64)
url="https://sourceforge.net/projects/jdatestamp/"
license=(LicenseRef-custom)
depends=(freetype2 libjpeg9 glibc ttf-dejavu)
source=("${pkgname}-${pkgver}-src.tar.gz::https://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver}/${pkgname}-${pkgver}-src.tar.gz"
        jpegtran_binary.patch)
md5sums=('eaf9075f17780c6ef50f40e0865b28d1'
         'e0036c42274bf6fd265fec8debd04803')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}-src"
  patch -p2 -i "${srcdir}/jpegtran_binary.patch"
  # fixes for modern gcc (implicit int, missing ctype.h, format-security)
  sed -i 's/^const FILE_PATHS_BLOCK/const int FILE_PATHS_BLOCK/' jdatestamp.c
  sed -i '0,/^#include <stdio.h>/s//#include <stdio.h>\n#include <ctype.h>/' jdatestamp.c
  sed -i 's/fprintf(op, msg);/fputs(msg, op);/' jdstmputil.c
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}-src"
  # build against libjpeg9 (headers in /usr/include/libjpeg9, only libjpeg.so.9 is shipped)
  make \
    COMPILE='$(CC) $(CFLAGS) -c $*.c -o $*.o -I/usr/include/libjpeg9 -I/usr/include/freetype2' \
    STATICLIBS='-l:libjpeg.so.9 -lfreetype' \
    DYNAMICLIBS='-lm' \
    CC="gcc ${LDFLAGS}"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}-src"
  # binary finds its data files (colors.txt, jdstmprc.txt) next to itself, symlinks are resolved
  install -Dm755 jdatestamp "${pkgdir}/usr/lib/jdatestamp/jdatestamp"
  install -Dm644 -t "${pkgdir}/usr/lib/jdatestamp" installFiles/*.txt
  # default font is picked from the same directory (upstream binary shipped VeraBI.ttf)
  ln -s /usr/share/fonts/TTF/DejaVuSans-BoldOblique.ttf "${pkgdir}/usr/lib/jdatestamp/DejaVuSans-BoldOblique.ttf"
  install -Dm644 -t "${pkgdir}/usr/share/doc/jdatestamp" installFiles/docs/*
  install -dm755 "${pkgdir}/usr/bin"
  ln -s /usr/lib/jdatestamp/jdatestamp "${pkgdir}/usr/bin/jdatestamp"
  # license statement is only part of index.html
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  sed -n '/<H2>License<\/H2>/,/used by the binaries/p' installFiles/docs/index.html \
    | sed 's/<[^>]*>//g' > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
