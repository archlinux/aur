# Maintainer: YidaozhanYa <yidaozhan_ya@outlook.com>
# Maintainer: YidaozhanYa <yidaozhan_ya@outlook.com>
pkgname=com.seewo.easicamera
pkgver=2.0.0.602
pkgrel=5
pkgdesc="Seewo EasiCamera 希沃视频展台，展示助力课堂"
arch=('x86_64')
url="https://e.seewo.com/product/EasiCamera"
license=('custom')
depends=('desktop-file-utils' 'gtk3' 'hicolor-icon-theme' 'libnotify' 'libxss' 'libxtst' 'openssl' 'xdg-utils' 'electron8-bin' 'ffmpeg' 'curl' 'jsoncpp' 'libidn2' 'systemd'
'python38'
# 'python' 'python-flask' 'python-pillow' 'python-numpy' 'python-opencv' 'python-wordninja' 'python-pyspellchecker' 'python-tensorflow' 'python-flask-bootstrap'
# 'python-polygon' 'paddleocr-git')
)
makedepends=('asar')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("https://github.com/YidaozhanYa/seewo-uos-bin/releases/download/2/com.seewo.easicamera.tar.gz")
sha512sums=('abe38ffe18b03dcf19bdb3c51c9f902e706d7ee72ab10249fd56cd2fa41f61860194e2c69c996a268810c99dbd213e91be69432ad1b8347d9ad8cf3badd1f905')

package(){
	mkdir -p "${pkgdir}/usr/share/applications"
	mkdir -p "${pkgdir}/opt/apps/${pkgname}"
	cp -r "${srcdir}/${pkgname}" "${pkgdir}/opt/apps"

	APP_ROOT="${pkgdir}/opt/apps/${pkgname}/files"
	LIBS_DIR="${APP_ROOT}/resources/public/lib"

	# 安装 Python 虚拟环境
	python3.8 -m venv "${APP_ROOT}/env"
	"${APP_ROOT}/env/bin/pip3" install paddlepaddle==1.8.5 paddleocr==1.1.1 protobuf==3.20.0 pillow flask flask-bootstrap pyspellchecker wordninja

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
	rm "${APP_ROOT}/LICENSE"*
	rm "${APP_ROOT}/resources.pak"
	rm "${APP_ROOT}/snapshot_blob.bin"
	rm "${APP_ROOT}/v8_context_snapshot.bin"
	rm "${APP_ROOT}/vk_swiftshader_icd.json"
	rm "${APP_ROOT}/easicamera" # 1! 5!

	# 剥离动态链接库
	rm "${LIBS_DIR}/libcrypto"*
	rm "${LIBS_DIR}/libcurl"*
	rm "${LIBS_DIR}/libidn2"*
	rm "${LIBS_DIR}/libjsoncpp"*
	rm "${LIBS_DIR}/libssl"*

	# systemd 相关
	install -D "${APP_ROOT}/seewo-hid.rules" "${pkgdir}/usr/lib/udev/rules.d/51-seewo-hid.rules"
	sed -i "s#/opt/apps/com.seewo.easicamera/files/easicamera#/usr/bin/electron8 ${APP_ROOT}/resources/app.asar#" "${APP_ROOT}/com.cvte.seewo.easicamera.service"
	install -D "${APP_ROOT}/com.cvte.seewo.easicamera.service" "${pkgdir}/usr/lib/systemd/system/easicamera.service"
	mkdir -p "${pkgdir}/etc/systemd/system/multi-user.target.wants"
	ln -sf "/usr/lib/systemd/system/easicamera.service" "${pkgdir}/etc/systemd/system/multi-user.target.wants/easicamera.service"

	# 更改 electron 中 python 路径
	mkdir -p "/tmp/asar_extract"
	asar e "${APP_ROOT}/resources/app.asar" "/tmp/asar_extract"
	sed -i 's#/usr/bin/python3#/opt/apps/com.seewo.easicamera/files/env/bin/python3#' "/tmp/asar_extract/main.prod.js"
	asar p "/tmp/asar_extract" "/tmp/app.asar"
	mv "/tmp/app.asar"  "${APP_ROOT}/resources/app.asar"

	pushd "${APP_ROOT}/resources/public/ocr-service"
	rm -rf "__pycache__"
	rm -rf "tools/__pycache__"
	rm -rf "tools/infer/__pycache__"
	#sed -i 's#from paddleocr.ppocr.utils.utility import initial_logger#from paddleocr.ppocr.utils.logging import get_logger#g' $(grep -rl initial_logger --include="*.py")
	#sed -i 's#initial_logger#get_logger#g' $(grep -rl initial_logger --include="*.py")
	#sed -i 's#check_and_read_gif#check_and_read#g' $(grep -rl check_and_read_gif --include="*.py")
	popd

	# 编辑启动脚本
	STARTUP_SCRIPT="${APP_ROOT}/${pkgname}.sh"
	sed -i 's#cp \$appPath/entries/applications/\$appid\.desktop \$desktopPath#printf "skip copy desktop icon"#' "${STARTUP_SCRIPT}"
	sed -i 's#\$appPath/files/easicamera#/usr/bin/electron8 /opt/apps/com.seewo.easicamera/files/resources/app.asar#' "${STARTUP_SCRIPT}"
	sed -i "1i\source /opt/apps/com.seewo.easicamera/files/env/bin/activate" "${APP_ROOT}/${pkgname}.sh"
	# sed "1i\export NODE_OPTIONS=--openssl-legacy-provider" "${APP_ROOT}/${pkgname}.sh"
	sed -i "1i\#!/bin/bash" "${APP_ROOT}/${pkgname}.sh"

	cp "${pkgdir}/opt/apps/${pkgname}/entries/applications/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

}
