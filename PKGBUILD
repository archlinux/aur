# Maintainer: Lukas1818 aur at lukas1818 dot de

pkgname=superslicer
pkgver=2.2.54.2
_pkgtag=$pkgver
pkgrel=4
epoch=1
pkgdesc="G-code generator for 3D printers (RepRap, Makerbot, Ultimaker etc.)"
arch=('x86_64')
url="https://github.com/supermerill/SuperSlicer"
license=('AGPL3')
depends=('cgal' 'glew' 'nlopt' 'openvdb' 'wxgtk3-dev-opt' 'boost>=1.73.0' 'qhull>=2020.2-4')
replaces=('slic3r++')
makedepends=('cereal' 'cmake' 'eigen' 'libigl' 'openvdb' 'wxgtk2-dev-opt') # cmake doesn't detect wx if not both gtk2 and gtk3 are installed
source=("https://github.com/supermerill//SuperSlicer/archive/$_pkgtag.tar.gz"
        "superslicer.desktop"
        "start-superslicer.sh"
        "0001-wxgtk3-is-broken-on-wayland.patch"
        "0001-Replace-deprecated-Boost-header-in-admesh.patch"
        "https://raw.githubusercontent.com/archlinux/svntogit-community/1dea61c0b581ff5001d073689f68b0323740be93/trunk/prusa-slicer-openexr3.patch")
sha512sums=('3e28d28f463be49217d4aa19691bd190d644f86474786db69ec82d58090d2231a6c0add66eec59ac9f8c2169bfcd730a0c9deafd9df48182e92194bf6d2f39b6'
            '8f75de56ba3e29b9c650d2946bd11afcf406a7fd42d2620ec44e4e76f6b64626de720190ce0f8be29ba7c48f714bfa0a71c45f868bdce7bc1ac7dbbc0e9e7583'
            'abfbd056be518b1b733cddef6c430cc3c4199d5df13067574dd3269cf35b798e11b43f55f1dfb57d6d8ee1da06882825fef0f7a170a9b069b95e9aea1ec8f31d'
            'acf35ebe467e9fb30f1b77d15348f1a7b82dcf45a5b829e375e972b5d6b49968603b3fa090c4d1f56e8b5148e2b820e79afa269da60ace70de1ceadcf6e820c5'
            '9a860dbac69ca7a195ef43cb2b80a8b5cf2c34bddb91867aa8ba16bbb754ab68c4baf57fa7e2562f96facc435c64ed8445505edb152382dbc5106a509136a2c8'
            'c33c2414746bc9d7dceb5af59ecb4aed2189211fc3c8b144d712a39d3677ba4d366eb9b4dd05fbc3811954d69cd1273d714dc4536489fe153ac1aee2919e5c98')

prepare()
{
	cd "$srcdir/SuperSlicer-$_pkgtag"

	# disabling tests is not enough, we need to remove them explicitly
	sed -i 's,add_subdirectory(test),,g' src/CMakeLists.txt

	# apply patches
	patch --forward --strip=1 --input="$srcdir/0001-wxgtk3-is-broken-on-wayland.patch"
	patch --forward --strip=1 --input="$srcdir/0001-Replace-deprecated-Boost-header-in-admesh.patch"
	if pacman -qQi imath &> /dev/null # not all distros has already upgrade to openEXR 3
	then
		patch -p1 < "$srcdir/prusa-slicer-openexr3.patch" # Fix build with openEXR 3
	fi
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

	install -d "$pkgdir/usr/share/applications"
	install -m 644 "$srcdir/superslicer.desktop" "$pkgdir/usr/share/applications/"

	mv "$pkgdir/usr/bin/superslicer" "$pkgdir/usr/share/SuperSlicer"
	install -Dm 755 "${srcdir}/start-superslicer.sh" "${pkgdir}/usr/bin/superslicer"
}
