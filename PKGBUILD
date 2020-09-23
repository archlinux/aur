# Maintainer: Oliver Weissbarth <mail@oweissbarth.de>
pkgname=djv
pkgver=2.0.8
pkgrel=2
pkgdesc="Professional media review software for VFX, animation, and film production"
arch=("x86_64")
url="http://djv.sourceforge.net/"
license=('CUSTOM')
groups=()
depends=('glm' 'libjpeg' 'libpng' 'libtiff' 'ffmpeg' 'openexr' 'rtaudio')
makedepends=('cmake')
replaces=()
backup=()
options=()
source=("https://github.com/darbyjohnston/DJV/archive/$pkgver.tar.gz" "djv.desktop" "djv.sh" "CMakeLists.patch")
noextract=()
md5sums=('3b5df10a31591b21441ea2512da34c6b' 'SKIP' 'SKIP' 'SKIP'
)


prepare() {
	if [ -d "${pkgname}-${pkgver}" ]; then rm -R ${pkgname}-${pkgver}; fi
	tar -xzf ${pkgver}.tar.gz
	mv DJV-${pkgver} ${pkgname}-${pkgver}
	cd "$srcdir/"
	export DJV_BUILD=$PWD
	export LD_LIBRARY_PATH=$DJV_BUILD/DJV-install/lib:$LD_LIBRARY_PATH
	
	patch ${pkgname}-${pkgver}/CMakeLists.txt < CMakeLists.patch
	
	# Remove assert macro
	sed -i '44,51d' ${pkgname}-${pkgver}/lib/djvCore/Core.h
	sed -i '44i#ifdef DJV_ASSERT \n #undef DJV_ASSERT\n#endif\n#define DJV_ASSERT(value)' ${pkgname}-${pkgver}/lib/djvCore/Core.h
}

build() {
	cd "$srcdir/"
	ncores=$(grep -c ^processor /proc/cpuinfo)
	
	
	mkdir -p DJV-third-party
	cd DJV-third-party
	cmake ../${pkgname}-${pkgver}/third-party -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$DJV_BUILD/DJV-install
	cmake --build . -j ${ncores}
	cmake --build . -j ${ncores} --target install
	cd ..
	
	mkdir -p DJV-Release
	cd DJV-Release
	cmake ../${pkgname}-${pkgver} -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$DJV_BUILD/DJV-install -DCMAKE_PREFIX_PATH=$DJV_BUILD/DJV-install -DCMAKE_INSTALL_RPATH=""

	cmake --build . -j ${ncores}
	cmake --build . -j ${ncores} --target install

}

package() {
	mkdir -p $pkgdir/opt/${pkgname}/bin
	cp $srcdir/DJV-install/bin/djv* $pkgdir/opt/${pkgname}/bin/
	cp -r $srcdir/DJV-install/docs $pkgdir/opt/${pkgname}/
	cp -r $srcdir/DJV-install/etc $pkgdir/opt/${pkgname}/
	install -D -m644 $srcdir/${pkgname}-${pkgver}/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
	install -D -m644 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
	install -D -m644 "${srcdir}/${pkgname}-${pkgver}/etc/Icons/djv-app-icon-512.svg" "${pkgdir}/usr/share/pixmaps/djv.svg"
	
	mkdir -p ${pkgdir}/usr/bin/
	for x in djv_info djv_ls djv_test_pattern; do
		ln -s "/opt/${pkgname}/bin/$x" "${pkgdir}/usr/bin/$x"
	done
	
	install -D -m655 "${srcdir}/djv.sh" "${pkgdir}/usr/bin/djv"
	
}
