# Maintainer: Lukas1818 aur at lukas1818 dot de

pkgname=superslicer
pkgver=2.3.57.8
_pkgtag=$pkgver
pkgrel=1
epoch=1
pkgdesc="G-code generator for 3D printers (RepRap, Makerbot, Ultimaker etc.)"
arch=("$CARCH")
url="https://github.com/supermerill/SuperSlicer"
license=('AGPL3')
options=(!emptydirs)
depends=('boost-libs>=1.73.0' 'cgal' 'glew' 'nlopt' 'imath' 'openvdb' 'qhull>=2020.2-4' 'wxgtk3-dev-314-opt')
makedepends=('boost>=1.73.0' 'cereal' 'cmake' 'eigen' 'libigl' 'ninja' 'openvdb' 'wxgtk2-dev-314-opt') # cmake doesn't detect wx if not both gtk2 and gtk3 are installed
optdepends=('superslicer-profiles: Predefined printer profiles')
replaces=('slic3r++')
source=("https://github.com/supermerill//SuperSlicer/archive/$_pkgtag.tar.gz"
        "0001-wxgtk3-is-broken-on-wayland.patch"
        "https://raw.githubusercontent.com/archlinux/svntogit-community/1dea61c0b581ff5001d073689f68b0323740be93/trunk/prusa-slicer-openexr3.patch"
        "tbb-2021.patch"
        "FindTBB.cmake")
sha512sums=('33109e8b99e13ec341815eca591246bdffba8964fabd2ae13c15791af1042b469f4a2fd8b5091fb1f4eb3c29b0cba36f562cd2cbb38843c3f97c3e42ee3f0a1a'
            'acf35ebe467e9fb30f1b77d15348f1a7b82dcf45a5b829e375e972b5d6b49968603b3fa090c4d1f56e8b5148e2b820e79afa269da60ace70de1ceadcf6e820c5'
            'c33c2414746bc9d7dceb5af59ecb4aed2189211fc3c8b144d712a39d3677ba4d366eb9b4dd05fbc3811954d69cd1273d714dc4536489fe153ac1aee2919e5c98'
            '6a00fa9eb13b2485aed493e96b49e1ef345d8fcf6adf2719c2336e4b07e4e7c1461ee288d77a9c45f3bac5e68507d54da00816817ef17023e6e0aa9d0fb36348'
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
	cp "$srcdir/FindTBB.cmake" "cmake/modules/FindTBB.cmake"

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
		-DSLIC3R_ALPHA=OFF \
		-DwxWidgets_CONFIG_EXECUTABLE=/opt/wxgtk-dev-314/bin/wx-config \
		-DCMAKE_CXX_FLAGS="-Wno-unused-command-line-argument -Wl,-rpath=/opt/wxgtk-dev-314/lib"

	ninja
}

package()
{
	cd "$srcdir/SuperSlicer-$_pkgtag/build"

	DESTDIR="$pkgdir" ninja install
	test ! -h "$pkgdir/usr/share/SuperSlicer/resources" || rm "$pkgdir/usr/share/SuperSlicer/resources"

	install -d "$pkgdir/usr/share/applications"
}
