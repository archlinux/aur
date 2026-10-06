#!/hint/bash
# Maintainer: Oliver Weissbarth <mail@oweissbarth.de>
# Contributor: SFN
# Contributor: bartus <arch-user-repository]a[bartus.33mail.com

pkgname=djv
pkgver=3.7.4
pkgrel=1
pkgdesc="Professional media review software for VFX, animation, and film production"
arch=("x86_64")
url="https://grizzlypeak3d.github.io/DJV/"
license=('BSD-3-Clause')
groups=()
depends=('python' 'zlib' 'tl-render')
makedepends=('cmake')
replaces=()
backup=()
options=()
source=("${pkgname}-${pkgver}.tgz::https://github.com/grizzlypeak3d/${pkgname^^}/archive/$pkgver.tar.gz" "0001-Don-t-unconditionally-include-libraw-in-package.patch" "0002-Honor-destdir-when-installing-navigation-doc.patch")
noextract=()
sha256sums=('b0d23e31093db5102f637f93ddfe0cf785d3f1ece84a999abb293aa6b8657b54'
            'dffb16494d5e8b84d322502e516f965d57905d2b51f5cf87ac91b7e299233e09'
            '218fd3f8e4f5f7b969a34f19681f8ca373d4e51d8fb78182002d3636adc24458')


build() {

  patch -p1 -d "${srcdir}/${pkgname^^}-${pkgver}" < "${srcdir}/0001-Don-t-unconditionally-include-libraw-in-package.patch"
  patch -p1 -d "${srcdir}/${pkgname^^}-${pkgver}" < "${srcdir}/0002-Honor-destdir-when-installing-navigation-doc.patch"
	cmake -S "${pkgname^^}-${pkgver}" -B ${pkgname^^}-Release \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX="/usr" \
		-DCMAKE_INSTALL_RPATH="" \
    -DDJV_TLRENDER_PACKAGE=ON

	cmake --build ${pkgname^^}-Release --parallel
}

package() {
  DESTDIR="${pkgdir}" cmake --install ${pkgname^^}-Release
	install -D -m644 "${srcdir}/${pkgname^^}-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
	install -D -m644 "${srcdir}/${pkgname^^}-${pkgver}/etc/Linux/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -D -m644 "${srcdir}/${pkgname^^}-${pkgver}/etc/Icons/DJV_Icon.svg" "${pkgdir}/usr/share/pixmaps/djv.svg"
}
