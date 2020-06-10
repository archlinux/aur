# Maintainer: gm3k4g <thingstuffet@gmail.com>

pkgname=ikemen-go-git
pkgver=0.94.2
pkgrel=1
pkgdesc="Open source fighting games engine written in Go with support for M.U.G.E.N resources."
arch=('any')
url="https://github.com/Windblade-GR01/Ikemen_GO"
license=('custom:MIT')
depends=('go' 'xorg-server' 'mesa' 'libxcursor' 'alsa-lib' 'cairo' 'pango' 'xorg-xrandr' 'libxinerama' 'libxi' 'gtk3' 'sudo')
provides=("${pkgname%}"
		  "ikemen-go-bin")
conflicts=("${pkgname%}"
		   "ikemen-go-bin")
makedepends=('openal119-bin')
source=(
	'ikemen_go::https://github.com/Windblade-GR01/Ikemen_GO/archive/master.zip'
	'resources::https://github.com/Windblade-GR01/Ikemen_GO-Elecbyte-Screenpack/archive/master.zip'
	'ikemen-go.sh'
	)
md5sums=('SKIP'
         'SKIP'
         '7f753ac4bdfe4ee42ee500de123fdef0')

build() {
	# acquire permissions and get required resources
	cd "$srcdir/Ikemen_GO-master/build"
	chmod +x get.sh
	chmod +x build.sh
	./get.sh

	# create the dir for build process to work and compile
	mkdir -p ../script
	./build.sh

	# move linux files in root directory and delete bin folder
	cd "$srcdir/Ikemen_GO-master/bin"
	cp -r * ..
	cd ..	
	
	# copy ELECBYTE resources and delete other copy
	cd "$srcdir/Ikemen_GO-Elecbyte-Screenpack-master"
	cp -rf * "$srcdir/Ikemen_GO-master"
	cd ..
	rm -rf "Ikemen_GO-Elecbyte-Screenpack-master"

	msg "Removing dirs/files that are no longer necessary.."
	sudo rm -rf "$srcdir/Ikemen_GO-master/go"
	rm -rf "$srcdir/Ikemen_GO-master/bin"
	rm -rf "$srcdir/Ikemen_GO-master/build"
	rm -rf "$srcdir/Ikemen_GO-master/windres"
	rm -rf "$srcdir/Ikemen_GO-master/src"
	rm -rf "$srcdir/Ikemen_GO-master/script"
	rm "$srcdir/Ikemen_GO-master/go.mod"
	rm "$srcdir/Ikemen_GO-master/go.sum"
	rm "$srcdir/Ikemen_GO-master/.gitignore"
	rm "$srcdir/Ikemen_GO-master/.gitattributes" 
	rm "$srcdir/Ikemen_GO-master/README.md"
	rm "$srcdir/Ikemen_GO-master/LICENCE.md"
}

package() {

	# package installation: under /opt
	install -d "$pkgdir/opt/$pkgname/"
	cp -a "$srcdir/Ikemen_GO-master/." "$pkgdir/opt/$pkgname"

	#set permissions to current user for the package under /opt
	msg "Setting permissions of ikemen directory to current user and the users group.."
	chown -R $USER:users "$pkgdir/opt/$pkgname/"

	# create dir and put shebang shortcut under /usr/bin
	install -d "$pkgdir/usr/bin"
	install -m755 "$srcdir/ikemen-go.sh" "$pkgdir/usr/bin/ikemen-go"
	chmod a+x "$pkgdir/usr/bin/ikemen-go"
}
