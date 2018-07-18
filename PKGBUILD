# Contributor: solsTiCe d'Hiver <solstice.dhiver@gmail.com>
# Maintainer: Benjamin Auder <benjamin * redua net>
# Maintainer: Beej <beej@beej.us>
# Maintainer: Adrian Petrescu <apetresc@gmail.com>

pkgname=gogui
pkgver=1.4.10
pkgrel=1
pkgdesc="SGF editor, also allow to play against engines"
arch=('any')
url="http://gogui.sourceforge.net"
license=('GPL')
depends=('java-runtime')
makedepends=('apache-ant' 'java-environment' 'docbook-xsl')
source=(https://github.com/lemonsqueeze/gogui/releases/download/v$pkgver/gogui-$pkgver.zip)
install=gogui.install
md5sums=('09ec6c8a66359c9ab255ff7d934056fd')

package() {
	cd $srcdir/gogui-$pkgver
	sed -i '/^update-mime-database/d' install.sh
	sed -i '/^update-desktop-database/d' install.sh

	# create directories expected by install.sh
	mkdir -p $pkgdir/usr/share/icons/hicolor/48x48/apps
	mkdir -p $pkgdir/usr/share/icons/hicolor/48x48/mimetypes
	mkdir -p $pkgdir/usr/share/icons/hicolor/scalable/apps
	mkdir -p $pkgdir/usr/share/applications
	mkdir -p $pkgdir/usr/share/mime/applications
	mkdir -p $pkgdir/usr/share/mime/packages

	./install.sh -p $pkgdir/usr -s $pkgdir/etc

	# make it useable with openjdk6 too (NOT TESTED !)
	sed -i 's|"$JAVA"|java|' $pkgdir/usr/bin/*

	# fix the installation to remove any ref to $pkgdir in files
	grep -l -r $pkgdir $pkgdir|while read i
	do
		sed -i 's|'$pkgdir'||' $i
	done

	#install -d $pkgdir/usr/share/mimelnk/application
}
