# Maintainer: YidaozhanYa <yidaozhan_ya@outlook.com>
# Maintainer: YidaozhanYa <yidaozhan_ya@outlook.com>
pkgname=com.seewo.easinote5
pkgver=5.1.17.2126
pkgrel=2
pkgdesc="Seewo EasiNote5 希沃白板 5，为互动教学而生。"
arch=('x86_64')
url="https://easinote.seewo.com/"
#url="https://gitlab.gz.cvte.cn/front-end/enow-cloud"
license=('MIT')
depends=('desktop-file-utils' 'gtk3' 'libnotify' 'libxss' 'libxtst' 'nss' 'xdg-utils' 'libunistring')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("EasiNote5.deb::http://static.cvte.com/file/myou/uploads/android_rom/1aca70f7b5682c38298aff6d3105613e6b38f2d2/EasiNote5_5.1.17.2126-66e81.deb")
sha512sums=('4707bf47942ffa3340c4f7e0e49be576bcf5c8d8df2f9c7e93c68b60da1021b5a5302d04b3c092236add2c5863184598203751040037ce854f0bcc6b08f3e0e8')

prepare(){
	tar xf data.tar.xz -C "${pkgdir}"
}

package(){
	LANG_SAVE="$LANG"
	LC_ALL_SAVE="$LC_ALL"
	export LANG="en_US.UTF-8"
	export LC_ALL="en_US.UTF-8"
	mkdir -p "${pkgdir}/usr/share/applications"
	install -D -m644 "${pkgdir}/opt/apps/${pkgname}/files/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	STARTUP_SCRIPT="${pkgdir}/opt/apps/${pkgname}/files/${pkgname}.sh"
	sed -i "1i\#!/usr/bin/bash" "${STARTUP_SCRIPT}"
	sed -i 's#cp \$appPath/entries/applications/\$appid\.desktop \$desktopPath#printf "skip copy desktop icon"#'  "${STARTUP_SCRIPT}"
	cp "${pkgdir}/opt/apps/${pkgname}/entries/applications/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

	# fix libunistring.so
	ln -sf "/usr/lib/libunistring.so" "${pkgdir}/opt/apps/${pkgname}/files/resources/public/lib/libunistring.so.2"

	export LANG="$LANG_SAVE"
	export LC_ALL="$LC_ALL_SAVE"
}
