# Contributor: Philipp Schwarz <fi-dschi_archlinux - at - arcor - dot - de>
# Maintainer: SanskritFritz (gmail)

pkgname=areca
pkgver=7.4.9
pkgrel=2
pkgdesc="Personal file backup software supporting compression, encryption and incremental backups."
arch=('i686' 'x86_64')
license=('GPL2')
depends=('java-runtime' 'swt')
makedepends=('apache-ant')
url=('http://www.areca-backup.org')
source=("http://sourceforge.net/projects/areca/files/areca-stable/areca-$pkgver/areca-$pkgver-src.tar.gz"
	"areca.sh"
	"areca_cl.sh"
	"areca_decrypt.sh"
	"areca_dezip.sh"
	"areca.desktop")

build() {
	sed -i 's#/usr/lib/java/swt.jar#/usr/share/java/swt.jar#' build.xml
	JAVA_HOME=/usr/lib/jvm/default CPATH=$CPATH:$JAVA_HOME/include:$JAVA_HOME/include/linux ant -buildfile build.xml

}

package() {
	mkdir -p "$pkgdir/opt/"
	mkdir -p "$pkgdir/usr/bin/"
	cp -r "$srcdir"  "$pkgdir/opt/areca/"

	# copy start scripts to /usr/bin for they then will be in $PATH
	# these contain the full fixed path of /opt/areca/bin/areca_run.sh
	for _script in "areca" "areca_cl" "areca_decrypt" "areca_dezip"
	do
		cp "$startdir/$_script.sh" "$pkgdir/usr/bin/$_script"
		chmod +x "$pkgdir/usr/bin/$_script"
		rm "$pkgdir/opt/areca/$_script.sh"
	done
	rm "$pkgdir/opt/areca/areca.desktop"
	rm "$pkgdir/opt/areca/areca-$pkgver-src.tar.gz"

	# symlink menu icon
	mkdir -p "$pkgdir/usr/share/pixmaps"
	ln -s "/opt/areca/icons/ico_72.png" "$pkgdir/usr/share/pixmaps/areca_72x72.png"

	# copy .desktop file (menu entry)
	install -D "$startdir/areca.desktop" "$pkgdir/usr/share/applications/areca.desktop"
}

# makepkg --geninteg >> PKGBUILD

md5sums=('7788151e36daa015a4f0ad99b7e9e0c0'
         '024e3fe74c518a9dee889f3ea1ff9f71'
         '662d65e44fe0806cff69850dae55f107'
         '8e0088445454ab80a9f04c84b3363814'
         '2f1bd15c94600065c43366f440cc0c37'
         '5e978edc20d715cefec098e3e77a3721')
