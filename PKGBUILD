#!/hint/bash
# Maintainer: Oliver Weissbarth <mail@oweissbarth.de>
# Contributor: SFN
# Contributor: bartus <arch-user-repository]a[bartus.33mail.com

pkgname=djv
pkgver=3.2.1
pkgrel=1
pkgdesc="Professional media review software for VFX, animation, and film production"
arch=("x86_64")
url="https://darbyjohnston.github.io/DJV/"
license=('BSD-3-Clause')
groups=()
depends=('ffmpeg' 'freetype2' 'glm' 'libjpeg' 'libpng' 'libtiff' 'opencolorio' 'openexr>=3.0.0' 'python' 'rtaudio' 'zlib' 'tl-render')
makedepends=('cmake')
replaces=()
backup=()
options=()
source=("${pkgname}-${pkgver}.tgz::https://github.com/darbyjohnston/${pkgname^^}/archive/$pkgver.tar.gz"
	"djv.desktop"
	"djv.sh"
	"FindZLIBNG.cmake")
noextract=()
sha256sums=('ad7249d648f577685c3d668b56aab722f8274763f7a813f4820f5bc82ff8367f'
            'ca440bc9c1713e9edb17ed5adc0456441e69af25f803c834427f23a6991e2eca'
            'e2bb0b7ebccd1e645d9a62f0c6dadafb94705766c787a2ea38b91b1da4e95cf7'
            '2dd0e684b08cbbf8412129331eb33c61a2df7996bb3cbb6c89842dd27349f1f9')

prepare() {
	mv FindZLIBNG.cmake ${pkgname^^}-${pkgver}/cmake/Modules/FindZLIBNG.cmake #Fix a bug where it looks for ZLIBNG not ZLIB-NG
}

build() {

	cmake -S "${pkgname^^}-${pkgver}" -B ${pkgname^^}-Release \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX="" \
		-DCMAKE_INSTALL_RPATH=""

	cmake --build ${pkgname^^}-Release --parallel
}

package() {
	DESTDIR=${pkgdir}/opt/${pkgname}/ make -C ${srcdir}/${pkgname^^}-Release/bin/djv/ install
	cp -r "$srcdir/${pkgname^^}-${pkgver}/docs" "$pkgdir/opt/${pkgname}/"
	cp -r "$srcdir/${pkgname^^}-${pkgver}/etc" "$pkgdir/opt/${pkgname}/"
	install -D -m644 "${srcdir}/${pkgname^^}-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
	install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -D -m644 "${srcdir}/${pkgname^^}-${pkgver}/etc/Icons/DJV_Icon_512.svg" "${pkgdir}/usr/share/pixmaps/djv.svg"
	
	install -d -m755 "${pkgdir}/usr/bin/"
	for file in "${pkgdir}/opt/${pkgname}"/bin/*; do
		ln -s "/opt/${pkgname}/bin/${file##*/}" "${pkgdir}/usr/bin/${file##*/}"
	done
	
	install -D -m655 "${srcdir}/djv.sh" "${pkgdir}/usr/bin/djv"
}
