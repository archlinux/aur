# Maintainer: Leo LI <i@hardrain980.com>
_raw_pkgver=02.09.01.70

pkgname=bambu-studio
pkgver=2.9.1
pkgrel=4
pkgdesc="PC Software for BambuLab and other 3D printers"
arch=('x86_64')
url="https://github.com/bambulab/BambuStudio"
license=('AGPL-3.0-or-later')
groups=()
depends=(
	'at-spi2-core' 'blosc' 'bzip2' 'cairo' 'curl' 'dbus' 'expat' 'ffmpeg' 'fontconfig' 'ffmpeg' 'freetype2'
	'gdk-pixbuf2' 'glfw' 'glib2' 'glibc' 'glu' 'glslang' 'gmp' 'gstreamer' 'gtk3' 'harfbuzz' 'imath'
	'libgcc' 'libglvnd' 'libharu' 'libice' 'libjpeg-turbo' 'libpng' 'libsecret' 'libsm' 'libsoup3'
	'libstdc++' 'libtiff' 'libx11' 'libxext' 'mesa' 'mpfr' 'openssl' 'pango' 'wayland' 'webkit2gtk-4.1'
	'xz' 'zlib' 'zstd'
)
makedepends=('cmake' 'extra-cmake-modules' 'git' 'libxkbcommon' 'libxkbcommon-x11' 'wayland-protocols' 'nasm' 'yasm')
# add '!lto' or ffmpeg build fails exact the same way described in this thread
# https://bbs.archlinux.org/viewtopic.php?id=305489
options=(!lto !strip !debug)
source=(
	"BambuStudio-$_raw_pkgver.tar.gz::https://github.com/bambulab/BambuStudio/archive/refs/tags/v$_raw_pkgver.tar.gz"
	'BambuStudio.desktop'
	'0001-src-slic3r-CMakeLists.txt-avoid-linking-to-the-depre.patch'
	'0010-use-ffmpeg-provided-by-package-manager-and-avoid-bui.patch'
	'0011-use-libharu-provided-by-package-manager-revert-bambu.patch'
	'0012-use-blosc-provided-by-package-manager-explicitly-lin.patch'
	'0013-patch-boost-locale-source-group-to-fix-failed-deps-b.patch'
	'FindBlosc.cmake::https://raw.githubusercontent.com/AcademySoftwareFoundation/openvdb/v8.2.0/cmake/FindBlosc.cmake'
	'https://github.com/bambulab/BambuStudio/pull/12925.patch'
	'cgal-fix-boost-mpl-include.patch'
)
sha256sums=(
	'39175631bcd01e942e0936fd3610a9c4bd43b5920768eda0bb365b00985537b0'
	SKIP
	SKIP
	SKIP
	SKIP
	SKIP
	SKIP
	'ccba05deae648ae608d6c089cb25af4674083ce83ddbd18cecde2107f43e3364'
	'824a8f709f04a353d017362526b56db3c9cdd073a0b58d080f1e6e6095a186fe'
	SKIP
)

prepare() {
	patch -Np1 -d $srcdir/BambuStudio-$_raw_pkgver < $srcdir/0001-src-slic3r-CMakeLists.txt-avoid-linking-to-the-depre.patch
	patch -Np1 -d $srcdir/BambuStudio-$_raw_pkgver < $srcdir/0010-use-ffmpeg-provided-by-package-manager-and-avoid-bui.patch
	patch -Np1 -d $srcdir/BambuStudio-$_raw_pkgver < $srcdir/0011-use-libharu-provided-by-package-manager-revert-bambu.patch
	patch -Np1 -d $srcdir/BambuStudio-$_raw_pkgver < $srcdir/0012-use-blosc-provided-by-package-manager-explicitly-lin.patch
	patch -Np1 -d $srcdir/BambuStudio-$_raw_pkgver < $srcdir/0013-patch-boost-locale-source-group-to-fix-failed-deps-b.patch
	patch -Np1 -d $srcdir/BambuStudio-$_raw_pkgver < $srcdir/12925.patch
	install -Dm644 \
		"$srcdir/FindBlosc.cmake" \
		"$srcdir/BambuStudio-$_raw_pkgver/cmake/modules/FindBlosc.cmake"
	mkdir -p \
		$srcdir/BambuStudio_deps \
		$srcdir/BambuStudio-$_raw_pkgver/build \
		$srcdir/BambuStudio-$_raw_pkgver/deps/build
}

