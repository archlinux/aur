#!/hint/bash
# Maintainer: Oliver Weissbarth <mail@oweissbarth.de>
# Contributor: bartus <arch-user-repository]a[bartus.33mail.com

pkgname=djv
pkgver=2.0.8
pkgrel=3
pkgdesc="Professional media review software for VFX, animation, and film production"
arch=("x86_64")
url="http://djv.sourceforge.net/"
license=('CUSTOM')
groups=()
depends=('ffmpeg' 'freetype2' 'glfw' 'glm' 'libjpeg' 'libpng' 'libtiff' 'opencolorio' 'openexr' 'python' 'rtaudio' 'zlib')
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
	"ffmpeg-install.patch")
noextract=()
sha256sums=('bee18559d8a04b361376741900f21f69c637b51306d2b504b67f125dd14fd427'
            'ca440bc9c1713e9edb17ed5adc0456441e69af25f803c834427f23a6991e2eca'
            'e2bb0b7ebccd1e645d9a62f0c6dadafb94705766c787a2ea38b91b1da4e95cf7'
            'edd3888cc651edcd2cc5d03fcde44283f75de7aee04cc9f02eafdb108140dfdf'
            'f002c2586bed5c97f78a329379a85988c270751fc46cd6e9dd05103a52728618'
            '50474a248f3259b6cf0a1439dc9fd4e34f211113e5f64116cb6df95bee8271f0'
            'e923d4abd6d2233ac6464773ff771ea7115cba8ed3fc2d1955b2129ff014272e')


prepare() {
	patch -b ${pkgname^^}-${pkgver}/CMakeLists.txt -i disable_tests_and_examples.patch
	patch -b ${pkgname^^}-${pkgver}/third-party/CMakeLists.txt -i drop-third-party.patch
	patch -b ${pkgname^^}-${pkgver}/cmake/Modules/FindRtAudio.cmake -i rtaudio-hint.patch
	patch -b ${pkgname^^}-${pkgver}/cmake/Modules/FindFFmpeg.cmake -i ffmpeg-install.patch
	
	# Remove assert macro
	sed -i '44,51d' ${pkgname^^}-${pkgver}/lib/djvCore/Core.h
	sed -i '44i#ifdef DJV_ASSERT \n #undef DJV_ASSERT\n#endif\n#define DJV_ASSERT(value)' ${pkgname^^}-${pkgver}/lib/djvCore/Core.h
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
