# Maintainer: Dominic Meiser git at msrd0 dot de

pkgname=slic3r++
pkgver=2.2.49.0
_pkgtag=1.39.0
pkgrel=2
pkgdesc="G-code generator for 3D printers (RepRap, Makerbot, Ultimaker etc.)"
arch=('x86_64')
url="https://github.com/supermerill/Slic3r"
license=('AGPL3')
depends=('cgal' 'glew' 'nlopt' 'openvdb' 'qhull' 'wxgtk3')
makedepends=('boost' 'cereal' 'cmake' 'eigen' 'libigl' 'openvdb' 'wxgtk2') # cmake doesn't detect wx if not both gtk2 and gtk3 are installed
source=("https://github.com/supermerill/Slic3r/archive/$_pkgtag.tar.gz"
        "slic3r++.desktop"
		"0001-wxgtk3-is-broken-on-wayland.patch")
sha512sums=('5ed6416529551d63932fadab702983a85870c253a598452b45c30a7d97132a5740b826ca8fbf61e747727b2143a1b507207f478309e3887682151106541bda25'
            '2f9e364724e28e26c328b83cbf76c6d05544469c3ae14324ae11a1c97fc11878d1f892674ddc6440d14d8bfbca80ba8fc0dcbaa7cf3b7420e91962ee9582b8a2'
            'acf35ebe467e9fb30f1b77d15348f1a7b82dcf45a5b829e375e972b5d6b49968603b3fa090c4d1f56e8b5148e2b820e79afa269da60ace70de1ceadcf6e820c5')

prepare()
{
	cd "$srcdir/Slic3r-$_pkgtag"
	
	# disabling tests is not enough, we need to remove them explicitly
	sed -i 's,add_subdirectory(test),,g' src/CMakeLists.txt
	
	# apply patches
	patch --forward --strip=1 --input="$srcdir/0001-wxgtk3-is-broken-on-wayland.patch"
}

build()
{
	cd "$srcdir/Slic3r-$_pkgtag"
	mkdir -p build
	cd build
	
	cmake .. \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DOpenGL_GL_PREFERENCE=GLVND \
		-DSLIC3R_FHS=ON \
		-DSLIC3R_STATIC=OFF \
		-DSLIC3R_WX_STABLE=ON \
		-DSLIC3R_GTK=3 \
		-DSLIC3R_BUILD_TESTS=OFF
	make
}

package()
{
	cd "$srcdir/Slic3r-$_pkgtag/build"
	
	make DESTDIR="$pkgdir" install
	test ! -h "$pkgdir/usr/share/slic3r++/resources" || rm "$pkgdir/usr/share/slic3r++/resources"
	
	install -d "$pkgdir/usr/share/applications"
	install -m 644 "$srcdir/slic3r++.desktop" "$pkgdir/usr/share/applications/"
}
