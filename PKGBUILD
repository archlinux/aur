# Maintainer: Mitch Bigelow <ipha00@gmail.com>

pkgname='handbrake-gtk2'
pkgver=0.9.9
pkgrel=2
arch=('i686' 'x86_64')
url="http://handbrake.fr/"
license=('GPL')
pkgdesc="Multithreaded video transcoder"
depends=('bzip2' 'gcc-libs' 'gst-plugins-base' 'libnotify' 'dbus-glib'
		 'fribidi' 'libass' 'lame' 'gtk2' 'fontconfig' 'freetype2' 'libxml2'
		 'libogg' 'libvorbis' 'libtheora' 'libsamplerate' 'libbluray'
		 'libx264' 'libdvdnav' 'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('intltool' 'python2' 'yasm' 'wget')
optdepends=('gst-plugins-good: for video previews'
			'gst-libav: for video previews')

provides=('handbrake-cli' 'handbrake')
conflicts=('handbrake-cli' 'handbrake')

install=$pkgname.install

source=(http://downloads.sourceforge.net/project/handbrake/$pkgver/HandBrake-$pkgver.tar.bz2)
sha256sums=('a71dd774104cda00cfb51a813550351d638253791f2f419d04a66f3158a835b3')

prepare() {
	cd "$srcdir/HandBrake-$pkgver"

	# Force use of gtk2
	sed -i 's/PKG_CHECK_MODULES(Gtk3.*/use_gtk3=no/' gtk/configure.ac

	# Use Python 2
	sed -i 's/python /python2 /' gtk/src/Makefile.am

	# Use more system libs
	# We had ffmpeg here as well but it broke PGS subtitle processing
	# https://forum.handbrake.fr/viewtopic.php?f=13&t=27581
	sed -i \
		-e '/MODULES += contrib\/lame/d' \
		-e '/MODULES += contrib\/libbluray/d' \
		-e '/MODULES += contrib\/libdvdnav/d' \
		-e '/MODULES += contrib\/libdvdread/d' \
		-e '/MODULES += contrib\/x264/d' \
		make/include/main.defs

	# Fix configure.ac to work with automake 1.13
	cd gtk
	sed -i \
		-e 's/AM_CONFIG_HEADER/AC_CONFIG_HEADERS/' \
		-e '/AM_PROG_CC_STDC/d' \
		-e 's/$pkg_gudev"/gmodule-2.0 $pkg_gudev"/' \
		configure.ac

	autoreconf -vi
}

build() {
	cd "$srcdir/HandBrake-$pkgver"

	./configure \
		--prefix=/usr \
		--force \
		--disable-gtk-update-checks
	cd build
	make
}

package() {
	cd "$srcdir/HandBrake-$pkgver/build"

	make DESTDIR="$pkgdir" install
}
