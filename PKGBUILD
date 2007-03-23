# Contributor: Olivier Mehani <olivier.mehani@inria.fr>
# $Id$

_archivename=glibc
_target=mipsel-linux
_linuxversion=2.4.27
pkgname=$_target-${_archivename}
pkgver=2.3.3
pkgrel=3
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
options=(NOSTRIP)

build() {
	export CARCH=mips

 	cd $startdir/src/linux-$_linuxversion
	# FIXME: should not require user interaction
	make ARCH=$CARCH menuconfig

 	cd $startdir/src/$_archivename-$pkgver 
	mv ../linuxthreads .
	mv ../linuxthreads_db .

	mkdir -p $startdir/src/$_archivename-build
	cd $startdir/src/$_archivename-build
	#export CFLAGS="-march=${_target/-*/} -O2"
	export CFLAGS="-O2"
	#$startdir/src/$_archivename-$pkgver/configure \
	$startdir/src/$_archivename-$pkgver/configure --build=${CHOST} \
		--host=$_target --prefix=/usr/$_target \
		--with-headers=$startdir/src/linux-$_linuxversion/include \
		--enable-add-ons=linuxthreads || return 1
	make || return 2
	#make install_root=/usr/$_target install || return 3
	make install_root=$startdir/pkg install || return 3

	# target arch's binaries are unneeded here as they wouldn't work
	rm -rf $startdir/pkg/usr/$_target/bin $startdir/pkg/usr/$_target/sbin $startdir/pkg/usr/$_target/libexec

	# the locales and other data are also unnecessary
	rm -rf $startdir/pkg/usr/$_target/share
	rm -rf $startdir/pkg/usr/$_target/info

	# copy the needed kernel headers
	cp -R $startdir/src/linux-$_linuxversion/include/linux/ $startdir/pkg/usr/$_target/include/
	cp -R $startdir/src/linux-$_linuxversion/include/asm-$CARCH/ $startdir/pkg/usr/$_target/include/asm
}
