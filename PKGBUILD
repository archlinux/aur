# Maintainer: YidaozhanYa <yidaozhan_ya@outlook.com>
# Maintainer: YidaozhanYa <yidaozhan_ya@outlook.com>
pkgname=com.seewo.easinote5
pkgver=5.2.1.0.7679.65d
pkgrel=1
pkgdesc="Seewo EasiNote5 希沃白板 5，为互动教学而生。"
arch=('x86_64')
url="https://easinote.seewo.com/"
# url="https://gitlab.gz.cvte.cn/front-end/enow-cloud"
license=('custom')
depends=('desktop-file-utils' 'gtk3' 'libnotify' 'libxss' 'libxtst' 'openssl' 'xdg-utils' 'ffmpeg' 'curl' 'jsoncpp' 'libidn2')
makedepends=('patch' 'asar')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=(
	"EasiNote5.deb::http://static.cvte.com/file/myou/uploads/android_rom/1aca70f7b5682c38298aff6d3105613e6b38f2d2/EasiNote_Kylin_amd64_5.2.1.0.7679.65d(20230803142125)-41d0a.deb"
	"0001-patch-startup-script.patch"
	"0002-fake-bios-vendor.patch"
)
md5sums=(
	'41d0a74f9738eef7d68efbe896b37494'  # EasiNote5.deb
	'4b7afbc7035fc724e9dc76f517415b2b'  # 0001-patch-startup-script.patch
	'2c0594a6d6940cf3a65804c701ea0e27'  # 0002-fake-bios-vendor.patch
)

package() {
	tar xf "${srcdir}/data.tar.xz" -C "${pkgdir}"

	APP_ROOT="${pkgdir}/opt/apps/${pkgname}/files"
	LIBS_DIR="${APP_ROOT}/resources/public/lib"

	# 剥离动态链接库
	rm "${LIBS_DIR}/libcrypto"*
	rm "${LIBS_DIR}/libcurl"*
	rm "${LIBS_DIR}/libidn2"*
	rm "${LIBS_DIR}/libjsoncpp"*
	rm "${LIBS_DIR}/libssl"*

	# 启动器和图标
	mkdir -p "${pkgdir}/usr/share/"
	mv "${pkgdir}/opt/apps/${pkgname}/entries/icons" "${pkgdir}/usr/share/icons"
	mv "${pkgdir}/opt/apps/${pkgname}/entries/applications" "${pkgdir}/usr/share/applications"
	sed -i "s#Icon\=/opt/apps/com.seewo.easinote5/entries/icons/hicolor/256x256/apps/EasiNote5.png#Icon\=EasiNote5#" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

	# 编辑启动脚本
	STARTUP_SCRIPT="${APP_ROOT}/${pkgname}.sh"
	patch "$STARTUP_SCRIPT" <"${srcdir}/0001-patch-startup-script.patch"

	# 删除 alfred
	rm -rf "${APP_ROOT}/alfred"

	# 权限
	chmod +x "${APP_ROOT}/mirror/ENMirror"

	# 绕过启动校验
	echo 'seewo' >"${APP_ROOT}/resources/public/bios_version"

	asar e "${APP_ROOT}/resources/app.asar" "${APP_ROOT}/resources/app"
	rm "${APP_ROOT}/resources/app.asar"
	patch "${APP_ROOT}/resources/app/dist/utils/getBiosVendor.js" <"${srcdir}/0002-fake-bios-vendor.patch"
	rm -rf "${APP_ROOT}/resources/app/code"
}
