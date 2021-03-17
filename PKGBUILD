# Maintainer: Lukas1818 aur at lukas1818 dot de

pkgname=superslicer-git
pkgver=2.3.55.5.r4.g376e5026c
_pkgtag=$pkgver
pkgrel=4
pkgdesc="G-code generator for 3D printers (RepRap, Makerbot, Ultimaker etc.)"
arch=('x86_64')
url="https://github.com/supermerill/SuperSlicer"
license=('AGPL3')
depends=('cgal' 'glew' 'nlopt' 'openvdb' 'wxgtk3-dev-opt' 'boost>=1.73.0' 'qhull>=2020.2-4')
replaces=('slic3r++')
makedepends=('git' 'cereal' 'cmake' 'eigen' 'libigl' 'openvdb' 'wxgtk2-dev-opt') # cmake doesn't detect wx if not both gtk2 and gtk3 are installed
provides=('superslicer')
conflicts=('superslicer')
source=("SuperSlicer::git+https://github.com/supermerill/SuperSlicer.git"
        "start-superslicer.sh"
        "0001-wxgtk3-is-broken-on-wayland.patch")
sha512sums=('SKIP'
            'abfbd056be518b1b733cddef6c430cc3c4199d5df13067574dd3269cf35b798e11b43f55f1dfb57d6d8ee1da06882825fef0f7a170a9b069b95e9aea1ec8f31d'
            'acf35ebe467e9fb30f1b77d15348f1a7b82dcf45a5b829e375e972b5d6b49968603b3fa090c4d1f56e8b5148e2b820e79afa269da60ace70de1ceadcf6e820c5')

pkgver()
{
	cd "$srcdir/SuperSlicer"
	git describe --long --tags | sed -E 's,^([0-9\.]+)([^0-9\.].*)?-([0-9]+)-(g[0-9a-f]+)$,\1.r\3.\4,'
}

prepare()
{
	cd "$srcdir/SuperSlicer"

	# disabling tests is not enough, we need to remove them explicitly
	sed -i 's,add_subdirectory(test),,g' src/CMakeLists.txt

	# apply patches
	patch --forward --strip=1 --input="$srcdir/0001-wxgtk3-is-broken-on-wayland.patch"
}

build()
{
	cd "$srcdir/SuperSlicer"
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
		-DSLIC3R_BUILD_TESTS=OFF \
		-DwxWidgets_CONFIG_EXECUTABLE=/opt/wxgtk-dev/bin/wx-config

	make
}

package()
{
	cd "$srcdir/SuperSlicer/build"

	make DESTDIR="$pkgdir" install
	test ! -h "$pkgdir/usr/share/SuperSlicer/resources" || rm "$pkgdir/usr/share/SuperSlicer/resources"
	test ! -h "$pkgdir/usr/bin/prusa-gcodeviewer" || rm "$pkgdir/usr/bin/prusa-gcodeviewer"

	mv "$pkgdir/usr/bin/superslicer" "$pkgdir/usr/share/SuperSlicer"
	install -Dm 755 "${srcdir}/start-superslicer.sh" "${pkgdir}/usr/bin/superslicer"
}
