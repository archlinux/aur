# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro_dot_org>

# Upstream project has a 1.0beta3 release but it's very old. 0.9 is used here
# to denote pre-1.0 status.

pkgname=xu4-svn
_pkgname=xu4
pkgver=0.9.r3093
_pkgver=0.9
pkgrel=1
pkgdesc='Remake of the computer game Ultima IV'
arch=('i686' 'x86_64')
url='http://xu4.sourceforge.net/'
license=('gpl2')
depends=('libpng'
         'libxml2'
         'sdl_mixer')
makedepends=('cmake'
             'sdl'
             'subversion'
             'unzip'
             'zlib')
provides=("${pkgname%-svn}")
conflicts=("${pkgname%-svn}")

source=("${_pkgname}::svn+https://svn.code.sf.net/p/xu4/code/trunk"
        'http://ultima.thatfleminggent.com/ultima4.zip'
        'https://sourceforge.net/projects/xu4/files/Ultima%204%20VGA%20Upgrade/1.3/u4upgrad.zip')
sha256sums=('SKIP'
            '94aa748cfa1d0e7aa2e518abebb994f3c18acf7edb78c3bd37cd0a4404e6ba74'
            '400ac37311f3be74c1b2d7836561b2ead2b146f5162586865b0f4881225cca58')
noextract=('ultima4.zip'
           'u4upgrad.zip')

pkgver() {
	cd "$_pkgname"
	local ver="$(svnversion)"
	printf "$_pkgver.r%s" "${ver//[[:alpha:]]}"
}

prepare() {
	# Fix zlib library lookup
	sed -i '11s|zlib|ZLIB|' "${srcdir}/xu4/u4/CMakeLists.txt"

	# Let's set a better version
	sed -i "223s|svn1.1.1.1|svn${pkgver#$_pkgver}|" "${srcdir}/xu4/u4/src/CMakeLists.txt"

	# Use sourced archives, don't download every build
	patch -Np0 << "EOT"
+++ xu4/u4/src/CMakeLists.txt
--- xu4/u4/src/CMakeLists.txt
@@ -249,9 +249,0 @@
-file(DOWNLOAD
-http://www.thatfleminggent.com/ultima/ultima4.zip
-${CMAKE_CURRENT_BINARY_DIR}/ultima4.zip
-)
-
-file(DOWNLOAD
-http://sourceforge.net/projects/xu4/files/Ultima%204%20VGA%20Upgrade/1.3/u4upgrad.zip
-${CMAKE_CURRENT_BINARY_DIR}/u4upgrad.zip
-)
EOT
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
	rm -fr build && mkdir build && cd build
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
