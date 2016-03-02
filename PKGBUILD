# Maintainer: Michael Lass <bevan@bi-co.net>
# Contributor: Tom Billiet <mouse256@gmail.com>
# Contributor: Olivier Duclos <olivier.duclos@gmail.com>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=cnijfilter-mp630
pkgver=3.00
pkgrel=2
pkgdesc="Canon drivers for the MP630 printer/scanner"
arch=('i686' 'x86_64')
url="http://support-asia.canon-asia.com"
license=('custom')
depends=('cups' 'ghostscript')
depends_i686=('popt')
depends_x86_64=('lib32-libcups' 'lib32-popt')
makedepends_x86_64=('gcc-multilib')
conflicts=('ppd-mp620-630' 'cnijfilter-common' 'cnijfilter-mp620')
optdepends=("cups-bjnp: network printing support")
source=(http://gdlp01.c-wss.com/gds/6/0100001606/01/cnijfilter-common-$pkgver-1.tar.gz \
	missing-include.patch
	libpng15.patch
	autoconf.patch
	10-usbprinter-canon-mp630.rules)
sha256sums=('f0cf09c2cbd801e65f0e6388889a4ac6efbc0f832799864314e67f14ff7da56d'
            'a4ed852bad975451d528f5d38ce551ec53ff121926ee493dc6ec0d869f67636a'
            '03ca791dd57d6b64c7e79d0c98b45616ce9f0de4a432481728e1c52dbc96fd94'
            'eeac4dcd17849be75bcc30c879bab365091835c328c209218fa3749b6ab94461'
            'd7e2dd6116e63a0ba3e0b55d3fb920161ec59df3b5e944b0a0b9206221d7841a')
prepare() {
	#patching
	cd $srcdir/cnijfilter-common-$pkgver
	patch -Np2 -i ../missing-include.patch
	patch -Np1 -i ../libpng15.patch
	patch -Np0 -i ../autoconf.patch
}

build() {
	if [ "${CARCH}" = 'x86_64' ]; then
		export CC="gcc -m32"
		export CXX="g++ -m32"
		export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
		LIBDIR="--libdir=/usr/lib32"
	fi

	#building
	cd $srcdir/cnijfilter-common-$pkgver/libs
	./autogen.sh --prefix=/usr $LIBDIR

	cd $srcdir/cnijfilter-common-$pkgver/cngpij
	./autogen.sh --prefix=/usr --enable-progpath=/usr/bin $LIBDIR

	cd $srcdir/cnijfilter-common-$pkgver/pstocanonij
	./autogen.sh --prefix=/usr --enable-progpath=/usr/bin $LIBDIR

	cd $srcdir/cnijfilter-common-$pkgver/backend
	./autogen.sh --prefix=/usr --enable-progpath=/usr/bin $LIBDIR

	cd $srcdir/cnijfilter-common-$pkgver
	make

	cd $srcdir/cnijfilter-common-$pkgver/cnijfilter
	./autogen.sh --prefix=/usr --program-suffix=mp630 $LIBDIR --enable-libpath=/usr/lib/bjlib --enable-binpath=/usr/bin
	make
}

package() {
	cd $srcdir/cnijfilter-common-$pkgver
	make install DESTDIR=$pkgdir

	if [ "${CARCH}" = 'x86_64' ]; then
		mkdir -p $pkgdir/usr/lib/cups/filter
		mv $pkgdir/usr/lib32/cups/filter/pstocanonij $pkgdir/usr/lib/cups/filter/pstocanonij
		rmdir $pkgdir/usr/lib32/cups/filter
		rmdir $pkgdir/usr/lib32/cups/
		rmdir $pkgdir/usr/lib32
	fi

	install -d $pkgdir/usr/lib/bjlib
	install 336/database/* $pkgdir/usr/lib/bjlib
	install 336/libs_bin/*.so.* $pkgdir/usr/lib
	install -D LICENSE-cnijfilter-3.00EN.txt $pkgdir/usr/share/licenses/${pkgname}/license.txt

	cd $srcdir/cnijfilter-common-$pkgver/cnijfilter
	make install DESTDIR=$pkgdir

	install -d $pkgdir/usr/share/cups/model
	install  $srcdir/cnijfilter-common-$pkgver/ppd/canonmp630.ppd $pkgdir/usr/share/cups/model/

	# install udev rules for USB users
	install -d $pkgdir/usr/lib/udev/rules.d/
	install $srcdir/10-usbprinter-canon-mp630.rules $pkgdir/usr/lib/udev/rules.d/
}
