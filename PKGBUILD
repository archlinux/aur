# Contributor: Simo Huhtiranta <simo_huhtirantaATpp_inet_fi>  
# Contributor: Tilmann Becker <tilmann.becker@web.de>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: Miguel Revilla Rodríguez <yo at miguelrevilla.com>

pkgname=scribus-svn
pkgver=27785
pkgrel=1
pkgdesc="A desktop publishing program - Version from SVN"
arch=('x86_64')
license=('GPL-2.0-or-later' 'LGPL-2.1-or-later' 'BSD-3-Clause' 'MIT')
url="http://www.scribus.net"
depends=(
        boost-libs
        cairo
        fontconfig
        freetype2
        graphicsmagick
        harfbuzz-icu
        hicolor-icon-theme
        hunspell
        icu
        lcms2
        libcdr
        libcups
        libfreehand
        libjpeg-turbo
        libmspub
        libpagemaker
        libpng
        librevenge
        libtiff
        libvisio
        libqxp
        libxml2
        libzmf
        openscenegraph
        openssl
        podofo
        poppler
        python
        python-pillow
        qt6-5compat
        qt6-base
        qt6-declarative
        qt6-imageformats
        qt6-svg
        zlib
        qt-advanced-docking-system
)
makedepends=(cmake subversion boost qt6-tools)
optdepends=(
        'hyphen: for hyphenation support'
)
conflicts=('scribus')
provides=('scribus')
source=('scribus::svn://scribus.net/trunk')
sha256sums=('SKIP')
_svnmod='scribus'

pkgver() {
  LANG=C
  cd ${_svnmod}
  local ver="$(svnversion)"
  printf "%s" "${ver//[[:alpha:]]}"
}

prepare() {
	cd ${_svnmod}
	# makepkg may reuse the SVN working copy; discard changes from an older build.
	svn revert -qR .
	rm -rf Scribus/build

	cd Scribus
	find scribus -type f \( -name "*.cpp" -o -name "*.h" \) -exec sed -i \
	's|#include "third_party/Qt-Advanced-Docking-System/src/|#include "|g' {} +
	sed -i '/#if(WANT_QTADS)/,/^#endif()/d' scribus/CMakeLists.txt
	sed -i '/#if(WANT_QTADS)/,/^#endif()/d' scribus/third_party/CMakeLists.txt
	sed -i '/add_subdirectory(plugins)/i\
find_package(qtadvanceddocking-qt6 REQUIRED)\
get_target_property(QTADS_INCLUDE_DIRS ads::qtadvanceddocking-qt6 INTERFACE_INCLUDE_DIRECTORIES)\
include_directories(${QTADS_INCLUDE_DIRS})' scribus/CMakeLists.txt

	cat <<'EOF' >> scribus/CMakeLists.txt

target_link_libraries(${EXE_NAME} PRIVATE ads::qtadvanceddocking-qt6)
EOF
}

build() {
        cd ${_svnmod}/Scribus
        cmake . -B build \
                -DCMAKE_INSTALL_PREFIX=/usr \
                -DCMAKE_BUILD_TYPE=Release \
                -DWANT_DISTROBUILD=ON \
                -DWANT_CPP20=ON \
                -DWANT_GRAPHICSMAGICK=ON \
		-DWANT_PCH=ON \
		-DWANT_CCACHE=ON \
		-DWITH_PODOFO=ON \
		-Dqtadvanceddocking-qt6_DIR=/usr/lib/cmake/qtadvanceddocking-qt6
        cmake --build build
}

package() {
        cd ${_svnmod}/Scribus
        DESTDIR="${pkgdir}" cmake --install build
        install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
        install -Dm644 scribus.desktop "${pkgdir}/usr/share/applications/scribus.desktop"
        install -d "${pkgdir}/usr/share/pixmaps"
        ln -s /usr/share/scribus/icons/1_7_0/scribus-icon.svg "${pkgdir}/usr/share/pixmaps/scribus.svg"
        rm -rf "${pkgdir}/usr/share/scribus/dicts/hyph"
        ln -sf /usr/share/hyphen "${pkgdir}/usr/share/scribus/dicts/hyph"
}
