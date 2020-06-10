# Maintainer: gm3k4g <thingstuffet@gmail.com>

pkgname=ikemen-go-git
pkgver=0.94.2
pkgrel=1
pkgdesc="Open source fighting games engine written in Go with support for M.U.G.E.N resources."
arch=('any')
url="https://github.com/Windblade-GR01/Ikemen_GO"
license=('custom:MIT')
depends=('go' 'xorg-server' 'mesa' 'libxcursor' 'alsa-lib' 'cairo' 'pango' 'xorg-xrandr' 'libxinerama' 'libxi' 'gtk3')
provides=("${pkgname%}")
conflicts=("${pkgname%}")
makedepends=('openal119-bin')
source=(
	'ikemen_go::https://github.com/Windblade-GR01/Ikemen_GO/archive/master.zip'
	'resources::https://github.com/Windblade-GR01/Ikemen_GO-Elecbyte-Screenpack/archive/master.zip'
	'ikemen-go.sh'
	)
md5sums=('SKIP'
         'SKIP'
         '0cf3f5ab496a2b5fe96ed7506c66960b')

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
	rm "$srcdir/Ikemen_GO-master/go.mod"
	rm "$srcdir/Ikemen_GO-master/go.sum"
	rm "$srcdir/Ikemen_GO-master/.gitignore"
	rm "$srcdir/Ikemen_GO-master/.gitattributes" 
}

package() {

	# package installation: under /opt
	install -d "$pkgdir/opt/$pkgname/"
	cp -a "$srcdir/Ikemen_GO-master/." "$pkgdir/opt/$pkgname"

	# shebang shortcut under /usr/bin
	install -d "$pkgdir/usr/bin"
	cp "$srcdir/ikemen-go.sh" "$pkgdir/usr/bin/ikemen-go"

	#set permissions to current user for the package under /opt
	chown -R $USER:users "$pkgdir/opt/$pkgname/."
}
