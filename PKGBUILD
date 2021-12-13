#!/hint/bash
# Maintainer: Oliver Weissbarth <mail@oweissbarth.de>
# Contributor: bartus <arch-user-repository]a[bartus.33mail.com

pkgname=djv
pkgver=2.0.8
pkgrel=5
pkgdesc="Professional media review software for VFX, animation, and film production"
arch=("x86_64")
url="http://djv.sourceforge.net/"
license=('CUSTOM')
groups=()
depends=('ffmpeg' 'freetype2' 'glfw' 'glm' 'libjpeg' 'libpng' 'libtiff' 'opencolorio1' 'openexr>=3.0.0' 'python' 'rtaudio' 'zlib')
makedepends=('cmake')
replaces=()
backup=()
options=()
source=("${pkgname}-${pkgver}.tgz::https://github.com/darbyjohnston/${pkgname^^}/archive/$pkgver.tar.gz"
	"djv.desktop"
	"djv.sh"
	"disable_tests_and_examples.patch"
	"drop-third-party.patch"
	"rtaudio-hint.patch"
	"ffmpeg-install.patch"
	"OCIO.patch"
	"OpenEXR.patch")
noextract=()
sha256sums=('bee18559d8a04b361376741900f21f69c637b51306d2b504b67f125dd14fd427'
			'ca440bc9c1713e9edb17ed5adc0456441e69af25f803c834427f23a6991e2eca'
			'e2bb0b7ebccd1e645d9a62f0c6dadafb94705766c787a2ea38b91b1da4e95cf7'
			'edd3888cc651edcd2cc5d03fcde44283f75de7aee04cc9f02eafdb108140dfdf'
			'f002c2586bed5c97f78a329379a85988c270751fc46cd6e9dd05103a52728618'
			'50474a248f3259b6cf0a1439dc9fd4e34f211113e5f64116cb6df95bee8271f0'
			'e923d4abd6d2233ac6464773ff771ea7115cba8ed3fc2d1955b2129ff014272e'
			'b145f3e57adda6e2216d936d4f6e5466a28eb9300d049f259af5bffef23dfbde'
			'86d64d8390c0fdc4f944ca9b55d7d7803c7f018d1f0e12098ffebc44ccbb2b00')


prepare() {
	patch -b ${pkgname^^}-${pkgver}/CMakeLists.txt -i disable_tests_and_examples.patch
	patch -b ${pkgname^^}-${pkgver}/third-party/CMakeLists.txt -i drop-third-party.patch
	patch -b ${pkgname^^}-${pkgver}/cmake/Modules/FindRtAudio.cmake -i rtaudio-hint.patch
	patch -b ${pkgname^^}-${pkgver}/cmake/Modules/FindFFmpeg.cmake -i ffmpeg-install.patch
	patch -b ${pkgname^^}-${pkgver}/cmake/Modules/FindOCIO.cmake -i OCIO.patch
	patch -p0 -i OpenEXR.patch
	
	# Remove assert macro
	sed -i '44,51d' ${pkgname^^}-${pkgver}/lib/djvCore/Core.h
	sed -i '44i#ifdef DJV_ASSERT \n #undef DJV_ASSERT\n#endif\n#define DJV_ASSERT(value)' ${pkgname^^}-${pkgver}/lib/djvCore/Core.h	
	
	#fix gcc:11 headers regression
	grep -lR "std::numeric_limits"|xargs sed -i '1 i\#include <limits>'
	#fix header relocation against openexr:3
	grep -lR "#include.*OpenColorIO"|xargs sed -i 's|OpenColorIO/|OpenColorIO1/|'
	#fix missing headers
	grep -lR "std::this_thread::sleep_for"|xargs sed -i '1 i\#include <thread>'

	# Workaround potential gcc11 bug: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=100381
	sed -i "28,32d" ${pkgname^^}-${pkgver}/lib/djvAV/ThumbnailSystem.h
	sed -i '7 i\#include <djvAV\/IO.h>'  ${pkgname^^}-${pkgver}/lib/djvAV/ThumbnailSystem.h

	# Fix fseq version
	sed -i '/GIT_REPOSITORY https:\/\/github.com\/darbyjohnston\/FSeq.git/a GIT_TAG 545fac6018100f7fca474b8ee4f1efa7cbf6bf45' ${pkgname^^}-${pkgver}/cmake/Modules/BuildFSeq.cmake
}

build() {
	export DJV_BUILD=$PWD
	export LD_LIBRARY_PATH=$DJV_BUILD/${pkgname^^}-install/lib:$LD_LIBRARY_PATH

	njobs=$(grep -Po -- '-j\s?[0-9]+'<<<"${MAKEFLAGS}") ||
	njobs=$(grep -c ^processor /proc/cpuinfo)
	
	echo 'Building third-party'
	cmake -S "${pkgname^^}-${pkgver}/third-party" -B ${pkgname^^}-third-party \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX="$DJV_BUILD/${pkgname^^}-install"
	cmake --build ${pkgname^^}-third-party -j "${njobs}"
	cmake --build ${pkgname^^}-third-party -j "${njobs}" --target install
	echo 'Finish building third-party'
	
	echo 'Building DJV'
	cmake -S "${pkgname^^}-${pkgver}" -B ${pkgname^^}-Release \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX="$DJV_BUILD/${pkgname^^}-install" \
		-DCMAKE_PREFIX_PATH="$DJV_BUILD/${pkgname^^}-install" \
		-DCMAKE_INSTALL_RPATH=""

	cmake --build ${pkgname^^}-Release -j "${njobs}"
	cmake --build ${pkgname^^}-Release -j "${njobs}" --target install
	echo 'Finished building DJV'
}

package() {
	install -D -m755 "$srcdir"/${pkgname^^}-install/bin/djv* -t "$pkgdir/opt/${pkgname}/bin/"
	cp -r "$srcdir/${pkgname^^}-install/docs" "$pkgdir/opt/${pkgname}/"
	cp -r "$srcdir/${pkgname^^}-install/etc" "$pkgdir/opt/${pkgname}/"
	install -D -m644 "${srcdir}/${pkgname^^}-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
	install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -D -m644 "${srcdir}/${pkgname^^}-${pkgver}/etc/Icons/djv-app-icon-512.svg" "${pkgdir}/usr/share/pixmaps/djv.svg"
	
	install -d -m755 "${pkgdir}/usr/bin/"
	for file in "${pkgdir}/opt/${pkgname}"/bin/*; do
		ln -s "/opt/${pkgname}/bin/${file##*/}" "${pkgdir}/usr/bin/${file##*/}"
	done
	
	install -D -m655 "${srcdir}/djv.sh" "${pkgdir}/usr/bin/djv"
}
