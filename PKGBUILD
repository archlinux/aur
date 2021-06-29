# Maintainer: Lukas1818 aur at lukas1818 dot de

pkgname=superslicer-prerelease 
pkgver=2.3.56.6
_pkgtag=$pkgver
pkgrel=1
epoch=1
pkgdesc="G-code generator for 3D printers (RepRap, Makerbot, Ultimaker etc.)"
arch=("$CARCH")
url="https://github.com/supermerill/SuperSlicer"
license=('AGPL3')
depends=('cgal' 'glew' 'nlopt' 'openvdb' 'wxgtk3-dev-opt' 'boost>=1.73.0' 'qhull>=2020.2-4')
replaces=('slic3r++')
makedepends=('cereal' 'cmake' 'eigen' 'libigl' 'openvdb' 'wxgtk2-dev-opt') # cmake doesn't detect wx if not both gtk2 and gtk3 are installed
provides=("superslicer=$epoch:$pkgver")
conflicts=('superslicer' 'superslicer-git')
source=("https://github.com/supermerill//SuperSlicer/archive/$_pkgtag.tar.gz"
        "start-superslicer.sh"
        "0001-wxgtk3-is-broken-on-wayland.patch"
        "https://raw.githubusercontent.com/archlinux/svntogit-community/1dea61c0b581ff5001d073689f68b0323740be93/trunk/prusa-slicer-openexr3.patch")
sha512sums=('c68c2d4ddc23f7e1a628be9d7ca4c809089d3de251c90d1cdebfc59dabc292c8786bdd5d5f8554466d89ce7c22fc177708e098d871e32db9ae9b8d7e0799c317'
            '6a117a0ae2e82b2c0ad9e8f746fddeceb1b0efe04962468e266d7ee9d38218311fff5a82c9880b82a23b2499461ba6f8f3cabef064fc8f9b906b0e2e35bcd846'
            'acf35ebe467e9fb30f1b77d15348f1a7b82dcf45a5b829e375e972b5d6b49968603b3fa090c4d1f56e8b5148e2b820e79afa269da60ace70de1ceadcf6e820c5'
            'c33c2414746bc9d7dceb5af59ecb4aed2189211fc3c8b144d712a39d3677ba4d366eb9b4dd05fbc3811954d69cd1273d714dc4536489fe153ac1aee2919e5c98')

prepare()
{
	cd "$srcdir/SuperSlicer-$_pkgtag"

	# disabling tests is not enough, we need to remove them explicitly
	sed -i 's,add_subdirectory(test),,g' src/CMakeLists.txt

	# apply patches
	patch --forward --strip=1 --input="$srcdir/0001-wxgtk3-is-broken-on-wayland.patch"
	patch -p1 < "$srcdir/prusa-slicer-openexr3.patch" # Fix build with openEXR 3
}

build()
{
	cd "$srcdir/SuperSlicer-$_pkgtag"
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
		-DSLIC3R_ALPHA=ON \
		-DwxWidgets_CONFIG_EXECUTABLE=/opt/wxgtk-dev/bin/wx-config

	make
}

package()
{
	cd "$srcdir/SuperSlicer-$_pkgtag/build"

	make DESTDIR="$pkgdir" install
	test ! -h "$pkgdir/usr/share/SuperSlicer/resources" || rm "$pkgdir/usr/share/SuperSlicer/resources"

	mv "$pkgdir/usr/bin/superslicer" "$pkgdir/usr/share/SuperSlicer"
	install -Dm 755 "${srcdir}/start-superslicer.sh" "${pkgdir}/usr/bin/superslicer"
}
