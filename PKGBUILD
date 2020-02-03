# Maintainer: Tomaash

pkgname=pax-britannica
pkgver=20110514
pkgrel=2
pkgdesc="A one-button real-time strategy game for up to 4 players"
arch=('x86_64' 'i686')
url="http://paxbritannica.henk.ca/"
license=("MIT")
if [ `uname -m` == "x86_64" ]; then
	depends=('hicolor-icon-theme' 'lib32-alsa-lib' 'lib32-glu' 
                 'lib32-libxrandr')
else
	depends=('hicolor-icon-theme' 'alsa-lib' 'glu' 'libxrandr')
fi
conflicts=("paxbritannica-git")
source=("https://web.archive.org/web/20160307100356if_/http://paxbritannica.henk.ca/pax-britannica.tar.gz" 
	"https://github.com/henkboom/pax-britannica/raw/master/license.txt")
sha256sums=('24d69328f5e0e97cd40fb8dcbf5996a073a77d40b64b37671973503a2d05fded'
           'ba24a6f776b81571112c77ac37944c7c96e44648bf6ce03d84d8bf085e11af57')

build() {
	cd $srcdir/$pkgname

	# Create pkg.desktop-file
	cat > $srcdir/$pkgname.desktop <<-END 
	[Desktop Entry]
	Name=Pax Britannica
	Icon=pax-britannica
	GenericName=Pax Britannica
	Comment=A one-button real-time strategy game for up to 4 players
	Exec=pax-britannica
	Terminal=false
	Type=Application
	Categories=Game;
	END
}

package() {
	# Create pkgdir folders
	install -d $pkgdir/usr/bin
	install -d $pkgdir/usr/share/licenses/$pkgname
	install -d $pkgdir/usr/share/applications
	install -g games -d $pkgdir/opt/$pkgname

	# Copy game
	cp -a $srcdir/$pkgname/*       $pkgdir/opt/$pkgname
	cat   $srcdir/license.txt    > $pkgdir/usr/share/licenses/$pkgname/license.txt
	cp -a $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/

	# executable link
	ln -s /opt/$pkgname/$pkgname $pkgdir/usr/bin/$pkgname
	
	# Desktop-file icon
	for i in 16x16 22x22 24x24 32x32 36x36 48x48 64x64 72x72 96x96 128x128; do
		mkdir -p $pkgdir/usr/share/icons/hicolor/$i/apps
		cd $pkgdir/usr/share/icons/hicolor/$i/apps
		convert -resize $i $pkgdir/opt/pax-britannica/sprites/factory_p4.png pax-britannica.png
	done
}
