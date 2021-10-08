# Maintainer: Lukas1818 aur at lukas1818 dot de

pkgname=superslicer-prerelease
pkgver=2.3.57.1
_pkgtag=$pkgver
pkgrel=1
epoch=1
pkgdesc="G-code generator for 3D printers (RepRap, Makerbot, Ultimaker etc.)"
arch=("$CARCH")
url="https://github.com/supermerill/SuperSlicer"
license=('AGPL3')
depends=('cgal' 'glew' 'nlopt' 'openvdb' 'wxgtk3-dev-314-opt' 'boost-libs>=1.73.0' 'qhull>=2020.2-4')
replaces=('slic3r++')
makedepends=('cereal' 'cmake' 'ninja' 'eigen' 'libigl' 'openvdb' 'boost>=1.73.0' 'wxgtk2-dev-314-opt') # cmake doesn't detect wx if not both gtk2 and gtk3 are installed
optdepends=('superslicer-profiles: Predefined printer profiles')
provides=("superslicer=$epoch:$pkgver")
conflicts=('superslicer' 'superslicer-git')
source=("https://github.com/supermerill//SuperSlicer/archive/$_pkgtag.tar.gz"
        "0001-wxgtk3-is-broken-on-wayland.patch"
        "https://raw.githubusercontent.com/archlinux/svntogit-community/1dea61c0b581ff5001d073689f68b0323740be93/trunk/prusa-slicer-openexr3.patch")
sha512sums=('85f27864ec5c3c1b473ae4c9405b419b565246c9e4c0967f0adfbbe6c6baeb1c5c9a14c5d24883c12ff4b9b09faf88dfc590d034416a58696e1d38db3aec24be'
            'acf35ebe467e9fb30f1b77d15348f1a7b82dcf45a5b829e375e972b5d6b49968603b3fa090c4d1f56e8b5148e2b820e79afa269da60ace70de1ceadcf6e820c5'
            'c33c2414746bc9d7dceb5af59ecb4aed2189211fc3c8b144d712a39d3677ba4d366eb9b4dd05fbc3811954d69cd1273d714dc4536489fe153ac1aee2919e5c98')

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
		-DCMAKE_CXX_FLAGS="-Wl,-rpath=/opt/wxgtk-dev-314/lib"

	ninja
}

package()
{
	cd "$srcdir/SuperSlicer-$_pkgtag/build"

	DESTDIR="$pkgdir" ninja install
	test ! -h "$pkgdir/usr/share/SuperSlicer/resources" || rm "$pkgdir/usr/share/SuperSlicer/resources"
}
