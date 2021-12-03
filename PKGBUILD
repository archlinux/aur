# Maintainer: zoorat <zoorat [at] protonmail [dot] com>
# Contributor: Original submitter's  Dimitris Kiziridis <ragouel at outlook dot com>

_pkgname="opencomic"
pkgname="$_pkgname-bin"
pkgver=0.2.1
pkgrel=3

pkgdesc="Comic and Manga reader, written with Node.js and using Electron."
arch=('x86_64')
url="https://github.com/ollm/OpenComic"
license=('GPL3')

depends=(gtk3 lib32-gcc-libs nodejs nss)
provides=("$_pkgname")
conflicts=("$_pkgname")
# replaces=("$_pkgname")
# options=(debug !strip emptydirs zipman)
options=(strip emptydirs zipman)
# install="$pkgname.install"

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ollm/OpenComic/releases/download/v${pkgver}/opencomic-${pkgver}.x86_64.rpm")
b2sums=('d2d7effcd0e63fae25c95905d0e1d8a571b25d1ca073af7bebfc3efda25a90423d7a4307cb205be0c5bac91aa92aba65cda2b4cc9406a177ef2c868b4d70c310')

build() {
	# modifying .desktop file
	sed -i -E "s|Exec=/opt/OpenComic/opencomic|Exec=/usr/bin/${_pkgname}|" "usr/share/applications/${_pkgname}.desktop"
}

package() {
	# copying file
	install -vdm 755 "${pkgdir}/usr/share/"
	cp -vaR usr/share/* "${pkgdir}/usr/share/"
	install -vdm 755 "${pkgdir}/opt/${pkgname}"
	cp -vaR opt/OpenComic/* "${pkgdir}/opt/${pkgname}"

	# Fix permissions
	for d in locales resources; do
		chmod -v 755 "${pkgdir}/opt/${pkgname}/$d"
		find "${pkgdir}/opt/${pkgname}/$d" -type d -exec chmod -v 755 {} +
	done

	# Link entry point
	install -vdm 755 "${pkgdir}/usr/bin"
	ln -vsf "/opt/${pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	# Remove unused files
	rm -vrf "${pkgdir}/usr/lib"
	rm -vrf "${pkgdir}/opt/${pkgname}"/{usr,swiftshader,AppRun,${_pkgname}.{desktop,png}}
	rm -vrf "${pkgdir}/opt/${pkgname}"/{libGLESv2.so,libEGL.so,libvk_swiftshader.so,libvulkan.so}
	rm -vrf "${pkgdir}/opt/${pkgname}/resources/app.asar.unpacked/unrar"
	rm -vrf "${pkgdir}/opt/${pkgname}/resources/app.asar.unpacked/node_modules/7zip-bin/mac"
	rm -vrf "${pkgdir}/opt/${pkgname}/resources/app.asar.unpacked/node_modules/7zip-bin/linux/"/{arm64/,arm/,ia32/}
	rm -vrf "${pkgdir}/opt/${pkgname}"/{locales,LICENSE*}
}
