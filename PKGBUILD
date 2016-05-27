# Maintainer: Steven Honeyman <stevenhoneyman at gmail com>

pkgname=gimp-light
pkgver=2.8.16
pkgrel=1
pkgdesc="A trimmed down install of the GNU Image Manipulation Program"
arch=('i686' 'x86_64')
url="http://www.gimp.org/"
license=('GPL')
depends=('gtk2' 'babl' 'gegl02' 'libexif' 'libxpm' 'libjpeg' 'libpng')
makedepends=('pkgconfig' 'intltool')
provides=(gimp)
conflicts=('gimp-devel' 'gimp')
options=(strip !docs !libtool !makeflags !staticlibs emptydirs)
source=(http://download.gimp.org/pub/gimp/v${pkgver%.*}/gimp-${pkgver}.tar.bz2
	sessionrc
	)
md5sums=('30e0a1b7c18b0e3415f4ac54567252ac'
         '37996178b9a5854b89db6d518cfd23fc')


build() {
	cd "$srcdir/gimp-$pkgver"
	ALL_LINGUAS="en en_GB" ./configure --prefix=/usr --sysconfdir=/etc \
		--enable-shared --disable-debug --disable-python \
		--disable-gimp-console --without-aa --without-libxpm \
		--without-libmng --without-wmf --without-webkit \
		--without-poppler --without-gvfs --without-lcms \
		--without-alsa --without-libcurl --without-dbus \
		--without-linux-input --without-mac-twain --without-xmc
	make
}

package() {
	cd "$srcdir/gimp-$pkgver"
	make DESTDIR="$pkgdir" install-strip
	sed -i 's/# (theme "Default")/(theme "Small")/' $pkgdir/etc/gimp/2.0/gimprc
	sed -i 's/# (save-document-history yes)/(save-document-history no)/' $pkgdir/etc/gimp/2.0/gimprc
	install -D -m644 $srcdir/sessionrc $pkgdir/etc/gimp/2.0/sessionrc
	rm $pkgdir/usr/bin/gimptool-2.0
	rm $pkgdir/usr/share/locale/en_GB/LC_MESSAGES/gimp20-{python,tips}.mo
	rm -r $pkgdir/usr/include $pkgdir/usr/lib/gimp/2.0/{environ,interpreters,modules} 
	rm -r $pkgdir/usr/share/{aclocal,appdata,gtk-doc,man} 
	rm -r $pkgdir/usr/share/icons/hicolor/256x256 $pkgdir/usr/share/gimp/2.0/tips
	find $pkgdir/usr/share/locale -mindepth 1 -maxdepth 1 ! -name "en_GB" -exec rm -r '{}' \;
}