build() {
	# Burrr, BBL is sticking with an old version of cmake ...
	export CMAKE_POLICY_VERSION_MINIMUM=3.5
	# GCC 15 defaults to c23, which breaks some old code ...
	export CC='gcc -std=gnu99'

	cd $srcdir/BambuStudio-$_raw_pkgver/deps/build
	cmake ../ \
		-DDESTDIR=$srcdir/BambuStudio_deps \
		-DCMAKE_BUILD_TYPE=Release \
		-DDEP_WX_GTK3=1 \
		-DDEP_BUILD_PNG=0 \
		-DDEP_BUILD_JPEG=0 \
		-DDEP_BUILD_TIFF=0 \
		-DDEP_BUILD_FREETYPE=0 \
		-DDEP_BUILD_FFMPEG=0 \
		-DDEP_BUILD_LIBHARU=0 \
		-DDEP_BUILD_GLFW=0 \
		-DDEP_BUILD_GMP=0 \
		-DDEP_BUILD_MPFR=0 \
		-DDEP_BUILD_OPENSSL=0 \
		-DDEP_BUILD_BLOSC=0 \
		-DCURL_FOUND=1 \
		-DEXPAT_FOUND=1 \
		-DZLIB_FOUND=1
	make
	patch -Np1 -d "$srcdir/BambuStudio_deps/usr/local/include" < "$srcdir/cgal-fix-boost-mpl-include.patch"

	cd $srcdir/BambuStudio-$_raw_pkgver/build
	cmake ../ \
		-DSLIC3R_STATIC=1 \
		-DSLIC3R_GTK=3 \
		-DBBL_RELEASE_TO_PUBLIC=1 \
		-DBBL_INTERNAL_TESTING=0 \
		-DCMAKE_PREFIX_PATH=$srcdir/BambuStudio_deps/usr/local \
		-DCMAKE_INSTALL_PREFIX=/opt/BambuStudio \
		-DCMAKE_BUILD_TYPE=Release \
		-DOPENSSL_ROOT_DIR=/usr
	cmake --build . --config Release
}

package() {
	cd $srcdir/BambuStudio-$_raw_pkgver/build
	mkdir -p $pkgdir/usr/bin
	DESTDIR="$pkgdir" cmake --install .
	ln -sf /opt/BambuStudio/bin/bambu-studio $pkgdir/usr/bin/bambu-studio
	install -Dm0644 $srcdir/BambuStudio.desktop $pkgdir/usr/share/applications/BambuStudio.desktop
	install -Dm0644 $srcdir/BambuStudio-$_raw_pkgver/LICENSE $pkgdir/usr/share/licenses/BambuStudio/LICENSE
	install -Dm0644 $srcdir/BambuStudio-$_raw_pkgver/resources/images/BambuStudio_128px.png $pkgdir/usr/share/icons/hicolor/128x128/apps/BambuStudio.png
	install -Dm0644 $srcdir/BambuStudio-$_raw_pkgver/resources/images/BambuStudio_192px.png $pkgdir/usr/share/icons/hicolor/192x192/apps/BambuStudio.png
	install -Dm0644 $srcdir/BambuStudio-$_raw_pkgver/resources/images/BambuStudio_32px.png $pkgdir/usr/share/icons/hicolor/32x32/apps/BambuStudio.png
	install -Dm0644 $srcdir/BambuStudio-$_raw_pkgver/resources/images/BambuStudio.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/BambuStudio.svg
}
