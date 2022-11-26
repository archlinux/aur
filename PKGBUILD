# Maintainer: YidaozhanYa <yidaozhan_ya@outlook.com>
# Maintainer: YidaozhanYa <yidaozhan_ya@outlook.com>
pkgname=com.seewo.easinote5
pkgver=5.1.17.2126
pkgrel=3
pkgdesc="Seewo EasiNote5 希沃白板 5，为互动教学而生。"
arch=('x86_64')
url="https://easinote.seewo.com/"
# url="https://gitlab.gz.cvte.cn/front-end/enow-cloud"
license=('custom')
depends=('desktop-file-utils' 'gtk3' 'libnotify' 'libxss' 'libxtst' 'openssl' 'xdg-utils' 'electron8-bin' 'ffmpeg' 'curl' 'jsoncpp' 'libidn2')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("EasiNote5.deb::http://static.cvte.com/file/myou/uploads/android_rom/1aca70f7b5682c38298aff6d3105613e6b38f2d2/EasiNote5_5.1.17.2126-66e81.deb")
sha512sums=('4707bf47942ffa3340c4f7e0e49be576bcf5c8d8df2f9c7e93c68b60da1021b5a5302d04b3c092236add2c5863184598203751040037ce854f0bcc6b08f3e0e8')

package(){

	tar xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
	LANG_SAVE="$LANG"
	LC_ALL_SAVE="$LC_ALL"
	export LANG="en_US.UTF-8"
	export LC_ALL="en_US.UTF-8"
	mkdir -p "${pkgdir}/usr/share/applications"

	APP_ROOT="${pkgdir}/opt/apps/${pkgname}/files"
	LIBS_DIR="${APP_ROOT}/resources/public/lib"

	# 剥离 electron
	rm -rf "${APP_ROOT}/locales"
	rm -rf "${APP_ROOT}/swiftshader"
	rm "${APP_ROOT}/chrome_"*".pak"
	rm "${APP_ROOT}/chrome-sandbox"
	rm "${APP_ROOT}/crashpad_handler"
	rm "${APP_ROOT}/icudtl.dat"
	rm "${APP_ROOT}/libEGL.so"
	rm "${APP_ROOT}/libffmpeg.so"
	rm "${APP_ROOT}/libGLESv2.so"
	rm "${APP_ROOT}/libvk_swiftshader.so"
	rm "${APP_ROOT}/LICENSE."*
	rm "${APP_ROOT}/resources.pak"
	rm "${APP_ROOT}/snapshot_blob.bin"
	rm "${APP_ROOT}/v8_context_snapshot.bin"
	rm "${APP_ROOT}/vk_swiftshader_icd.json"
	rm "${APP_ROOT}/EasiNote5" # 1! 5!

	# 剥离动态链接库
	rm "${LIBS_DIR}/libcrypto"*
	rm "${LIBS_DIR}/libcurl"*
	rm "${LIBS_DIR}/libidn2"*
	rm "${LIBS_DIR}/libjsoncpp"*
	rm "${LIBS_DIR}/libssl"*


	# 编辑启动脚本
	STARTUP_SCRIPT="${APP_ROOT}/${pkgname}.sh"
	sed -i "1i\#!/usr/bin/bash" "${STARTUP_SCRIPT}"
	sed -i 's#cp \$appPath/entries/applications/\$appid\.desktop \$desktopPath#printf "skip copy desktop icon"#' "${STARTUP_SCRIPT}"
	sed -i 's#\$appPath/files/EasiNote5#electron8 /opt/apps/com.seewo.easinote5/files/resources/app.asar#' "${STARTUP_SCRIPT}"

	cp "${pkgdir}/opt/apps/${pkgname}/entries/applications/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

	export LANG="$LANG_SAVE"
	export LC_ALL="$LC_ALL_SAVE"
}
