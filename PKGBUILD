# Maintainer: Jens Staal <staal1978@gmail.com>

pkgbase=ow-zlib
pkgdesc="A compression/decompression Library for Open Watcom (cross-)compilation"
#we do split packages for each target
pkgver=1.2.11
pkgrel=1
arch=('any')
license=('custom:zlib')
depends=(openwatcom-v2)
makedepends=(openwatcom-v2)
url="http://www.zlib.net/"
source=("https://zlib.net/zlib-${pkgver}.tar.gz" "pragma.patch")
options=(!strip !buildflags staticlibs emptydirs)
md5sums=('1c9f62f0778697a09d36121ead88e08e' 'bd548e821655885de7de1099979b6e9d')

pkgname=("${pkgbase}" "${pkgbase}-dos" "${pkgbase}-win16" "${pkgbase}-win32" "${pkgbase}-os2" "${pkgbase}-netware")


for _p in ${pkgname[@]}; do
  eval "package_${_p}() {
    $(declare -f "_package${_p#${pkgbase}}")
    _package${_p#${pkgbase}}
  }"
done

prepare() {
	cd ${srcdir}/zlib-$pkgver
	grep -A 24 '^  Copyright' zlib.h > LICENSE
}

build() {
  cd $srcdir/zlib-${pkgver}
  source /opt/watcom/owsetenv.sh
  #we want to move stuff as early as possible to the right location
  install -dm755 $srcdir/build/$WATCOM/{lib286/{dos,win,os2},lib386/{linux,dos,nt,os2,netware},h/{win,nt,os21x,os2},lh,binl,novh}
  
  sed 's|del|rm|g' -i watcom/*.mak
  sed 's|-ldos32a|-bcl=linux|g' -i watcom/*.mak
  cp test/example.c example.c
  cp test/minigzip.c minigzip.c
  
  msg "build for linux"
  CC=owcc ./configure --prefix=$WATCOM -static
  wmake -f watcom/watcom_f.mak CFLAGS="-zq -mf -3r -fp3 -s -bt=linux -oilrtfm -fr=nul -wx -fo=.obj"
  install -m644 zlib_f.lib $srcdir/build/$WATCOM/lib386/linux/zlib.lib
  install -m755 minigzip.exe $srcdir/build/$WATCOM/binl/minigzip
  wmake -f watcom/watcom_f.mak clean
  install -m644 zconf.h $srcdir/build/$WATCOM/lh/
  rm zconf.h #to make sure that subsequent configures are clean
  make clean
  rm -f *.{o,obj,a,lib,exe}
  
  msg "build for DOS.."
  msg2 "...16-bit"
  export INCLUDE=$WATCOM/h
  C=owcc ./configure --prefix=$WATCOM -static
  wmake -f watcom/watcom_l.mak CFLAGS="-zq -ml -s -bt=dos -oilrtfm -fr=nul -wx -fo=.obj" zlib_l.lib
  install -m644 zlib_l.lib $srcdir/build/$WATCOM/lib286/dos/zlib.lib
  wmake -f watcom/watcom_l.mak clean
  rm -f *.{o,obj,a,lib,exe}

  msg2 "...extended 32-bit"
  export INCLUDE=$WATCOM/h
  wmake -f watcom/watcom_f.mak CFLAGS="-zq -mf -3r -fp3 -s -bt=dos -oilrtfm -fr=nul -wx -fo=.obj" zlib_f.lib
  install -m644 zlib_f.lib $srcdir/build/$WATCOM/lib386/dos/zlib.lib
  wmake -f watcom/watcom_f.mak clean
  install -m644 zconf.h $srcdir/build/$WATCOM/h/
  rm zconf.h #to make sure that subsequent configures are clean
  rm -f *.{o,obj,a,lib,exe}
  
  msg "build for Win16"
  export INCLUDE=$WATCOM/h:$WATCOM/h/win
  C=owcc ./configure --prefix=$WATCOM -static
  wmake -f watcom/watcom_l.mak CFLAGS="-zq -ml -s -bt=windows -oilrtfm -fr=nul -wx -fo=.obj" zlib_l.lib
  install -m644 zlib_l.lib $srcdir/build/$WATCOM/lib286/win/zlib.lib
  wmake -f watcom/watcom_l.mak clean
  install -m644 zconf.h $srcdir/build/$WATCOM/h/win/
  rm zconf.h #to make sure that subsequent configures are clean
  rm -f *.{o,obj,a,lib,exe}
  
  msg "build for Win32"
  export INCLUDE=$WATCOM/h:$WATCOM/h/nt
  C=owcc ./configure --prefix=$WATCOM -static 
  wmake -f watcom/watcom_f.mak CFLAGS="-zq -mf -3r -fp3 -s -bt=nt -oilrtfm -fr=nul -wx -fo=.obj" zlib_f.lib
  install -m644 zlib_f.lib $srcdir/build/$WATCOM/lib386/nt/zlib.lib
  wmake -f watcom/watcom_f.mak clean
  install -m644 zconf.h $srcdir/build/$WATCOM/h/nt/
  rm zconf.h #to make sure that subsequent configures are clean
  rm -f *.{o,obj,a,lib,exe}
  
  msg "build for OS/2"
  msg "... 16-bit"
  export INCLUDE=$WATCOM/h:$WATCOM/h/os21x
  C=owcc ./configure --prefix=$WATCOM -static
  wmake -f watcom/watcom_l.mak CFLAGS="-zq -ml -s -bt=os2 -oilrtfm -fr=nul -wx -fo=.obj" zlib_l.lib
  install -m644 zlib_l.lib $srcdir/build/$WATCOM/lib286/os2/zlib.lib
  wmake -f watcom/watcom_l.mak clean
  install -m644 zconf.h $srcdir/build/$WATCOM/h/os21x/
  rm zconf.h #to make sure that subsequent configures are clean
  rm -f *.{o,obj,a,lib,exe}
  
  msg "...32-bit"
  export INCLUDE=$WATCOM/h:$WATCOM/h/os2
  C=owcc ./configure --prefix=$WATCOM -static 
  wmake -f watcom/watcom_f.mak CFLAGS="-zq -mf -3r -fp3 -s -bt=os2 -oilrtfm -fr=nul -wx -fo=.obj" zlib_f.lib
  install -m644 zlib_f.lib $srcdir/build/$WATCOM/lib386/os2/zlib.lib
  wmake -f watcom/watcom_f.mak clean
  install -m644 zconf.h $srcdir/build/$WATCOM/h/os2/
  rm zconf.h #to make sure that subsequent configures are clean
  rm -f *.{o,obj,a,lib,exe}
  
  msg "build for Netware"
  msg "...32-bit"
  export INCLUDE=$WATCOM/h
  C=owcc ./configure --prefix=$WATCOM -static 
  wmake -f watcom/watcom_f.mak CFLAGS="-zq -mf -3r -fp3 -s -bt=netware -oilrtfm -fr=nul -wx -fo=.obj" zlib_f.lib
  install -m644 zlib_f.lib $srcdir/build/$WATCOM/lib386/netware/zlib.lib
  wmake -f watcom/watcom_f.mak clean
  install -m644 zconf.h $srcdir/build/$WATCOM/novh/
  rm zconf.h #to make sure that subsequent configures are clean
  rm -f *.{o,obj,a,lib,exe}
 }

_package() {
    pkgdesc="A compression/decompression Library (Watcom-linux)"
    groups=('watcom-linux')
    cd $srcdir/zlib-${pkgver}
    _builddir=$srcdir/build/$WATCOM
    install -dm755 "${pkgdir}${WATCOM}/"{lib386/linux,lh,binl}
    install -D -m644 $_builddir/lh/* ${pkgdir}${WATCOM}/lh/
    install -D -m644 $_builddir/lib386/linux/* ${pkgdir}${WATCOM}/lib386/linux/
    install -D -m644 zlib.h ${pkgdir}${WATCOM}/lh/
    install -m755 $_builddir/binl/minigzip ${pkgdir}${WATCOM}/binl/
    patch ${pkgdir}${WATCOM}/lh/zlib.h < $srcdir/pragma.patch
    #include license for each binary package/target
    mkdir -p $pkgdir/usr/share/licenses/watcom/Linux/zlib
    install -m644 LICENSE $pkgdir/usr/share/licenses/watcom/Linux/zlib/
}

_package-dos() {
    pkgdesc="16- and 32-bit compression/decompression Library for DOS (Watcom-dos)"
    groups=('watcom-dos')
    cd $srcdir/zlib-${pkgver}
    _builddir=$srcdir/build/$WATCOM
    install -dm755 "${pkgdir}${WATCOM}/"{lib286/dos,lib386/dos,h}
    install -D -m644 $_builddir/h/*.h ${pkgdir}${WATCOM}/h/
    install -D -m644 $_builddir/lib286/dos/* ${pkgdir}${WATCOM}/lib286/dos/
    install -D -m644 $_builddir/lib386/dos/* ${pkgdir}${WATCOM}/lib386/dos/
    install -D -m644 zlib.h ${pkgdir}${WATCOM}/h/
    patch ${pkgdir}${WATCOM}/h/zlib.h < $srcdir/pragma.patch
    #include license for each binary package/target
    mkdir -p $pkgdir/usr/share/licenses/watcom/DOS/zlib
    install -m644 LICENSE $pkgdir/usr/share/licenses/watcom/DOS/zlib/
    }

_package-win16() {
    pkgdesc="A compression/decompression Library (Watcom-win16)"
    groups=('watcom-win16')
    cd $srcdir/zlib-${pkgver}
    builddir=$srcdir/build/$WATCOM
    install -dm755 "${pkgdir}${WATCOM}/"{lib286/win,h/win}
    install -D -m644 $_builddir/h/win/*.h ${pkgdir}${WATCOM}/h/win/
    install -D -m644 $_builddir/lib286/win/* ${pkgdir}${WATCOM}/lib286/win/
    install -D -m644 zlib.h ${pkgdir}${WATCOM}/h/win/
    patch ${pkgdir}${WATCOM}/h/win/zlib.h < $srcdir/pragma.patch
    #include license for each binary package/target
    mkdir -p $pkgdir/usr/share/licenses/watcom/Win16/zlib
    install -m644 LICENSE $pkgdir/usr/share/licenses/watcom/Win16/zlib/
}


_package-win32() {
    pkgdesc="A compression/decompression Library (Watcom-win32)"
    groups=('watcom-win32')
    cd $srcdir/zlib-${pkgver}
    builddir=$srcdir/build/$WATCOM
    install -dm755 "${pkgdir}${WATCOM}/"{lib386/nt,h/nt}
    install -D -m644 $_builddir/h/nt/*.h ${pkgdir}${WATCOM}/h/nt/
    install -D -m644 $_builddir/lib386/nt/* ${pkgdir}${WATCOM}/lib386/nt/
    install -D -m644 zlib.h ${pkgdir}${WATCOM}/h/nt/
    patch ${pkgdir}${WATCOM}/h/nt/zlib.h < $srcdir/pragma.patch
    #include license for each binary package/target
    mkdir -p $pkgdir/usr/share/licenses/watcom/Win32/zlib
    install -m644 LICENSE $pkgdir/usr/share/licenses/watcom/Win32/zlib/
    }

_package-os2() {
    pkgdesc="16- and 32-bit compression/decompression Library for OS/2 (Watcom-os2)"
    groups=('watcom-os2')
    cd $srcdir/zlib-${pkgver}
    _builddir=$srcdir/build/$WATCOM
    install -dm755 "${pkgdir}${WATCOM}/"{lib286/os2,lib386/os2,h/os21x,h/os2}
    install -D -m644 $_builddir/h/os21x/*.h ${pkgdir}${WATCOM}/h/os21x/
    install -D -m644 $_builddir/h/os2/*.h ${pkgdir}${WATCOM}/h/os2/
    install -D -m644 $_builddir/lib286/os2/* ${pkgdir}${WATCOM}/lib286/os2/
    install -D -m644 $_builddir/lib386/os2/* ${pkgdir}${WATCOM}/lib386/os2/
    install -D -m644 zlib.h ${pkgdir}${WATCOM}/h/os21x/
    install -D -m644 zlib.h ${pkgdir}${WATCOM}/h/os2/
    patch ${pkgdir}${WATCOM}/h/os21x/zlib.h < $srcdir/pragma.patch
    patch ${pkgdir}${WATCOM}/h/os2/zlib.h < $srcdir/pragma.patch
    #include license for each binary package/target
    mkdir -p $pkgdir/usr/share/licenses/watcom/OS2/zlib
    install -m644 LICENSE $pkgdir/usr/share/licenses/watcom/OS2/zlib/
}


_package-netware() {
    pkgdesc="A compression/decompression Library (Watcom-netware)"
    groups=('watcom-netware')
    depends=('open_watcom-v2' 'open_watcom-zlib-dos') #header files shared with dos package
    cd $srcdir/zlib-${pkgver}
    builddir=$srcdir/build/$WATCOM
    install -dm755 ${pkgdir}${WATCOM}/{lib386/netware,novh}
    install -D -m644 $_builddir/lib386/netware/* ${pkgdir}${WATCOM}/lib386/netware/
    install -D -m644 $_builddir/novh/* ${pkgdir}${WATCOM}/novh/
    install -D -m644 zlib.h ${pkgdir}${WATCOM}/novh/
    patch ${pkgdir}${WATCOM}/novh/zlib.h < $srcdir/pragma.patch
    #include license for each binary package/target
    mkdir -p $pkgdir/usr/share/licenses/watcom/Netware/zlib
    install -m644 LICENSE $pkgdir/usr/share/licenses/watcom/Netware/zlib/
    
}




