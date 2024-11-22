# SPDX-License-Identifier: APGL-3.0
# Maintainer: Dominic git at msrd0 dot de
# Maintainer: Lukas1818 aur at lukas1818 dot de

pkgname=superslicer-prerelease
pkgver=2.5.60.0
_pkgtag=$pkgver
pkgrel=2
epoch=1
pkgdesc="G-code generator for 3D printers (RepRap, Makerbot, Ultimaker etc.)"
arch=("$CARCH")
url="https://github.com/supermerill/SuperSlicer"
license=('AGPL3')
options=(!emptydirs)
depends=('boost-libs>=1.73.0' 'cgal' 'glew' 'imath' 'libspnav' 'nlopt' 'openvdb' 'qhull>=2020.2-4' 'slicer-udev' 'wxwidgets-gtk3')
makedepends=('boost>=1.73.0' 'cereal>=1.3.0' 'cmake' 'eigen' 'libigl' 'openvdb' 'samurai')
optdepends=('superslicer-profiles: Predefined printer profiles')
provides=("superslicer=$epoch:$pkgver")
conflicts=('superslicer' 'superslicer-git')
source=("https://github.com/supermerill/SuperSlicer/archive/$_pkgtag.tar.gz"
        "0001-boost1.79.patch"
        "0002-fix-cereal.patch"
        "0003-openexr3.patch"
        "0004-fix-opencascade-version-check.patch"
        "0005-fix-opencascade-libs.patch"
        "0006-fix-non-const-lvalue.patch"
        "0007-boost1.84.patch"
        "0008-boost1.85.patch"
        "0009-fix-multiple-choice.patch"
        "0010-occtwrapper-install-dir.patch")
sha512sums=('a53f4cc9b5a20f3f60d38553d47bfd19ce8bd739a8a16493bbcf64f75825fa760b8c107d7f927d49d967f7d067fac8c428c8f6e67219e74b0970d9ab7aa5b9e6'
            'fc18e8edf516f9479c3b0e201d1c74b42289f15ef8a64ff3a88c2bb14613978a9dcf7be50ff8b79faf054c7721a095a70715b0fb0747be48757f9502ba0eb859'
            '58467732161eb0abe58cfb1e64e080f64f9f2221032b0d6176739fc81a61fe7838fa6479e9aac7fa0ee9805898f9293081c5e35a146df103830199b46354b97e'
            '840e51b8feb3568ff46d309ece063f7188018fcaa43d19ec50ede408fdf2c237a3b7eaa11ba24409d8c3f7d6f5fb270181508cc56e0b2b0fef68b766130ef1eb'
            '4efb6dd48c8184f47b838228cf624a74429f35d133fb85316ddcde9d78bd462d64009ec9fe0b3f34232ddf4971f81ea03385ed661c771de9f0fd5bffcbe2a74c'
            'a01abf748f82bc423f2c012ac430f78cfd5e56dede1d5999376e780267d0302d9a2a80c3eb15226c2f82102dda4c567c721ff99ab1fdeef504cbf9d9cb63ca53'
            'aca3a028eaab63baf83dd80d82615394435c97b9b45c99764ca84995d246096e3e5c2b564ed29e194652c8e221a80cf6abdc165cb3009fd20af586b0432b2bc9'
            'a92af974cb62901aab5a5c8c34672e9a7c90ea7246bbd7423421a9b7ee12a7b17073d90a6f36f994328c7dc9c2d0a6e4fd18c980a71863bc530d873ebaa80433'
            'ca9f407d87d8dd0181077bc2da5a8e2f8995eed88a4787b73ee6c62ef6d2380fd1394fe5412cdc34276d4182bce6f272173e9ccb653d1e28978e16f379114002'
            '6d7ab93042a75f04e1c3c8f294d19dd39abaf22aa75caf996c6a0cf753f6472134a3d4fa443b73924800b2d3a710416a931745c168911c0df3709fb71ec00570'
            '92929ba1cb6ee104a10f34a649eba3789ca02f1725104a57412279ff68c46614b1812b13e7dcdf0d235618b9f2a868b4798b1404d9e712d9f1efd46e6c71fcb5')

prepare()
{
	cd "$srcdir/SuperSlicer-$_pkgtag"
	[ ! -f build/Makefile ] || rm -rf build
	rm -rf build # build does fail everytime if it is not clean build ?
	mkdir -p build

	# disabling tests is not enough, we need to remove them explicitly
	sed -i 's,add_subdirectory(test),,g' src/CMakeLists.txt

	# apply patches
	patch -Np1 -i "$srcdir/0001-boost1.79.patch"
	patch -Np1 -i "$srcdir/0002-fix-cereal.patch"
	patch -Np1 -i "$srcdir/0003-openexr3.patch"
	patch -Np0 -i "$srcdir/0004-fix-opencascade-version-check.patch"
	patch -Np1 -i "$srcdir/0005-fix-opencascade-libs.patch"
	patch -Np1 -i "$srcdir/0006-fix-non-const-lvalue.patch"
	patch -Np1 -i "$srcdir/0007-boost1.84.patch"
	patch -Np1 -i "$srcdir/0008-boost1.85.patch"
	patch -Np1 -i "$srcdir/0009-fix-multiple-choice.patch"
	patch -Np1 -i "$srcdir/0010-occtwrapper-install-dir.patch"
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
		-DSLIC3R_ALPHA=ON \
		-Wno-dev

	samu
}

package()
{
	cd "$srcdir/SuperSlicer-$_pkgtag/build"

	DESTDIR="$pkgdir" samu install
	test ! -h "$pkgdir/usr/share/SuperSlicer/resources" || rm "$pkgdir/usr/share/SuperSlicer/resources"
	rm -r "$pkgdir/usr/lib/udev" # provided by slicer-udev
}
