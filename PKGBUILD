# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro_dot_org>

pkgname=xu4-svn
_pkgname=xu4
pkgver=r3095
pkgrel=1
pkgdesc='Remake of the computer game Ultima IV'
arch=('i686' 'x86_64')
url='http://xu4.sourceforge.net/'
license=('GPL2')
depends=('libpng' 'libxml2' 'sdl_mixer')
makedepends=('cmake' 'sdl' 'subversion' 'unzip' 'zlib')
provides=("${pkgname%-svn}")
conflicts=("${pkgname%-svn}")

source=("${_pkgname}::svn+https://svn.code.sf.net/p/xu4/code/trunk")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	local ver="$(svnversion)"
	printf "r%s" "${ver//[[:alpha:]]}"
}

prepare() {
	# Fix zlib library lookup
	sed -i '11s|zlib|ZLIB|' "${srcdir}/xu4/u4/CMakeLists.txt"

	# Ensure libraries can be found
	patch -Np0 << "EOT"
+++ xu4/u4/src/CMakeLists.txt
--- xu4/u4/src/CMakeLists.txt
@@ -189,0 +189,5 @@
+find_package (SDL REQUIRED)
+find_package (SDL_mixer REQUIRED)
+find_package (LibXml2 REQUIRED)
+find_package (PNG REQUIRED)
+find_package (ZLIB REQUIRED)
EOT
}

build() {
	[[ -d build ]] && rm -rf build
    	mkdir build && cd build

	cmake -DCMAKE_INSTALL_PREFIX=/usr "${srcdir}/xu4/u4"
	make
}

package() {
	# Ultima IV assets
	install -d "$pkgdir/usr/lib/u4/ultima4"
	unzip u4upgrad.zip -d "$pkgdir/usr/lib/u4/ultima4/"
	mv "$pkgdir/usr/lib/u4/ultima4/Readme.txt" "$pkgdir/usr/lib/u4/ultima4/Readme-u4upgrad.txt"
	unzip ultima4.zip  -d "$pkgdir/usr/lib/u4/ultima4/"
	chmod -R go-w "$pkgdir/usr/lib/u4/ultima4/"

	# Executable
	install -D build/src/u4 "$pkgdir/usr/bin/u4"

	# XU4 assets
	cd xu4/u4
	local assets=(conf doc graphics icons mid sound spells)
	for asset in "${assets[@]}"; do
		cp -r "$asset" "$pkgdir/usr/lib/u4/"
	done

	# Application launcher
	install -D u4.desktop   "$pkgdir/usr/share/applications/u4.desktop"
	install -D icons/u4.png "$pkgdir/usr/share/pixmaps/u4.png"
}
