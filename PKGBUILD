# SPDX-License-Identifier: AGPL-3.0
# Maintainer: Dominic git at msrd0 dot de
# Maintainer: Lukas1818 aur at lukas1818 dot de

pkgname=superslicer-prerelease
pkgver=2.7.61.10
_pkgtag=$pkgver
# https://github.com/supermerill/SuperSlicer/blob/2.7.61.0/deps/%2BLibBGCode/LibBGCode.cmake
_libbgcode=6f43cb004ef3d3bda37dde49f6235e24d2717629
pkgrel=1
epoch=1
pkgdesc="G-code generator for 3D printers (RepRap, Makerbot, Ultimaker etc.)"
arch=("$CARCH")
url="https://github.com/supermerill/SuperSlicer"
license=('AGPL3')
options=(!emptydirs)
depends=(
	'boost-libs'
	'cgal'
	'glew'
	'imath'
	'heatshrink'
	'libspnav'
	'nanosvg'
	'nlopt'
	'opencascade'
	'openvdb'
	'qhull>=2020.2-4'
	'slicer-udev'
	'wxwidgets-gtk3'
)
makedepends=(
	'boost'
	'cereal>=1.3.0'
	'cmake'
	'eigen'
	'libigl'
	'mold'
	'ninja'
	'openvdb'
)
optdepends=('superslicer-profiles: Predefined printer profiles')
provides=("superslicer=$epoch:$pkgver")
conflicts=('superslicer' 'superslicer-git')
source=("https://github.com/supermerill/SuperSlicer/archive/$_pkgtag.tar.gz"
        "https://github.com/prusa3d/libbgcode/archive/$_libbgcode.tar.gz"
        "0001-libbgcode-binarize-public-deps.patch"
        "0001-findwxwidgets.patch"
        "0002-addlib-expat.patch"
        "0003-openexr3.patch"
        "0004-cgal6.patch"
        "0005-boost-process-includes.patch"
	    "0006-fix-broken-assertions-without-debuginfo.patch")
sha512sums=('f7a74145b2ca254b84db968b5e7984af36f2874a9188e05de7d638558e1ce305fddd3604a1b3a93942b6942dcfe8321b4d5ba1d387b8b9f769e724eaaf501259'
            '04cb7cb69d887e1fa5ced5c0219b0ee6cab81f09d1bc1226ebd26563e2ce60b85fb6e5aef11a36dffd3e00779849906fc5c19ad2cdd22d45360226912b6af31b'
            'ecbe9bdec72a372dfdc25b32dee382a9937c544567fa2da42a30467ddff2594495bf244a773401f655930301a2debc94636a362383239fa08808d0e51bc687a4'
            '1b8561d0f148ce2c38b7211eb78facc6e0cc2b89481e7c7700353534c7946a7b885e517852597b3252c6c21de527736f406f27ab01833d0f275c64103a8111f7'
            '93a943eb9be52085a811d7cc8379dc5a3942befdc3d19eecf6310f8dfcfdef72bfa15dfcb85ac1f4f9d7731c973b9815a532ae444e3fe275f8f624825fe8e98b'
            'd87f74ceee99c288b7df57c8d6927649d7af08077c89263bafa48babce74435c1d48a5e5d2904d8307cb15c99df20ac196f78fcd0c5f31b737de1897ccb15a14'
            '8b04e2679257d8ebec1170c2d912d2b193349de47f95b28a4eede49f4a8c35a247b46b6fc543dc3efd800203dcc707d2cc68a13dc7b8816a46b95024ff3f09a5'
            '5ad401ac4d819d0a32166995ea6f826d10e1d990e2504c60b8de665b293008ed776b6a6cb7c0eb0088096510d309a349f2612decdfd4722cb0e90fa86aa1b695'
            '83e21e1842bd6fdcf043f93cb27adb1a586fbab2b64bf86064db16e91843ff4a03f1454ecee32d373da7effe31b46f2e80b9560b6bbc73f2d9b444d96b861cec')

_apply_patches() {
	for patch in "${@}"
	do
		msg2 "Applying patch $patch"
		patch -Np1 -i "$patch"
	done
}

prepare() {
	cd "$srcdir/libbgcode-$_libbgcode"
	rm -rf build
	mkdir -p build

	_apply_patches \
		"$srcdir/0001-libbgcode-binarize-public-deps.patch"

	cd "$srcdir/SuperSlicer-$_pkgtag"
	rm -rf build # build fails everytime if it isn't a clean build?!?
	mkdir -p build

	# disabling tests is not enough, we need to remove them explicitly
	sed -i 's,add_subdirectory(test),,g' src/CMakeLists.txt

	# apply patches for superslicer
	_apply_patches \
		"$srcdir/0001-findwxwidgets.patch" \
		"$srcdir/0002-addlib-expat.patch" \
		"$srcdir/0003-openexr3.patch" \
		"$srcdir/0004-cgal6.patch" \
		"$srcdir/0005-boost-process-includes.patch" \
		"$srcdir/0006-fix-broken-assertions-without-debuginfo.patch"
}

build() {
	_ninjaflags="$NINJAFLAGS"
	[ -z "$_ninjaflags" ] && [ -n "$CI" ] && _ninjaflags="-j2"
	[ -z "$_ninjaflags" ] || msg2 "Using ninja flags $_ninjaflags"
	
	msg2 "Building libbgcode"
	cd "$srcdir/libbgcode-$_libbgcode"
	cd build
	
	cmake .. \
		-G Ninja \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX= \
		-DLibBGCode_BUILD_CMD_TOOL=OFF \
		-DLibBGCode_BUILD_TESTS=OFF \
		-Wno-dev
	ninja $_ninjaflags
	mkdir destdir
	DESTDIR=destdir ninja install
	export "CMAKE_PREFIX_PATH=$PWD/destdir:$CMAKE_PREFIX_PATH"

	msg2 "Building SuperSlicer"
	cd "$srcdir/SuperSlicer-$_pkgtag"
	cd build

	cmake .. \
		-G Ninja \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_MESSAGE_LOG_LEVEL=DEBUG \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_EXE_LINKER_FLAGS="-fuse-ld=mold" \
		-DCMAKE_SHARED_LINKER_FLAGS="-fuse-ld=mold" \
		-DOpenGL_GL_PREFERENCE=GLVND \
		-DSLIC3R_FHS=ON \
		-DSLIC3R_STATIC=OFF \
		-DSLIC3R_WX_STABLE=ON \
		-DSLIC3R_GTK=3 \
		-DSLIC3R_BUILD_TESTS=OFF \
		-DSLIC3R_ALPHA=ON \
		-Wno-dev
	ninja $_ninjaflags
}

package() {
	cd "$srcdir/SuperSlicer-$_pkgtag/build"

	DESTDIR="$pkgdir" ninja install
	test ! -h "$pkgdir/usr/share/SuperSlicer/resources" || rm "$pkgdir/usr/share/SuperSlicer/resources"
	rm -r "$pkgdir/usr/lib/udev" # provided by slicer-udev
}
