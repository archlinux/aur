# Maintainer: Leo LI <i@hardrain980.com>
_raw_pkgver=02.07.01.57

pkgname=bambu-studio
pkgver=2.7.1
pkgrel=1
pkgdesc="PC Software for BambuLab and other 3D printers"
arch=('x86_64')
url="https://github.com/bambulab/BambuStudio"
license=('AGPL-3.0')
groups=()
depends=(
	'at-spi2-core' 'bzip2' 'cairo' 'dbus' 'ffmpeg' 'fontconfig'
	'gdk-pixbuf2' 'glib2' 'glibc' 'glu' 'glslang' 'gstreamer' 'gtk3'
	'harfbuzz' 'imath' 'libgcc' 'libglvnd' 'libice' 'libjpeg-turbo'
	'libsecret' 'libsm' 'libsoup3' 'libstdc++' 'libtiff' 'libx11' 'libxext'
	'mesa' 'pango' 'wayland' 'webkit2gtk-4.1' 'xz' 'zlib' 'zstd'
)
makedepends=('cmake' 'extra-cmake-modules' 'git' 'libxkbcommon' 'libxkbcommon-x11' 'wayland-protocols' 'nasm' 'yasm')
# add '!lto' or ffmpeg build fails exact the same way described in this thread
# https://bbs.archlinux.org/viewtopic.php?id=305489
options=(!lto !strip !debug)
source=(
	"BambuStudio-$_raw_pkgver.tar.gz::https://github.com/bambulab/BambuStudio/archive/refs/tags/v$_raw_pkgver.tar.gz"
	'BambuStudio.desktop'
	'0001-src-slic3r-CMakeLists.txt-avoid-linking-to-the-depre.patch'
)
sha256sums=('a058813a1fc623a5357dc9291b34318df21345683374ce3ea87b843cb1c0559a' SKIP SKIP)

prepare() {
	patch -Np1 -d $srcdir/BambuStudio-$_raw_pkgver < $srcdir/0001-src-slic3r-CMakeLists.txt-avoid-linking-to-the-depre.patch
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
		-DDEP_WX_GTK3=1
	make -j1

	cd $srcdir/BambuStudio-$_raw_pkgver/build
	cmake ../ \
		-DSLIC3R_STATIC=ON \
		-DSLIC3R_GTK=3 \
		-DBBL_RELEASE_TO_PUBLIC=1 \
		-DCMAKE_PREFIX_PATH=$srcdir/BambuStudio_deps/usr/local \
		-DCMAKE_INSTALL_PREFIX=/opt/BambuStudio \
		-DCMAKE_BUILD_TYPE=Release
	cmake --build . --config Release -j2
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
