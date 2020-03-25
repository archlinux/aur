# Maintainer: doragasu <doragasu (yawn) hotmail (roll) com>

pkgname=gbcflsh
pkgver=1.1
pkgrel=4
pkgdesc="GameBoy Cart Flasher"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/gbcf"
license=('GPL')
groups=()
depends=('qt5-base' 'qt5-tools' 'libftdi' 'libftdi-compat')
provides=('gbcflsh')
conflicts=('gbcflsh')
install="$pkgname.install"
source=(http://downloads.sourceforge.net/gbcf/${pkgname}_${pkgver}_src.tar.gz
        gbcflsh.desktop
	config.patch
	ultraspeed.patch
	error_t.patch
	qt5.patch)
md5sums=('a2c6c1e0a9e4c4ba64631e0f66989dfc'
         'd6c39e134228d827d26db6d72fd65e85'
         'f4674e2030d797d1ec8a9d5603a8e97c'
         '0fdff2428687a4e9f0eb774a6fbfde4f'
         '27fc93a9f40bbdb0d242c69f6c00aa23'
         '80a6b3270c2420490890517a41e7c7ab')

build() {
	# Patch to install config files in /usr/share/gbcf instead of ~/config
	patch -p0 < config.patch
	# Patch to fix build errors and add -ultraspeed (for 1.5 Mbps).
	patch -p0 < ultraspeed.patch
	# Patch to rename error_t already defined in errno.h
	patch -p0 < error_t.patch
	# Qt5 compatibility patch
	patch -p0 < qt5.patch
	cd "$srcdir/gbcflsh_1.1_src"

	qmake
	make
}

package() {
	# Install files
	cd "$srcdir/gbcflsh_1.1_src"
	INSTALL_ROOT="$pkgdir" make install
	# Copy icon and .desktop file
	mkdir -p "$pkgdir/usr/share/pixmaps"
	cp src/icon.xpm "$pkgdir/usr/share/pixmaps/gbcflsh.xpm"
	mkdir -p "$pkgdir/usr/share/applications"
	cp "$srcdir/gbcflsh.desktop" "$pkgdir/usr/share/applications/"
} 
