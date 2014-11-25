# Contributor: Olivier Mehani <olivier.mehani@inria.fr>

_archivename=glibc
_arch=mips
_host=${_arch}el-linux
_linuxversion=2.4.27
pkgname=$_host-${_archivename}
pkgver=2.3.3
pkgrel=3
pkgdesc="$_host GNU C Library"
url="http://www.gnu.org/software/$_archivename/"
makedepends=($_host-binutils $_host-gcc3 kernel26)
source=(ftp://ftp.gnu.org/gnu/$_archivename/$_archivename-$pkgver.tar.bz2
ftp://ftp.gnu.org/gnu/$_archivename/$_archivename-linuxthreads-$pkgver.tar.bz2
ftp://ftp.kernel.org/pub/linux/kernel/v2.4/linux-$_linuxversion.tar.bz2)
md5sums=('e825807b98042f807799ccc9dd96d31b'
'8149ea62922e75bd692bc3b92e5e766b'
'59a2e6fde1d110e2ffa20351ac8b4d9e')
options=(NOSTRIP)

build() {
	export CARCH=$_arch

 	cd $startdir/src/linux-$_linuxversion
	# FIXME: should not require user interaction
	make ARCH=$CARCH menuconfig

 	cd $startdir/src/$_archivename-$pkgver 
	mv ../linuxthreads .
	mv ../linuxthreads_db .

	mkdir -p $startdir/src/$_archivename-build
	cd $startdir/src/$_archivename-build
	#export CFLAGS="-march=${_host/-*/} -O2"
	export CFLAGS="-O2"
	#$startdir/src/$_archivename-$pkgver/configure \
	$startdir/src/$_archivename-$pkgver/configure --build=`arch`-linux \
		--host=$_host --prefix=/usr/$_host \
		--with-headers=$startdir/src/linux-$_linuxversion/include \
		--enable-add-ons=linuxthreads || return 1
	make || return 2
	#make install_root=/usr/$_host install || return 3
	make install_root=$startdir/pkg install || return 3

	# host arch's binaries are unneeded here as they wouldn't work
	rm -rf $startdir/pkg/usr/$_host/bin $startdir/pkg/usr/$_host/sbin $startdir/pkg/usr/$_host/libexec

	# the locales and other data are also unnecessary
	rm -rf $startdir/pkg/usr/$_host/share
	rm -rf $startdir/pkg/usr/$_host/info

	# copy the needed kernel headers
	cp -R $startdir/src/linux-$_linuxversion/include/linux/ $startdir/pkg/usr/$_host/include/
	cp -R $startdir/src/linux-$_linuxversion/include/asm-$CARCH/ $startdir/pkg/usr/$_host/include/asm
}
