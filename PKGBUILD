# Maintainer: Giovanni Santini "ItachiSan" <giovannisantini93@yahoo.it>

pkgname=yawls-bzr
_pkgname=yawls
pkgver=1.2.2.2.r22
_pkgver=1.2.2 # For avoiding errors with pkgver()
pkgrel=1
pkgdesc="Adjust the brightness level of your display by using the internal/external webcam of your notebook as an ambient light sensor - Bazaar sources"
url="https://launchpad.net/yawls"
arch=('any')
license=("GPL3")
depends=(
	"java-runtime-headless>=7"
	"gettext-java"
	"gtk3"
	"java-gnome"
	"opencv-java"
	"polkit-gnome"
)
makedepends=(
	"java-environment>=7"
	"gettext-java"
	"java-gnome"
	"opencv-java"
	"apache-ant"
	"po4a"
	"gzip"
	# For sources fetching
	"bzr"
)
provides=('yawls')
conflicts=('yawls')

# Sources
# Magic: with ${VAR%PATT} you can remove from PATT the shortest occurrence of PATT starting from the end
# of PATT. In this case, removing the last character ("?": generic character) and setting it as 'x'
source=(
	'bzr+lp:yawls'
	${pkgname}d.service
	)
install="$pkgname.install"
# Got from Launchpad downloads page: https://launchpad.net/yawls/+download
md5sums=('SKIP'
         'ae6497e82edd0e43914ebc72f1975fa0')

# Adding developer's GPG key for more checks
# Dominik Brämer: https://launchpad.net/~thedsweb (see 'OpenPGP keys')
# Useless for Bazaar sources
#validpgpkeys=('F74B9AC531171E84713929BB5291C9C1E5CEA885')

# Build steps

pkgver() {
	cd "$_pkgname"
	echo "$_pkgver.$pkgrel.r$(bzr revno)"
}

prepare() {
	cd "$srcdir/$_pkgname"

	# Fix paths because of ArchLinux packaging
	# Its conventions are different than Ubuntu ones
	sed "s/share\/OpenCV/share\/opencv/g" -i yawls_cli.sh
	sed "s/share\/OpenCV/share\/opencv/g" -i build.xml
	sed "s/java-7-openjdk-\*/default-runtime/" -i yawls_cli.sh
	# Fix also comments, lol
	sed "s/openjdk 7/the default JVM/" -i yawls_cli.sh

	# Using $(arch) instead of $(uname -m)... GOD WHY
	sed "s/\$(arch)/\"\$(uname -m)\"/" -i yawls_cli.sh

	# Prevent errors in refreshing symlink for the OpenCV library
	sed "s/ls \/usr\/share\/opencv\/java/ls -1 \/usr\/share\/opencv\/java\/ \| grep jar/" -i yawls_cli.sh

	# Add the native library to the Java library path
	sed "s/\$OPTIONS/\$OPTIONS -Djava.library.path=\/usr\/share\/opencv\/java/" -i yawls_cli.sh

	# We use systemd on Arch
	sed "s/invoke-rc.d --quiet yawls stop/systemctl stop yawlsd/" -i yawls
	sed "s/invoke-rc.d --quiet yawls start/systemctl start yawlsd/" -i yawls

	# Fix build on OpenCV 3
	sed "s/highgui/videoio/" -i src/com/blogspot/thedsweb/engine/Brightness.java
}

build() {
	cd "$srcdir/$_pkgname"
	# Compile the package...
	ant compile
	# And build the language files
	./build.sh
}

package() {
	cd "$srcdir/$_pkgname"

	# Cron job
	mkdir -p "$pkgdir/etc/cron.d"
	cp "debian/yawls.cron.d" "$pkgdir/etc/cron.d/yawls"

	# Logrotate
	mkdir -p "$pkgdir/etc/logrotate.d"
	cp "yawls" "$pkgdir/etc/logrotate.d/yawls"

	# Common stuff
	mkdir -p "$pkgdir/usr/share/yawls"
	install -Dm644 "yawls.jar" "$pkgdir/usr/share/yawls"
	install -Dm755 "yawls_cli.sh" "$pkgdir/usr/share/yawls"
	install -Dm644 "lbpcascade_frontalface.xml" "$pkgdir/usr/share/yawls"
	install -Dm644 "yawls.properties" "$pkgdir/etc"
	# Common symlinks
	mkdir -p "$pkgdir/usr/bin"
	ln -s "/usr/share/yawls/yawls_cli.sh" "$pkgdir/usr/bin/yawls"
	ln -s "/usr/share/java/opencv.jar" "$pkgdir/usr/share/yawls/opencv.jar"

	# GUI specific stuff (Maybe I'll split packages...?)
	# Destkop file things
	install -Dm755 "yawls_gui.sh" "$pkgdir/usr/share/yawls"
	install -Dm644 "yawls_icon_64x64.png" "$pkgdir/usr/share/yawls"
	mkdir -p "$pkgdir/usr/share/applications"
	install -Dm644 "Yawls.desktop" "$pkgdir/usr/share/applications"
	# Polkit policies
	mkdir -p "$pkgdir/usr/share/polkit-1/actions"
	install -Dm644 "yawls.brightness.control.gui.policy" "$pkgdir/usr/share/polkit-1/actions"

	# Man pages, handled manually
	for page in $(ls man)
	do
		_lang=$(echo $page | cut -d. -f 2 | cut -d. -f 1)
		# Case of generic page
		if [ "$_lang" == "1" ]
		then
			mkdir -p "$pkgdir/usr/share/man/man1/"
			install -Dm644 "man/$page" "$pkgdir/usr/share/man/man1/"
		else
			mkdir -p "$pkgdir/usr/share/man/$_lang/man1/"
			install -Dm644 "man/$page" "$pkgdir/usr/share/man/$_lang/man1/yawls.1"
		fi
	done

	# Hand-written junk
	# systemd service
	mkdir -p "$pkgdir/usr/lib/systemd/system/"
	install -Dm644 "$srcdir/${pkgname}d.service" "$pkgdir/usr/lib/systemd/system/${_pkgname}d.service"
}
