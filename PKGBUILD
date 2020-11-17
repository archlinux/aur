# Maintainer: Lukas1818 aur at lukas1818 dot de

pkgname=superslicer-git
pkgver=2.3.55.r19.gb686b8956
_pkgtag=$pkgver
pkgrel=1
pkgdesc="G-code generator for 3D printers (RepRap, Makerbot, Ultimaker etc.)"
arch=('x86_64')
url="https://github.com/supermerill/SuperSlicer"
license=('AGPL3')
depends=('cgal' 'glew' 'nlopt' 'openvdb' 'wxgtk3-dev-opt' 'boost-libs-171-opt' 'qhull>=2020.2-4')
replaces=('slic3r++')
makedepends=('git' 'cereal' 'cmake' 'eigen' 'libigl' 'openvdb' 'wxgtk2-dev-opt') # cmake doesn't detect wx if not both gtk2 and gtk3 are installed
provides=('superslicer')
conflicts=('superslicer')
source=("SuperSlicer::git+https://github.com/supermerill/SuperSlicer.git"
        "superslicer.desktop"
        "start-superslicer.sh"
        "0001-wxgtk3-is-broken-on-wayland.patch")
sha512sums=('SKIP'
            '8f75de56ba3e29b9c650d2946bd11afcf406a7fd42d2620ec44e4e76f6b64626de720190ce0f8be29ba7c48f714bfa0a71c45f868bdce7bc1ac7dbbc0e9e7583'
            '3703901d97ae1982a36eb5c491fe0fd6953e81e6bb1d155404acfcac1de1f377931c88b9667688775af5ed16bd46944ca3a285bc4b2739762faa70e546044c43'
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
		-DBoost_NO_BOOST_CMAKE=TRUE \
		-DBoost_NO_SYSTEM_PATHS=TRUE \
		-DBOOST_ROOT:PATHNAME=/opt/usr \
		-DBoost_LIBRARY_DIRS:FILEPATH=/opt/usr/lib \
		-DBoost_INCLUDE_DIR:FILEPATH=/opt/usr/include \
		-DwxWidgets_CONFIG_EXECUTABLE=/opt/wxgtk-dev/bin/wx-config

	make
}

package()
{
	cd "$srcdir/SuperSlicer/build"

	make DESTDIR="$pkgdir" install
	test ! -h "$pkgdir/usr/share/SuperSlicer/resources" || rm "$pkgdir/usr/share/SuperSlicer/resources"

	install -d "$pkgdir/usr/share/applications"
	install -m 644 "$srcdir/superslicer.desktop" "$pkgdir/usr/share/applications/"

	mv "$pkgdir/usr/bin/superslicer" "$pkgdir/usr/share/SuperSlicer"
	install -Dm 755 "${srcdir}/start-superslicer.sh" "${pkgdir}/usr/bin/superslicer"
}
