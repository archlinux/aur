# Maintainer: Lukas1818 aur at lukas1818 dot de

pkgname=superslicer-prerelease
pkgver=2.3.57.8
_pkgtag=$pkgver
pkgrel=2
epoch=1
pkgdesc="G-code generator for 3D printers (RepRap, Makerbot, Ultimaker etc.)"
arch=("$CARCH")
url="https://github.com/supermerill/SuperSlicer"
license=('AGPL3')
options=(!emptydirs)
depends=('cgal' 'glew' 'imath' 'nlopt' 'openvdb' 'wxgtk3-dev-314-opt' 'boost-libs>=1.73.0' 'qhull>=2020.2-4')
replaces=('slic3r++')
makedepends=('cereal' 'cmake' 'ninja' 'eigen' 'libigl' 'openvdb' 'boost>=1.73.0' 'wxgtk2-dev-314-opt') # cmake doesn't detect wx if not both gtk2 and gtk3 are installed
optdepends=('superslicer-profiles: Predefined printer profiles')
provides=("superslicer=$epoch:$pkgver")
conflicts=('superslicer' 'superslicer-git')
source=("https://github.com/supermerill/SuperSlicer/archive/$_pkgtag.tar.gz"
        "0001-wxgtk3-is-broken-on-wayland.patch"
        "https://raw.githubusercontent.com/archlinux/svntogit-community/1dea61c0b581ff5001d073689f68b0323740be93/trunk/prusa-slicer-openexr3.patch"
        "tbb-2021.patch"
        "FindTBB.cmake")
sha512sums=('b5d6b59308bc5ed70ccbfe6c4414b43cf9a081aa7591055ebf568842cb44dcaa0fe17e1e7a908dea99695067d569060961bee31d9f30993449bcc7175764f26d'
            'acf35ebe467e9fb30f1b77d15348f1a7b82dcf45a5b829e375e972b5d6b49968603b3fa090c4d1f56e8b5148e2b820e79afa269da60ace70de1ceadcf6e820c5'
            'c33c2414746bc9d7dceb5af59ecb4aed2189211fc3c8b144d712a39d3677ba4d366eb9b4dd05fbc3811954d69cd1273d714dc4536489fe153ac1aee2919e5c98'
            'b8425f6d0402042f73891d21d1be370d0afc3a156f8366da5d1cd73aeb197347dbe59a544b95b1aa40b2a3e28c520ac410fa4f92aa99822c0cb8b41b595d6519'
            '5a6426f7d5b1761923c83838b1b5c976529b7a4b5e8c5c98f34c6174d8636fbfca34e3a04ed5f5314c88db3261c454c9f4576f7cf58f6623a43cff08a0b5b105')

prepare()
{
	cd "$srcdir/SuperSlicer-$_pkgtag"
	[ ! -f build/Makefile ] || rm -rf build
	mkdir -p build

	# disabling tests is not enough, we need to remove them explicitly
	sed -i 's,add_subdirectory(test),,g' src/CMakeLists.txt

	# apply patches
	patch --forward --strip=1 --input="$srcdir/0001-wxgtk3-is-broken-on-wayland.patch"
	patch -p1 < "$srcdir/prusa-slicer-openexr3.patch" # Fix build with openEXR 3
	patch -p1 < "$srcdir/tbb-2021.patch" # Fix build with TBB 2021
	cp "$srcdir/FindTBB.cmake" "cmake/modules/FindTBB.cmake" # Fix build with TBB 2021
}

build()
{
	cd "$srcdir/SuperSlicer-$_pkgtag"
	cd build

	cmake .. \
		-G Ninja \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DOpenGL_GL_PREFERENCE=GLVND \
		-DSLIC3R_FHS=ON \
		-DSLIC3R_STATIC=OFF \
		-DSLIC3R_WX_STABLE=ON \
		-DSLIC3R_GTK=3 \
		-DSLIC3R_BUILD_TESTS=OFF \
		-DSLIC3R_ALPHA=ON \
		-DwxWidgets_CONFIG_EXECUTABLE=/opt/wxgtk-dev-314/bin/wx-config \
		-DCMAKE_CXX_FLAGS="-Wno-unused-command-line-argument -Wl,-rpath=/opt/wxgtk-dev-314/lib"

	ninja
}

package()
{
	cd "$srcdir/SuperSlicer-$_pkgtag/build"

	DESTDIR="$pkgdir" ninja install
	test ! -h "$pkgdir/usr/share/SuperSlicer/resources" || rm "$pkgdir/usr/share/SuperSlicer/resources"
}
