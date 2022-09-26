# Maintainer: Lukas1818 aur at lukas1818 dot de

pkgname=superslicer-git
pkgver=2.4.58.5.r0.g76856c584
pkgrel=1
epoch=1
pkgdesc="G-code generator for 3D printers (RepRap, Makerbot, Ultimaker etc.)"
arch=("$CARCH")
url="https://github.com/supermerill/SuperSlicer"
license=('AGPL3')
options=(!emptydirs)
replaces=('slic3r++')
depends=('boost-libs>=1.79.0' 'cgal' 'glew' 'imath' 'libspnav' 'nlopt' 'openvdb' 'qhull>=2020.2-4' 'slicer-udev' 'wxwidgets-gtk3')
makedepends=('boost>=1.79.0' 'cereal>=1.3.0' 'cmake' 'eigen' 'libigl' 'ninja' 'openvdb')
optdepends=('superslicer-profiles: Predefined printer profiles')
provides=("superslicer=$epoch:$pkgver")
conflicts=('superslicer' 'superslicer-prerelease')
source=("SuperSlicer::git+https://github.com/supermerill/SuperSlicer.git"
        "0002-fix-cereal.patch::https://raw.githubusercontent.com/archlinux/svntogit-community/packages/superslicer/trunk/superslicer-cereal.patch"
        "0003-openexr3.patch::https://raw.githubusercontent.com/archlinux/svntogit-community/packages/superslicer/trunk/superslicer-openexr3.patch",
        '0004-boost1.79.patch::https://raw.githubusercontent.com/archlinux/svntogit-community/packages/superslicer/trunk/superslicer-boost1.79.patch')
sha512sums=('SKIP'
            'c3ba2d16140d445168681ff442bda12e87de22f8b94d59c32576bd7079ffe5864cce8e62cddd1ed47458f9eddcbd3e1a02645b0645aad6f2e0cb08a876bf783f'
            '840e51b8feb3568ff46d309ece063f7188018fcaa43d19ec50ede408fdf2c237a3b7eaa11ba24409d8c3f7d6f5fb270181508cc56e0b2b0fef68b766130ef1eb'
            'fc18e8edf516f9479c3b0e201d1c74b42289f15ef8a64ff3a88c2bb14613978a9dcf7be50ff8b79faf054c7721a095a70715b0fb0747be48757f9502ba0eb859')

pkgver()
{
	cd "$srcdir/SuperSlicer"
	git describe --long --tags | sed -E 's,^([0-9\.]+)([^0-9\.].*)?-([0-9]+)-(g[0-9a-f]+)$,\1.r\3.\4,'
}

prepare()
{
	cd "$srcdir/SuperSlicer"
	[ ! -f build/Makefile ] || rm -rf build
	mkdir -p build

	# disabling tests is not enough, we need to remove them explicitly
	sed -i 's,add_subdirectory(test),,g' src/CMakeLists.txt

	# apply patches
	patch -Np1 -i "$srcdir/0002-fix-cereal.patch"
	patch -Np1 -i "$srcdir/0003-openexr3.patch"
	patch -Np1 -i "$srcdir/0004-boost1.79.patch"
}

build()
{
	cd "$srcdir/SuperSlicer"
	cd build

	cmake .. \
		-G Ninja \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_CXX_FLAGS="$CXXFLAGS -Wno-ignored-optimization-argument -ffat-lto-objects -DBOOST_FILESYSTEM_DEPRECATED" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DOpenGL_GL_PREFERENCE=GLVND \
		-DSLIC3R_FHS=ON \
		-DSLIC3R_STATIC=OFF \
		-DSLIC3R_WX_STABLE=ON \
		-DSLIC3R_GTK=3 \
		-DSLIC3R_BUILD_TESTS=OFF \
		-DSLIC3R_ALPHA=ON \
		-DwxWidgets_CONFIG_EXECUTABLE=/usr/bin/wx-config

	ninja
}

package()
{
	cd "$srcdir/SuperSlicer/build"

	DESTDIR="$pkgdir" ninja install
	test ! -h "$pkgdir/usr/share/SuperSlicer/resources" || rm "$pkgdir/usr/share/SuperSlicer/resources"
	rm -r "${pkgdir}"/usr/lib/udev # Provided by slicer-udev
}
