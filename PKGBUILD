#Maintainer Jens Staal <staal1978@gmail.com>

pkgbase=ow-libbz2
pkgver=1.0.6
pkgrel=2
pkgdesc="A high-quality data compression program (watcom-cross)"
arch=(any)
url="http://www.bzip.org/"
license=("custom")
makedepends=(openwatcom-v2)
depends=(openwatcom-v2)
options=(!strip !buildflags staticlibs)
source=("http://www.bzip.org/${pkgver}/bzip2-${pkgver}.tar.gz" \
	"wmake.patch" "pragma.patch")
sha1sums=('3f89f861209ce81a6bab1fd1998c0ef311712002' \
	  '1166d733e176f9687328bbb47875bea45f922b38' '9a36d53bda3a03c5f27c40f31cca2f100a16ab59')
	  
pkgname=("${pkgbase}" "${pkgbase}-dos" "${pkgbase}-win16" "${pkgbase}-win32" "${pkgbase}-os2" "${pkgbase}-netware")

for _p in ${pkgname[@]}; do
  eval "package_${_p}() {
    $(declare -f "_package${_p#${pkgbase}}")
    _package${_p#${pkgbase}}
  }"
done

prepare() {
	cd "$srcdir/bzip2-$pkgver"
	patch Makefile < "$srcdir/"wmake.patch
}

build() {
	cd $srcdir/bzip2-$pkgver
	unset LDFLAGS
	source /opt/watcom/owsetenv.sh

	msg "build for Linux"
	export CFLAGS="-blinux -O2 -D_FILE_OFFSET_BITS=64"
	sed 's|-lbz2|libbz2.lib|g' -i Makefile
	rm -rf linux
	mkdir -p linux
	make
	mv libbz2.lib linux/
	cp bzlib.h linux/
	mv bzip2 linux/
	mv bzip2recover linux/
	patch linux/bzlib.h < "$srcdir/"pragma.patch
	make clean
	rm -f *.{o,lib}
  
	msg "build for DOS"
	msg2 "16 bit..."
	export INCLUDE=$WATCOM/h
	export CFLAGS="-bdos -O2 -DMSDOS -D_FILE_OFFSET_BITS=64"
	rm -rf dos
	mkdir -p dos/{2,3}86
	make libbz2.lib
	mv libbz2.lib dos/286/
	cp bzlib.h dos/
	patch dos/bzlib.h < "$srcdir/"pragma.patch
	make clean
	rm -f *.{o,lib}
  
	msg2 "32 bit..."
	export CFLAGS="-bdos4g -O2 -DMSDOS -D_FILE_OFFSET_BITS=64"
	make libbz2.lib
	cp libbz2.lib dos/386/
	make clean
	rm -f *.{o,lib}
  
	msg "build for Win16"
	export INCLUDE=$WATCOM/h:$WATCOM/win
	export CFLAGS="-bwin -O2 -D_FILE_OFFSET_BITS=64"
	rm -rf win
	mkdir -p win
	make libbz2.lib
	mv libbz2.lib win/
	cp bzlib.h win/
	patch win/bzlib.h < "$srcdir/"pragma.patch
	make clean
	rm -f *.{o,lib}
  
	msg "build for Win32"
	export INCLUDE=$WATCOM/h:$WATCOM/h/nt
	export CFLAGS="-bnt -O2 -DWIN32 -D_FILE_OFFSET_BITS=64"
	rm -rf nt
	mkdir -p nt
	make libbz2.lib
	mv libbz2.lib nt/
	cp bzlib.h nt/
	patch nt/bzlib.h < "$srcdir/"pragma.patch
	make clean
	rm -f *.{o,lib}
  
	msg "build for OS/2"
	msg2 "16 bit ..."
	export INCLUDE=$WATCOM/h:$WATCOM/os21x
	export CFLAGS="-bos2 -O2 -DOS2 -D_FILE_OFFSET_BITS=64"
	rm -rf os2
	mkdir -p os2/{2,3}86
	make libbz2.lib
	mv libbz2.lib os2/286/
	cp bzlib.h os2/286/
	patch os2/286/bzlib.h < "$srcdir/"pragma.patch
	make clean
	rm -f *.{o,lib}
  
	msg2 "32 bit ..."
  	export INCLUDE=$WATCOM/h:$WATCOM/os2
	export CFLAGS="-bos2v2 -O2 -DOS2 -D_FILE_OFFSET_BITS=64"
	make libbz2.lib
	mv libbz2.lib os2/386/
	cp bzlib.h os2/386/
	patch os2/386/bzlib.h < "$srcdir/"pragma.patch
	make clean
	rm -f *.{o,lib}
  
	msg "build for Netware"
	export INCLUDE=$WATCOM/h
	export CFLAGS="-bnetware -O2 -D_FILE_OFFSET_BITS=64"
	rm -rf netware
	mkdir -p netware
	make libbz2.lib
	mv libbz2.lib netware/
	cp bzlib.h netware/
	patch netware/bzlib.h < "$srcdir/"pragma.patch
	make clean
	rm -f *.{o,lib}  
}

_package() {
    pkgdesc="A high-quality data compression program (Watcom-linux)"
    groups=('watcom-linux')
    mkdir -p ${pkgdir}${WATCOM}/{lib386/linux,lh,binl}
    cd $srcdir/bzip2-$pkgver
    cp linux/libbz2.lib ${pkgdir}${WATCOM}/lib386/linux/
    cp linux/bzlib.h ${pkgdir}${WATCOM}/lh/
    cp linux/bzip2 ${pkgdir}${WATCOM}/binl/
    cp linux/bzip2recover ${pkgdir}${WATCOM}/binl/
    mkdir -p $pkgdir/usr/share/licenses/Linux/bzip2
    cp LICENSE $pkgdir/usr/share/licenses/Linux/bzip2/
}

_package-dos() {
    pkgdesc="A high-quality data compression program (Watcom-dos)"
    groups=('watcom-dos')
    mkdir -p ${pkgdir}${WATCOM}/{lib{2,3}86/dos,h}
    cd $srcdir/bzip2-$pkgver
    cp dos/286/libbz2.lib ${pkgdir}${WATCOM}/lib286/dos/
    cp dos/386/libbz2.lib ${pkgdir}${WATCOM}/lib386/dos/
    cp dos/bzlib.h ${pkgdir}${WATCOM}/h/
    mkdir -p $pkgdir/usr/share/licenses/DOS/bzip2
    cp LICENSE $pkgdir/usr/share/licenses/DOS/bzip2/
    }

_package-win16() {
    pkgdesc="A high-quality data compression program (Watcom-win16)"
    groups=('watcom-win16')
    mkdir -p ${pkgdir}${WATCOM}/{lib286/win,h/win}
    cd $srcdir/bzip2-$pkgver
    cp win/libbz2.lib ${pkgdir}${WATCOM}/lib286/win/
    cp win/bzlib.h ${pkgdir}${WATCOM}/h/win/
    mkdir -p $pkgdir/usr/share/licenses/Win16/bzip2
    cp LICENSE $pkgdir/usr/share/licenses/Win16/bzip2/
}

_package-win32() {
    pkgdesc="A high-quality data compression program (Watcom-win32)"
    groups=('watcom-win32')
    mkdir -p ${pkgdir}${WATCOM}/{lib386/nt,h/nt}
    cd $srcdir/bzip2-$pkgver
    cp nt/libbz2.lib ${pkgdir}${WATCOM}/lib386/nt/
    cp nt/bzlib.h ${pkgdir}${WATCOM}/h/nt/
    mkdir -p $pkgdir/usr/share/licenses/Win32/bzip2
    cp LICENSE $pkgdir/usr/share/licenses/Win32/bzip2/
}

_package-os2() {
    pkgdesc="A high-quality data compression program (Watcom-os2)"
    groups=('watcom-os2')
    mkdir -p ${pkgdir}${WATCOM}/{lib{2,3}86/os2,h/os2{,1x}}
    cd $srcdir/bzip2-$pkgver
    cp os2/286/libbz2.lib ${pkgdir}${WATCOM}/lib286/os2/
    cp os2/386/libbz2.lib ${pkgdir}${WATCOM}/lib386/os2/
    cp os2/286/bzlib.h ${pkgdir}${WATCOM}/h/os21x/
    cp os2/386/bzlib.h ${pkgdir}${WATCOM}/h/os2/
    mkdir -p $pkgdir/usr/share/licenses/OS2/bzip2
    cp LICENSE $pkgdir/usr/share/licenses/OS2/bzip2/
}

_package-netware() {
    pkgdesc="A high-quality data compression program (Watcom-netware)"
    groups=('watcom-netware')
    depends=('open_watcom-v2')
    mkdir -p ${pkgdir}${WATCOM}/{lib386/netware,novh}
    cd $srcdir/bzip2-$pkgver
    cp netware/libbz2.lib ${pkgdir}${WATCOM}/lib386/netware/
    cp netware/bzlib.h ${pkgdir}${WATCOM}/novh/
    mkdir -p $pkgdir/usr/share/licenses/Netware/bzip2
    cp LICENSE $pkgdir/usr/share/licenses/Netware/bzip2/
    
}