# $Id$
# Maintainer: Jan-Henrik Bruhn <aur@jhbruhn.de>
# Contributor: Brad Fanella <bradfanella@archlinux.us>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
# Contributor: danst0 <danst0@west.de>

_pkgname=avr-binutils
pkgname=$_pkgname-219
pkgver=2.19.1a
pkgrel=1
pkgdesc="A set of programs to assemble and manipulate binary and object files for the avr architecture"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/binutils/"
license=('GPL')
depends=('glibc>=2.12-5' 'zlib')
provides=("binutils-avr=$pkgver" "$_pkgname=$pkgver")
conflicts=("$_pkgname" 'binutils-avr')
options=('!libtool' '!distcc' '!ccache')
source=(http://ftp.gnu.org/gnu/${_pkgname/avr-}/${_pkgname/avr-}-${pkgver}.tar.bz2)
md5sums=('023222f392e9546bcbb0b4c0960729be')

prepare() {
	cd "${srcdir}"/${_pkgname/avr-}-${pkgver/a}

    sed -i 's/int do_wide;/static int do_wide;/g' binutils/readelf.c 
    sed -i 's/int do_wide;/static int do_wide;/g' binutils/dwarf.c 
    sed -i 's/bfd_boolean dwarf2_loc_directive_seen;/extern bfd_boolean dwarf2_loc_directive_seen;/g' gas/dwarf2dbg.h 
    sed -i 's/bfd_boolean dwarf2_loc_mark_labels;/extern bfd_boolean dwarf2_loc_mark_labels;/g' gas/dwarf2dbg.h 
    sed -i 's/\/\* Reads just the header part/histogram *histograms; unsigned num_histograms; \/*/g' gprof/hist.c
    sed -i 's/histogram \*histograms;/extern histogram *histograms;/g' gprof/hist.h 
    sed -i 's/unsigned num_histograms;/extern unsigned num_histograms;/g' gprof/hist.h 

	mkdir build
	cd build

    CFLAGS="$CLFAGS -Wno-error=implicit-fallthrough -Wno-error=unused-value -Wno-error -fcommon"
    CXXFLAGS="$CXXLFAGS -Wno-error=implicit-fallthrough -Wno-error=unused-value -Wno-error -fcommon"
    LDFLAGS="$LDFLAGS -fcommon"
  	CC="gcc -L$(pwd)/bfd/.libs/ -Wno-error"
  	if [ "${CARCH}" = "x86_64" ]; then
    		../configure --build=$(../config.guess) \
                	--disable-multilib \
                 	--disable-nls \
                 	--enable-64-bit-bfd \
                 	--enable-install-libbfd \
                 	--includedir=/usr/$(../config.guess)/include \
                 	--infodir=/usr/share/info \
                 	--libdir=/usr/lib \
                 	--mandir=/usr/share/man \
                 	--prefix=/usr \
                    --disable-werror \
                 	--target=avr
	else
		../configure --build=$(../config.guess) \
                	--disable-nls \
                	--enable-install-libbfd \
                 	--includedir=/usr/$(../config.guess)/include \
                 	--infodir=/usr/share/info \
                 	--libdir=/usr/lib \
                 	--mandir=/usr/share/man \
                 	--prefix=/usr \
                    --disable-werror \
                 	--target=avr
  	fi

  	# This checks the host environment and makes sure all the necessary tools are available to compile Binutils.
  	make configure-host

  	make tooldir=/usr
}

package() {
 	cd "${srcdir}"/${_pkgname/avr-}-${pkgver/a}

	cd build
	make DESTDIR="${pkgdir}" tooldir=/usr install

  	rm -f ${pkgdir}/usr/lib/libiberty.a

  	for bin in addr2line ar as c++filt gprof ld nm objcopy objdump ranlib readelf size strings strip ; do
    		rm -f ${pkgdir}/usr/bin/${bin} || return 1
  	done

  	for info in as bfd binutils configure gprof ld standards; do
    		mv ${pkgdir}/usr/share/info/${info}.info ${pkgdir}/usr/share/info/avr-${info}.info
 	done
}


