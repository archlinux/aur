# Maintainer: Lukas1818 aur at lukas1818 dot de

pkgname=superslicer-prerelease
pkgver=2.4.58.2
_pkgtag=$pkgver
pkgrel=2
epoch=1
pkgdesc="G-code generator for 3D printers (RepRap, Makerbot, Ultimaker etc.)"
arch=("$CARCH")
url="https://github.com/supermerill/SuperSlicer"
license=('AGPL3')
options=(!emptydirs)
depends=('boost-libs>=1.73.0' 'cgal' 'glew' 'imath' 'libspnav' 'nlopt' 'openvdb' 'qhull>=2020.2-4' 'wxgtk3')
makedepends=('boost>=1.73.0' 'cereal>=1.3.0' 'cmake' 'eigen' 'libigl' 'openvdb' 'samurai' 'wxgtk2') # cmake doesn't detect wx if not both gtk2 and gtk3 are installed
optdepends=('superslicer-profiles: Predefined printer profiles')
provides=("superslicer=$epoch:$pkgver")
conflicts=('superslicer' 'superslicer-git')
source=("https://github.com/supermerill/SuperSlicer/archive/$_pkgtag.tar.gz"
        "0001-wxgtk3-is-broken-on-wayland.patch"
        "0002-fix-cereal.patch"
        "0003-openexr3.patch")
sha512sums=('c5038bd13482a2a164ce7f3b126b9f0183b4220b2d46d84e86a0ad29624eb9e000c5b8ad876506e4042a80c7c57b7f34bbf2bf5affc385334e00da416c22fd27'
            'acf35ebe467e9fb30f1b77d15348f1a7b82dcf45a5b829e375e972b5d6b49968603b3fa090c4d1f56e8b5148e2b820e79afa269da60ace70de1ceadcf6e820c5'
            'c3ba2d16140d445168681ff442bda12e87de22f8b94d59c32576bd7079ffe5864cce8e62cddd1ed47458f9eddcbd3e1a02645b0645aad6f2e0cb08a876bf783f'
            '840e51b8feb3568ff46d309ece063f7188018fcaa43d19ec50ede408fdf2c237a3b7eaa11ba24409d8c3f7d6f5fb270181508cc56e0b2b0fef68b766130ef1eb')

prepare()
{
	cd "$srcdir/SuperSlicer-$_pkgtag"
	[ ! -f build/Makefile ] || rm -rf build
	rm -rf build # build does fail everytime if it is not clean build ?
	mkdir -p build

	# disabling tests is not enough, we need to remove them explicitly
	sed -i 's,add_subdirectory(test),,g' src/CMakeLists.txt

	# apply patches
	patch -Np1 -i "$srcdir/0001-wxgtk3-is-broken-on-wayland.patch"
	patch -Np1 -i "$srcdir/0002-fix-cereal.patch"
	patch -Np1 -i "$srcdir/0003-openexr3.patch"
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
		-DSLIC3R_ALPHA=ON 

	samu
}

package()
{
	cd "$srcdir/SuperSlicer-$_pkgtag/build"

	DESTDIR="$pkgdir" samu install
	test ! -h "$pkgdir/usr/share/SuperSlicer/resources" || rm "$pkgdir/usr/share/SuperSlicer/resources"
}
