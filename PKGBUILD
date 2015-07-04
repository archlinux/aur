# Maintainer: Graziano Giuliani <graziano.giuliani@gmail.com>
pkgname=libbufr
pkgver=11.0.0
pkgrel=1
pkgdesc="NCEP library to encode or decode BUFR messages"
arch=(i686 x86_64)
url="http://www.nco.ncep.noaa.gov/sib/decoders/BUFRLIB/"
license=('Custom')
options=('staticlibs')
makedepends=(gcc-fortran)
source=('http://www.nco.ncep.noaa.gov/sib/decoders/BUFRLIB/BUFRLIB_v11-0-0.tar'
        'LICENSE')
md5sums=('885d691ab923a140aa23cc4b0b2fb6a7'
         'f9f43492185682b834428d79f718f28e')

build() {
  cd ${srcdir}
  export CC=gcc
  export FC=gfortran
  export BFRCFLAGS="-DDYNAMIC_ALLOCATION -DNFILES=32 \
                    -DMAXCD=250 -DMAXNC=600 -DMXNAF=3"
  export BFRFFLAGS="-DLITTLE_ENDIAN -DNORMAL_BUILD -DDYNAMIC_ALLOCATION"
  export FCFLAGS="${CFLAGS} -fdollar-ok"
  export AR=ar
  export ARFLAGS=-rv
  sed -i bufrlib.PRM -e 's/	/      /g'
  cpp -P -DNORMAL_BUILD -DDYNAMIC_ALLOCATION bufrlib.PRM bufrlib.prm
  for file in *.c
  do
    echo "compiling $file"
    ${CC} ${CFLAGS} ${BFRCFLAGS} -c -DUNDERSCORE $file
  done
  for file in modv* moda*
  do
    echo "compiling $file"
    ${FC} ${FCFLAGS} ${BFRFFLAGS} -c $file
  done
  for file in `ls -1 *.F *.f | grep -v mod[av]`
  do
    echo "compiling $file"
    ${FC} ${FCFLAGS} ${BFRFFLAGS} -c $file
  done
  ${AR} ${ARFLAGS} libncepbufr.a *.o
}

package() {
  cd ${srcdir}
  mkdir -p ${pkgdir}/usr/lib
  mkdir -p ${pkgdir}/usr/include
  mkdir -p ${pkgdir}/usr/share/licenses/libbufr
  install -m 644 libncepbufr.a ${pkgdir}/usr/lib
  install -m 644 bufrlib.h ${pkgdir}/usr/include
  install -m 644 LICENSE ${pkgdir}/usr/share/licenses/libbufr
}

# vim:set ts=2 sw=2 et:
