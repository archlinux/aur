# Contributor: Ali H. Caliskan <ali.h.caliskan AT gmail DOT com>
# Contributor: sergeantspoon <sergeantspoon@archlinux.us>
# Contributor: Speedboy <theknight696.linux AT gmail DOT com>
# Contributor: Fabian Zimmermann / fabian-zimmermann.net
# Maintainer:  Gimmeapill <gimmeapill at gmail DOT com>

pkgname=hdjmod
pkgver=1.28
pkgrel=12
pkgdesc="Hercules DJ kernel module"
arch=('i686' 'x86_64')
url="http://ts.hercules.com/eng/"
license=('GPL2')
depends=('linux>=3.16')
makedepends=('rpmextract' 'linux-headers')
optdepends=('hdjcpl: Control Panel for the Hercules DJ series hardware settings')
install=hdjmod.install

source=('ftp://ftp.hercules.com/pub/webupdate/DJCSeries/Hercules_DJSeries_Linux.tgz'
	'hdjmod.diff'
	'kernel_2.6.31_fix.patch'
	'kernel_2.6.35_fix.diff'
	'dj_console_mp3_e2.patch'
	'kernel_2.6.37_fix.patch'
	'kernel_2.6.39_fix.patch'
	'kernel_3.6_fix.patch'
	'kernel_3.7_fix.patch'
	'kernel_3.16_fix.patch')
	   
md5sums=('498cf0ff144f20106718932ab22571ce'
         '464f8a8eda9d4c2ec83cf1c43e5dbee3'
         '405a57365935fa003514ac2370325de1'
         '359c33f8e21a7ce5425d5409919f8252'
         'f9e6f12c5f59c7bdb44d813cd42c9b27'
         '132528f078a26775ca8c7c4c3ebfe748'
         '9cc3e1cb4c7877ebf09e389e67b19182'
         '8bf580fcfe06f48ce8247272b55633ce'
         'f40801f32abc47088a54c8893aa27e75'
         '03b1ec1382d9d79a78cc79525cae06e4')

build() {
	# Obtain source files
	cd $srcdir/kernel\ module
	/usr/bin/rpmextract.sh hdjmod-dkms-$pkgver-1.noarch.rpm
	
	# Delete the old source folder	
	rm -rf $srcdir/$pkgname-$pkgver
	
	# Move the source
	mv usr/src/$pkgname-$pkgver $srcdir
	cd $srcdir/$pkgname-$pkgver
	
	# First patch makes installing easier
	patch -p0 < $srcdir/hdjmod.diff

	# Second patch fixes APIs that were changed in kernel >= 2.6.31
	patch -p0 < $srcdir/kernel_2.6.31_fix.patch

	# Third patch fixes Build errors with a kernel >= 2.6.35 
	patch -p0 < $srcdir/kernel_2.6.35_fix.diff
	
	# Fix the path to the linux headers in bulk.h (this was hardcoded by kernel_2.6.35_fix.diff)
	sed -i s/2.6.35-ARCH/$(uname -r)/ bulk.h
	
	# Fourth patch adds supports for the DJ Console MP3 e2
	patch -p0 < $srcdir/dj_console_mp3_e2.patch
	
	# Fifth patch fixes build errors with kernel 2.6.37
	patch -p0 < $srcdir/kernel_2.6.37_fix.patch
	
	# Sixth patch fixes build errors with kernel 2.6.39 (from OpenSUSE Factory)
	patch -p0 < $srcdir/kernel_2.6.39_fix.patch
	
	# Seventh patch fixes build errors with kernel 3.6.x (from OpenSUSE Factory)
	patch -p0 < $srcdir/kernel_3.6_fix.patch
	
	# Eighth patch fixes build errors with kernel 3.7.x (from OpenSUSE Factory)
	patch -p0 < $srcdir/kernel_3.7_fix.patch
	
	# Ninth patch fixes build errors with kernel 3.16.x (by Fabian Zimmermann / fabian-zimmermann.net)
	patch -p0 < $srcdir/kernel_3.16_fix.patch
	
	# Fix again the path to slab.h in bulk.h
	sed -i s@/usr/src/linux-$(uname -r)/include/linux/slab.h@/usr/lib/modules/$(uname -r)/build/include/linux/slab.h@ bulk.h
	
	# Patches 5->8 by Matthias Bach <marix@marix.org>
	# http://download.opensuse.org/repositories/hardware/openSUSE_Factory/src/
		
	# Compile...
	make	
}

package() {
	cd $srcdir/$pkgname-$pkgver
#	make DESTDIR="$pkgdir/" install
	make DESTDIR="$pkgdir/usr/" install
}
