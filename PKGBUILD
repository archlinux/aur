# Maintainer: Lukas1818 aur at lukas1818 dot de

pkgname=superslicer-git
pkgver=2.3.57.11.r1.gd49bafc8a
pkgrel=1
epoch=1
pkgdesc="G-code generator for 3D printers (RepRap, Makerbot, Ultimaker etc.)"
arch=("$CARCH")
url="https://github.com/supermerill/SuperSlicer"
license=('AGPL3')
options=(!emptydirs)
replaces=('slic3r++')
depends=('boost-libs>=1.73.0' 'cgal' 'glew' 'imath' 'libspnav' 'nlopt' 'openvdb' 'qhull>=2020.2-4' 'slicer-udev' 'wxwidgets-gtk3')
makedepends=('boost>=1.73.0' 'cereal>=1.3.0' 'cmake' 'eigen' 'libigl' 'openvdb' 'samurai') # cmake doesn't detect wx if not both gtk2 and gtk3 are installed
optdepends=('superslicer-profiles: Predefined printer profiles')
provides=("superslicer=$epoch:$pkgver")
conflicts=('superslicer' 'superslicer-prerelease')
source=("SuperSlicer::git+https://github.com/supermerill/SuperSlicer.git"
        "0002-fix-cereal.patch"
        "0003-openexr3.patch")
sha512sums=('SKIP'
            '182205e77a77c36b1bdb1b449bd6eb3b593cfb6f97527f1cd7dd90c09db5698e570942303b29007d1285742b3bdf5b3e01dab59bf56fc890e3942f65bccd46b4'
            'a83cad3b8c64012c929a8d10a8946c621a74dde139a1ed4f667b65121a48e3fb4aaa26d6444513ec739d7e4864bfef1aeba67802b495ace8e5aafa6e822eebd6')

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
}

build()
{
	cd "$srcdir/SuperSlicer"
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

	samu
}

package()
{
	cd "$srcdir/SuperSlicer/build"

	DESTDIR="$pkgdir" samu install
	test ! -h "$pkgdir/usr/share/SuperSlicer/resources" || rm "$pkgdir/usr/share/SuperSlicer/resources"
	rm -r "${pkgdir}"/usr/lib/udev # Provided by slicer-udev
}
