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

	# create the dir for build process to work
	mkdir -p ../script
	# compile
	./build.sh

	# move linux files in `bin` outside and delete bin folder
	cd "$srcdir/Ikemen_GO-master/bin"
	cp -r * ..
	cd ..	

	# delete build folder and other unnecessary directories
	rm -rf bin
	rm -rf build
	rm -rf go
	
	# delete go.mod, go.sum .gitignore, .gitattributes
	rm go.mod
	rm go.sum
	rm .gitignore
	rm .gitattributes 
	
	# move ELECBYTE resources
	cd "$srcdir/Ikemen_GO-Elecbyte-Screenpack-master"
	cp -rf * "$srcdir/Ikemen_GO-master"
	cd ..
	
	rm -rf "Ikemen_GO-Elecbyte-Screenpack-master"
}

package() {
	# create the directory under /opt and copy files in there
	install -dm755 "$pkgdir/opt"
	cp -a "$srcdir/Ikemen_GO-master" "$pkgdir/opt/$pkgname"

	# set permisisons for dirs/files
	find "$pkgdir/opt/$pkgname" -type d -exec chmod 777 {} \;
	find "$pkgdir/opt/$pkgname" -type f -exec chmod 777 {} \;

	# shebang shortcut within /ur/bin
	install -d "$pkgdir/usr/bin"
	cp "$srcdir/ikemen-go.sh" "$pkgdir/usr/bin/ikemen-go"
}
