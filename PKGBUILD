# Maintainer Jens Staal <staal1978@gmail.com>

pkgbase=ow-libzip
pkgver=0.11.2
pkgrel=1
pkgdesc="A C library for reading, creating, and modifying zip archives (watcom-cross)"
url="http://www.nih.at/libzip/index.html"
license=('BSD')
arch=('any')
makedepends=('ow-zlib' 'openwatcom-v2')
options=(!libtool !strip !buildflags staticlibs emptydirs)
source=("http://www.nih.at/libzip/libzip-${pkgver}.tar.gz" "pragma.patch" \
"configure.patch")
md5sums=('c5437df15e4825d40cdc3ec8b9b7516c' '274d5a2a6f678705d5fe70cec79fae30' \
'6fee6dd1f561c7d5e314a81446e2910e')

pkgname=("${pkgbase}" "${pkgbase}-dos" "${pkgbase}-win32" "${pkgbase}-os2")
#temporarily disable 16-bit targets "${pkgbase}-win16"
# TODO: figure out how to make them build/link properly
# netware clib is missing some important symbols
# temporarily disable this target : "${pkgbase}-netware"

for _p in ${pkgname[@]}; do
  eval "package_${_p}() {
    $(declare -f "_package${_p#${pkgbase}}")
    _package${_p#${pkgbase}}
  }"
done

build() {
  cd "${srcdir}/libzip-${pkgver}"
  autoreconf -i
  source /opt/watcom/owsetenv.sh
  export AR=wlib
  export AR_FLAGS="-q -n -t"
  export STRIP=wstrip
  export RANLIB=true
  export OBJDUMP=wdump
  export CC=owcc
  export LD=wlink
  export LDFLAGS=""
  cp lib/zip.h zip.h.install
  patch zip.h.install < $srcdir/pragma.patch
  
  #the linker chokes sometimes so one might have to run
  #makepkg -s a couple of times after each other
  #need to figure out why
  
  msg "build for linux"
  cd "${srcdir}/libzip-${pkgver}"
#  rm -rf linux
  mkdir -p linux
  cd linux
  export CFLAGS="-blinux -O2"
  ../configure --disable-shared
  # zlib.lib should be linked automatically due to pragma
  # in header
  sed 's|LIBS = -lz|LIBS = |g' -i {,lib/,man/,regress/,src/}Makefile
  make 
  
  #disable executable tests on generated binaries
  #configure is extremely stupid and will not go into
  #cross-compilation mode even if --host and --build are given
  #most likely since it detects CC=owcc .
  cd "${srcdir}/libzip-${pkgver}"
  patch configure < $srcdir/configure.patch
  
  msg "build for dos"
  cd "${srcdir}/libzip-${pkgver}"
#  rm -rf dos
  mkdir -p dos/{2,3}86
  export INCLUDE=$WATCOM/h
#  msg2 "16-bit"
#  cd dos/286
#  export CFLAGS="-mcmodel=l -bdos -O2"
#  ../../configure --disable-shared --build=i386-watcom-linux --host=i286-watcom-msdos
#  make 
  msg2 "32-bit"
  cd "${srcdir}/libzip-${pkgver}"/dos/386
  export CFLAGS="-mcmodel=f -bdos4g -O2"
  ../../configure --disable-shared --build=i386-watcom-linux --host=i386-watcom-msdos
  sed 's|LIBS = -lz|LIBS = |g' -i {,lib/,man/,regress/,src/}Makefile
  make
  
#  msg "build for Win16"
#  cd "${srcdir}/libzip-${pkgver}"
#  rm -rf win16
#  mkdir -p win16
#  cd win16
#  export INCLUDE=$WATCOM/h:$WATCOM/h/win 
#  export CFLAGS="-mcmodel=l -mwindows -bwindows -O2"
#  ../configure --disable-shared --build=i386-watcom-linux --host=i286-watcom-msdos
#  make
  
  msg "build for Win32"
  cd "${srcdir}/libzip-${pkgver}"
#  rm -rf win32
  mkdir -p win32
  cd win32
  export INCLUDE=$WATCOM/h:$WATCOM/h/nt
  export CFLAGS="-mcmodel=f -mwindows -bnt_win -O2" 
  ../configure --disable-shared --build=i386-watcom-linux --host=i386-watcom-winnt
  sed 's|LIBS = -lz|LIBS = |g' -i {,lib/,man/,regress/,src/}Makefile
  make
  
  msg "build for OS/2"
  cd "${srcdir}/libzip-${pkgver}"
#  rm -rf os2
  mkdir -p os2/{2,3}86
#  msg2 "16-bit"
#  export INCLUDE=$WATCOM/h:$WATCOM/h/os21x
#  cd os2/286
#  export CFLAGS="-mcmodel=l -bos2 -O2"
#  ../../configure --disable-shared --build=i386-watcom-linux --host=i286-watcom-os2
#  make
  msg2 "32-bit"
  export INCLUDE=$WATCOM/h:$WATCOM/h/os2
  cd os2/386
  export CFLAGS="-mcmodel=f -bos2v2 -O2" 
  ../../configure --disable-shared --build=i386-watcom-linux --host=i386-watcom-os2
  sed 's|LIBS = -lz|LIBS = |g' -i {,lib/,man/,regress/,src/}Makefile
  make
  
#  msg "build for Netware"
#  cd "${srcdir}/libzip-${pkgver}"
#  rm -rf netware
#  mkdir -p netware
#  cd netware
#  export INCLUDE=$WATCOM/h:$WATCOM/novh
#  export LIBPATH=$WATCOM/lib386/netware:$WATCOM/nlm:$LIBPATH
#  export CFLAGS="-mcmodel=f -bnetware -O2" 
#  ../configure --disable-shared --build=i386-watcom-linux --host=i386-watcom-netware
#  sed 's|LIBS = -lz|LIBS = |g' -i {,lib/,man/,regress/,src/}Makefile
#  make
}

