# Maintainer: Tom Billiet <mouse256@gmail.com>
# Contributor: Olivier Duclos <olivier.duclos@gmail.com>

pkgname=cnijfilter-mp620
pkgver=3.00
pkgrel=4
pkgdesc="Canon drivers for the MP610/MP620/MP630 printer/scanner with improved PPD files"
arch=('i686' 'x86_64')
url="http://support-asia.canon-asia.com"
license=('custom')
if [ "${CARCH}" = 'x86_64' ]; then
	depends=('lib32-libcups' 'cups' 'lib32-popt' 'ghostscript' 'lib32-libtiff' 'lib32-libpng')
	makedepends=('gcc-multilib')
else
	depends=('cups' 'popt' 'ghostscript')
fi
conflicts=('ppd-mp620-630' 'cnijfilter-common')
optdepends=("cups-bjnp: network printing support")
install=mp620.install
source=(http://gdlp01.c-wss.com/gds/6/0100001606/01/cnijfilter-common-$pkgver-1.tar.gz \
        http://gdlp01.c-wss.com/gds/1/0100000841/01/cnijfilter-common-2.80-1.tar.gz \
	http://downloads.sourceforge.net/mp610linux/ppdMP620-630en-1.5.tar.gz \
	http://downloads.sourceforge.net/mp610linux/ppdMP610en-1.3.tar.gz \
	missing-include.patch
	libpng15.patch
	mp610.patch
	v3.00.patch
	ppd.patch
	autoconf.patch
	10-usbprinter-canon-mp6x0.rules)
md5sums=('b4c3dab3c491fbe3f9dc830dae401a45'
         '1319f320f9f6651b43e43c0b09af5b73'
         '4635702d2bade156030ebf45fec2de18'
	 '98de653a2a2f81533ce8eef1f57b9987'
	 '59572dbb7f445620d1b3ba57f9fe0760'
	 'e75b117cd7a399c0861c4e8e10c30294'
	 '8991363b2699d55cd6378f6206f43f20'
	 'e280bec37a0a2ddc45b33854c36fb8c3'
	 '9faad9f56b3a4482af40aca783e9d4fe'
	 'b26ed3654ff141a0b4a34fd037fd1c57'
	 'ee8957e16e9c146fcfce28837e9c542d')

build() {
	if [ "${CARCH}" = 'x86_64' ]; then
		export CC="gcc -m32"
		export CXX="g++ -m32"
		export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
		LIBDIR="--libdir=/usr/lib32"
	fi

	#patching
	cd $srcdir/cnijfilter-common-$pkgver
	rm -f 327
	ln -s ../cnijfilter-common-2.80/327 327
	patch -Np2 -i ../missing-include.patch
	patch -Np2 -i ../mp610.patch
	patch -Np1 -i ../libpng15.patch
	patch -Np2 -i ../v3.00.patch
	patch -Np0 -i ../autoconf.patch

	cd $srcdir/ppdMP620-630en-1.5
	patch -Np2 -i ../ppd.patch

	#building²
	cd $srcdir/cnijfilter-common-$pkgver/libs
	./autogen.sh --prefix=/usr $LIBDIR || return 1

	cd $srcdir/cnijfilter-common-$pkgver/cngpij
	./autogen.sh --prefix=/usr --enable-progpath=/usr/bin $LIBDIR || return 1

	cd $srcdir/cnijfilter-common-$pkgver/pstocanonij
	./autogen.sh --prefix=/usr --enable-progpath=/usr/bin $LIBDIR || return 1

	cd $srcdir/cnijfilter-common-$pkgver/backend
	./autogen.sh --prefix=/usr --enable-progpath=/usr/bin $LIBDIR || return 1

	cd $srcdir/cnijfilter-common-$pkgver
	make || return 1
 
	cd $srcdir/cnijfilter-common-$pkgver/cnijfilter
	./autogen.sh --prefix=/usr --program-suffix=mp610 $LIBDIR --enable-libpath=/usr/lib/bjlib --enable-binpath=/usr/bin || return 1
	make || return 1
}

package() {
	cd $srcdir/cnijfilter-common-$pkgver
	make install DESTDIR=$pkgdir || return 1

	if [ "${CARCH}" = 'x86_64' ]; then
		#hack
		mkdir -p $pkgdir/usr/lib/cups/filter
		mv $pkgdir/usr/lib32/cups/filter/pstocanonij $pkgdir/usr/lib/cups/filter/pstocanonij
		rmdir $pkgdir/usr/lib32/cups/filter
		rmdir $pkgdir/usr/lib32/cups/
		rmdir $pkgdir/usr/lib32
	fi
	
	install -d $pkgdir/usr/lib/bjlib
	install 327/database/*.tbl $pkgdir/usr/lib/bjlib
	install 327/libs_bin/*.so.* $pkgdir/usr/lib
	install -D LICENSE-cnijfilter-3.00EN.txt $pkgdir/usr/share/licenses/${pkgname}/license.txt
	
	cd $srcdir/cnijfilter-common-$pkgver/cnijfilter
	make install DESTDIR=$pkgdir || return 1
	
	# Now we install the updated PPDs from http://mp610.blogspot.com
	cd $srcdir/ppdMP620-630en-1.5
	install -d $pkgdir/usr/share/cups/model
	install canonmp620-630en.ppd $pkgdir/usr/share/cups/model/
	install cifmp610.conf $pkgdir/usr/lib/bjlib/
	
	# install mp610 ppd, patch the version number
	cat $srcdir/canonmp610en.ppd | sed "s/Canon MP610 series Ver.2.80en/Canon MP610 series Ver.3.00/" > $pkgdir/usr/share/cups/model/canonmp610.ppd

	# install udev rules for USB users
	install -d $pkgdir/etc/udev/rules.d/
	install $srcdir/10-usbprinter-canon-mp6x0.rules $pkgdir/etc/udev/rules.d/
}

