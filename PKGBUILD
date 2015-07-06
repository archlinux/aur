# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: Gordon JC Pearce <aur@gjcp.net>
# Original Contributor: Bob Finch <w9ya@arrl.net>

pkgname=gmfsk
pkgver=0.7pre1
pkgrel=3
pkgdesc="Ham Radio multi-mode digital communications package."
arch=('i686' 'x86_64')
url="http://gmfsk.connect.fi/"
license=('GPL')
depends=('fftw2' 'libgnomeui' 'desktop-file-utils' 'alsa-oss')
# ** Note: this is an oss-based app, see:
#	man aoss (in the alsa-oss package) AND
#	arch-wiki/alsa about using oss & loading drivers
#	** critical (needed/loaded) driver is "snd-pcm-oss" **
makedepends=('gnome-doc-utils>=0.11.2' 'imagemagick')
install=$pkgname.install
source=(http://gmfsk.connect.fi/$pkgname-$pkgver.tar.gz
	gmfsk.patch
	$pkgname.desktop
)

prepare() {
	cd $srcdir/$pkgname-$pkgver

	patch -p1 < $srcdir/gmfsk.patch
	convert pixmaps/tune.xpm $pkgname.png
}

build() {
	cd $srcdir/$pkgname-$pkgver

	./configure --prefix=/usr --sysconfdir=/etc --disable-schemas-install
	make
}

package() {
	cd $srcdir/$pkgname-$pkgver

	make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install

	install -dm755 $pkgdir/usr/share/gconf/schemas
	gconf-merge-schema $pkgdir/usr/share/gconf/schemas/${pkgname}.schemas --domain gmfsk \
		$pkgdir/etc/gconf/schemas/*.schemas

	rm -rf $pkgdir/etc
	rm -rf $pkgdir/usr/share/omf

	install -Dm644 ../$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
	install -Dm644 $pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
}
md5sums=('62bf63530f67eff2b757e7e46507a275'
         '6b94a17094f2a7d7344b2ab11f1192a9'
         '3f5850161cf523e21aafa00d264f6ad6')
sha256sums=('bf4ef74f5f540eb41f265497e84c787ee4070e6e5728fcbfdb6ff4802fe979b1'
            '25124c748335e09d95cc6f20822e29d6c73068c78ccda334ef73a926cfdf2275'
            '93b500ab79b92c97d96bd282023439acb2405463aa7ed05921cf6e2f1d0c9072')