_package() {
  pkgdesc="A C library for reading, creating, and modifying zip archives (Watcom-linux)"
  groups=('watcom-linux')
  depends=('open_watcom-zlib' 'open_watcom-v2')
  cd "${srcdir}/libzip-${pkgver}"/linux
  mkdir -p ${pkgdir}${WATCOM}/{lib386/linux,lh,binl}
  cp lib/.libs/libzip.a ${pkgdir}${WATCOM}/lib386/linux/libzip.lib
  cp lib/zipconf.h ${pkgdir}${WATCOM}/lh/
  cp ../zip.h.install ${pkgdir}${WATCOM}/lh/zip.h
  for i in {zipcmp,zipmerge,ziptorrent}; do
  cp src/$i ${pkgdir}${WATCOM}/binl/
  done
  mkdir -p ${pkgdir}${WATCOM}/usr/share/licenses/watcom/Linux/libzip
  cp "${srcdir}/libzip-${pkgver}"/LICENSE ${pkgdir}${WATCOM}/usr/share/licenses/watcom/Linux/libzip/
}

_package-dos() {
  pkgdesc="A C library for reading, creating, and modifying zip archives (Watcom-dos)"
  groups=('watcom-dos')
  depends=('open_watcom-zlib-dos' 'open_watcom-v2')
  cd "${srcdir}/libzip-${pkgver}"/dos
  mkdir -p ${pkgdir}${WATCOM}/{lib{2,3}86/dos,h}
#  cp 286/lib/.libs/libzip.a ${pkgdir}${WATCOM}/lib286/dos/libzip.lib
  cp 386/lib/.libs/libzip.a ${pkgdir}${WATCOM}/lib386/dos/libzip.lib
  cp 386/lib/zipconf.h ${pkgdir}${WATCOM}/h/
  cp ../zip.h.install ${pkgdir}${WATCOM}/h/zip.h
  mkdir -p ${pkgdir}${WATCOM}/usr/share/licenses/watcom/DOS/libzip
  cp "${srcdir}/libzip-${pkgver}"/LICENSE ${pkgdir}${WATCOM}/usr/share/licenses/watcom/DOS/libzip/
}

