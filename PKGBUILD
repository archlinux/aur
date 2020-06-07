# Maintainer: gm3k4g <thingstuffet@gmail.com>

pkgname=ikemen-go-git
pkgver=0.94.2
pkgrel=1
pkgdesc="Open source fighting games engine written in Go with support for M.U.G.E.N resources."
arch=('any')
url="https://github.com/Windblade-GR01/Ikemen_GO"
license=('custom:MIT')
depends=('go' 'xorg-server' 'mesa')
provides=("${pkgname%}")
conflicts=("${pkgname%}")
makedepends=('openal=1.19.1')
source=(
	'ikemen_go::https://github.com/Windblade-GR01/Ikemen_GO/archive/master.zip'
	'resources::https://github.com/Windblade-GR01/Ikemen_GO-Elecbyte-Screenpack/archive/master.zip'
	'ikemen_go.sh'
	)
md5sums=('SKIP'
         'SKIP'
         'bc323f0ce347b5d5f036b369e68c9fd7')

build() {
	# get required resources
	cd "$srcdir/Ikemen_GO-master/build"
	./get.sh

	# create the dir for build process to work
	mkdir -p ../script
	# compile
	./build.sh

	# move linux files in `bin` outside and delete bin folder
	cd "$srcdir/Ikemen_GO-master/bin"
	cp -r * ..
	cd ..	
	rm -rf bin

	# delete build folder
	rm -rf build
	
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

	# shebang shortcut within /ur/bin
	install -d "$pkgdir/usr/bin"
	cp "$srcdir/ikemen_go.sh" "$pkgdir/usr/bin/ikemen_go"
}
