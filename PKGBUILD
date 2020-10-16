# Maintainer: Lukas1818 aur at lukas1818 dot de

pkgname=superslicer-git
pkgver=2.2.54.0.r10.gdb99b091d
_pkgtag=$pkgver
pkgrel=1
pkgdesc="G-code generator for 3D printers (RepRap, Makerbot, Ultimaker etc.)"
arch=('x86_64')
url="https://github.com/supermerill/SuperSlicer"
license=('AGPL3')
depends=('cgal' 'glew' 'nlopt' 'openvdb' 'wxgtk3-dev' 'boost-libs-171-opt')
conflicts=('slic3r++')
replaces=('slic3r++')
makedepends=('cereal' 'cmake' 'eigen' 'libigl' 'openvdb' 'wxgtk2') # cmake doesn't detect wx if not both gtk2 and gtk3 are installed
provides=('superslicer')
conflicts=('superslicer')
source=("SuperSlicer::git+https://github.com/supermerill/SuperSlicer.git"
        "superslicer.desktop"
        "start-superslicer.sh"
        "0001-wxgtk3-is-broken-on-wayland.patch"
        "qhull-broken.patch")
sha512sums=('SKIP'
            'a06f4ec1e78f43783c3cf7a2fe38ff8620e51d1c6f149acccccb58f1121a9d4d0e1823abfb711594ab42abcadd23c8cf92996a39906aa8f308c74c11c7a5a4a3'
            'c1960eab53ffdd62dac6e33e936dd577fa9c93e100dd3bffdf69bbf71ec995d98ffcc46118bf0830f7017a0fafe5fb611a11861a607737a9bd34337f2bc13423'
            'acf35ebe467e9fb30f1b77d15348f1a7b82dcf45a5b829e375e972b5d6b49968603b3fa090c4d1f56e8b5148e2b820e79afa269da60ace70de1ceadcf6e820c5'
            'db1857418c2fe380a5e82c3c2b67d945ceb81f40df810c9b6b64730fdbcdf0e5b45e5f6ee8d77f40547b8f078b07aa92f2011e2aaa864a69c4b13d60c2a7b912')

pkgver()
{
	cd "$srcdir/SuperSlicer"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare()
{
	cd "$srcdir/SuperSlicer"

	# disabling tests is not enough, we need to remove them explicitly
	sed -i 's,add_subdirectory(test),,g' src/CMakeLists.txt

	# apply patches
	patch --forward --strip=1 --input="$srcdir/0001-wxgtk3-is-broken-on-wayland.patch"
	patch --forward --strip=0 --input="$srcdir/qhull-broken.patch"
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
		-DBoost_INCLUDE_DIR:FILEPATH=/opt/usr/include

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
