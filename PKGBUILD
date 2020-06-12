# Maintainer: gm3k4g <thingstuffet@gmail.com>

pkgname=ikemen-go-git
pkgver=0.0.Info.r475.g2b0dd1a
pkgrel=1
pkgdesc="Open source fighting games engine written in Go with support for M.U.G.E.N resources."
arch=('any')
url="https://github.com/Windblade-GR01/Ikemen_GO"
license=('custom:MIT')
depends=('git' 'go' 'xorg-server' 'mesa' 'libxcursor' 'alsa-lib' 'cairo' 'pango' 'xorg-xrandr' 'libxinerama' 'libxi' 'gtk3' 'sudo')
provides=("${pkgname%}"
		  "ikemen-go-bin")
conflicts=("${pkgname%}"
		   "ikemen-go-bin")
makedepends=('openal119-bin')
source=(
	'git+https://github.com/Windblade-GR01/Ikemen_GO.git'
	'git+https://github.com/Windblade-GR01/Ikemen_GO-Elecbyte-Screenpack.git'
	'ikemen-go.sh'
	)
md5sums=('SKIP'
         'SKIP'
         '7f753ac4bdfe4ee42ee500de123fdef0')

pkgver() {
  cd "${srcdir}/Ikemen_GO"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	chmod +x ikemen-go.sh
	# acquire permissions and get required resources
	cd "${srcdir}/Ikemen_GO/build"
	chmod +x get.sh
	chmod +x build.sh
	./get.sh

	# create the dir for build process to work and compile
	mkdir -p ../script
	./build.sh

	# copy linux files in root directory and delete bin folder
	cd "${srcdir}/Ikemen_GO/bin"
	cp -r * ..
	cd ..	

	# copy ELECBYTE resources and delete other copy
	cd "${srcdir}/Ikemen_GO-Elecbyte-Screenpack/"
	cp -rf * "${srcdir}/Ikemen_GO/"
	cd ..
	rm -rf "${srcdir}Ikemen_GO-Elecbyte-Screenpack/"

	msg "Removing dirs/files that are no longer necessary.."
	sudo rm -rf "$srcdir/Ikemen_GO/go"
	rm -rf "${srcdir}/Ikemen_GO/bin"
	rm -rf "${srcdir}/Ikemen_GO/build"
	rm -rf "${srcdir}/Ikemen_GO/windres"
	rm -rf "${srcdir}/Ikemen_GO/src"
	rm -rf "${srcdir}/Ikemen_GO/script"
	rm -rf "${srcdir}/Ikemen_GO/.git"
	rm "${srcdir}/Ikemen_GO/go.mod"
	rm "${srcdir}/Ikemen_GO/go.sum"
	rm "${srcdir}/Ikemen_GO/.gitignore"
	rm "${srcdir}/Ikemen_GO/.gitattributes" 
	rm "${srcdir}/Ikemen_GO/README.md"
	rm "${srcdir}/Ikemen_GO/LICENCE.md"
}

package() {
	# package installation: under /opt
	install -dm777 "${pkgdir}/opt/$pkgname/"
	cp -a "${srcdir}/Ikemen_GO/." "${pkgdir}/opt/$pkgname"
	#put ikemen-go.sh inside pkgdir
	cp "ikemen-go.sh" "${pkgdir}/opt/$pkgname/"

	# Create static link from shebang script to /usr/bin
	install -d "${pkgdir}/usr/bin"
	ln -s "${pkgdir}/opt/$pkgname/ikemen-go.sh" "${pkgdir}/usr/bin/ikemen-go"
}
