# Contributor: Olivier Mehani <olivier.mehani@inria.fr>
# $Id$

_archivename=glibc
_target=mipsel-linux
_linuxversion=2.4.27
pkgname=$_target-${_archivename}
pkgver=2.3.3
pkgrel=1
pkgdesc="mipsel-linux GNU C Library"
url="http://www.gnu.org/software/$_archivename/"
makedepends=($_target-binutils $_target-gcc3 kernel26)
source=(ftp://ftp.gnu.org/gnu/$_archivename/$_archivename-$pkgver.tar.bz2
ftp://ftp.gnu.org/gnu/$_archivename/$_archivename-linuxthreads-$pkgver.tar.bz2
ftp://ftp.kernel.org/pub/linux/kernel/v2.4/linux-$_linuxversion.tar.bz2
glibc-2.3.3-mips.diff)
md5sums=('e825807b98042f807799ccc9dd96d31b'
'8149ea62922e75bd692bc3b92e5e766b'
'59a2e6fde1d110e2ffa20351ac8b4d9e'
'69c0bd2f573f94bc645f57f42387b8dd')

build() {
 	cd $startdir/src/linux-$_linuxversion
	# FIXME: should be automatic...
	make ARCH=mips menuconfig

 	cd $startdir/src/$_archivename-$pkgver 
 	# FIXME: not the cleanest way to proceed... 
 	#rm -rf nptl 
	mv ../linuxthreads .
	mv ../linuxthreads_db .

	# MIPS patch, see http://www.linux-mips.org/archives/linux-mips/2004-10/msg00068.html
	patch -Np1 < $startdir/glibc-2.3.3-mips.diff

	mkdir -p $startdir/src/$_archivename-build
	cd $startdir/src/$_archivename-build
	#export CFLAGS="-march=${_target/-*/} -O2"
	export CFLAGS="-O2"
	#$startdir/src/$_archivename-$pkgver/configure \
	$startdir/src/$_archivename-$pkgver/configure --build=${CHOST} \
		--host=$_target --prefix=/usr \
		--with-headers=$startdir/src/linux-$_linuxversion/include \
		--enable-add-ons=linuxthreads --disable-shared || return 1
	make || return 2
	#make install_root=/usr/$_target install || return 3
	make install_root=$startdir/pkg/usr/$_target install || return 3
}
