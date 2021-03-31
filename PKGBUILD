# Maintainer: Lukas1818 aur at lukas1818 dot de

pkgname=superslicer
pkgver=2.3.55.5
_pkgtag=$pkgver
pkgrel=3
pkgdesc="G-code generator for 3D printers (RepRap, Makerbot, Ultimaker etc.)"
arch=("$CARCH")
url="https://github.com/supermerill/SuperSlicer"
license=('AGPL3')
depends=('cgal' 'glew' 'nlopt' 'openvdb' 'wxgtk3-dev-opt' 'boost>=1.73.0' 'qhull>=2020.2-4')
replaces=('slic3r++')
makedepends=('cereal' 'cmake' 'eigen' 'libigl' 'openvdb' 'wxgtk2-dev-opt') # cmake doesn't detect wx if not both gtk2 and gtk3 are installed
source=("https://github.com/supermerill//SuperSlicer/archive/$_pkgtag.tar.gz"
        "start-superslicer.sh"
        "0001-wxgtk3-is-broken-on-wayland.patch")
sha512sums=('eeaabea0754220b3f9845cadc0f33cc9bb322ccf1e74ae7f94b855c23dfd9b08a083210aca16338eee7c652ab6bb5bae01b0a216f6d0a664af7c7db866298214'
            '9a91e374b606447889ac517061fe559d7cbc7c6b2a79d521d46205b6ffdb8264e6fbcc09f62a6c6e462c1172b0ed08b1d4ddf839a3cc448ae1717888f1df287e'
            'acf35ebe467e9fb30f1b77d15348f1a7b82dcf45a5b829e375e972b5d6b49968603b3fa090c4d1f56e8b5148e2b820e79afa269da60ace70de1ceadcf6e820c5')

prepare()
{
	cd "$srcdir/SuperSlicer-$_pkgtag"

	# disabling tests is not enough, we need to remove them explicitly
	sed -i 's,add_subdirectory(test),,g' src/CMakeLists.txt

	# apply patches
	patch --forward --strip=1 --input="$srcdir/0001-wxgtk3-is-broken-on-wayland.patch"
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