#_package-win16() {
#  pkgdesc="A C library for reading, creating, and modifying zip archives (Watcom-win16)"
#  groups=('watcom-win16')
#  depends=('open_watcom-zlib-win16' 'open_watcom-v2')
#  cd "${srcdir}/${_pkgname}-${pkgver}"/win16
#  mkdir -p ${pkgdir}${WATCOM}/{lib286/win,h/win}
#  cp lib/.libs/libzip.a ${pkgdir}${WATCOM}/lib286/win/libzip.lib
#  cp zconf.h ${pkgdir}${WATCOM}/h/win/
#  cp ../zip.h.install ${pkgdir}${WATCOM}/h/win/zip.h
#}

_package-win32() {
  pkgdesc="A C library for reading, creating, and modifying zip archives (Watcom-win32)"
  groups=('watcom-win32')
  depends=('open_watcom-zlib-win32' 'open_watcom-v2')
  cd "${srcdir}/libzip-${pkgver}"/win32
  mkdir -p ${pkgdir}${WATCOM}/{lib386/nt,h/nt}
  cp lib/.libs/libzip.a ${pkgdir}${WATCOM}/lib386/nt/libzip.lib
  cp lib/zipconf.h ${pkgdir}${WATCOM}/h/nt/
  cp ../zip.h.install ${pkgdir}${WATCOM}/h/nt/zip.h
  mkdir -p ${pkgdir}${WATCOM}/usr/share/licenses/watcom/Win32/libzip
  cp "${srcdir}/libzip-${pkgver}"/LICENSE ${pkgdir}${WATCOM}/usr/share/licenses/watcom/Win32/libzip/
}

_package-os2() {
  pkgdesc="A C library for reading, creating, and modifying zip archives (Watcom-os2)"
  groups=('watcom-os2')
  depends=('open_watcom-zlib-os2' 'open_watcom-v2')
  cd "${srcdir}/libzip-${pkgver}"/os2
  mkdir -p ${pkgdir}${WATCOM}/{lib{2,3}86/os2,h/os2{,1x}}
#  cp 286/lib/.libs/libzip.a ${pkgdir}${WATCOM}/lib286/os2/libzip.lib
  cp 386/lib/.libs/zip.a ${pkgdir}${WATCOM}/lib386/os2/libzip.lib
#  cp 286/zconf.h ${pkgdir}${WATCOM}/h/os21x/
  cp 386/lib/zipconf.h ${pkgdir}${WATCOM}/h/os2/
  cp ../zip.h.install ${pkgdir}${WATCOM}/h/os2/zip.h
  mkdir -p ${pkgdir}${WATCOM}/usr/share/licenses/watcom/OS2/libzip
  cp "${srcdir}/libzip-${pkgver}"/LICENSE ${pkgdir}${WATCOM}/usr/share/licenses/watcom/OS2/libzip/
}

#_package-netware() {
#  pkgdesc="A C library for reading, creating, and modifying zip archives (Watcom-netware)"
#  groups=('watcom-netware')
#  depends=('open_watcom_netware_ndk' 'open_watcom-zlib-netware' 'open_watcom-v2')
#  cd "${srcdir}/${_pkgname}-${pkgver}"/netware
#  mkdir -p ${pkgdir}${WATCOM}/{lib386/netware,novh}
#  cp lib/.libs/libzip.a ${pkgdir}${WATCOM}/lib386/netware/libzip.lib
#  cp zconf.h ${pkgdir}${WATCOM}/novh
#  cp ../zip.h.install ${pkgdir}${WATCOM}/novh/zip.h
#  mkdir -p ${pkgdir}${WATCOM}/usr/share/licenses/watcom/Netware/libzip
#  cp "${srcdir}/libzip-${pkgver}"/LICENSE ${pkgdir}${WATCOM}/usr/share/licenses/watcom/Netware/libzip/
#}