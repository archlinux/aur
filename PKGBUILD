# Maintainer: 302606571@qq.com
# Contributor: luosoy <249799588@qq.com>
pkgname=com.qq.weixin.work.deepin-x11
pkgver=4.1.6.6017deepin5.1
deepin_app=com.qq.weixin.work.deepin
pkgrel=1
epoch=
pkgdesc="Deepin Wine Weixin Work on x11"
arch=('i686' 'x86_64')
url="https://work.weixin.qq.com/"
license=('Proprietary')
groups=()
depends=(
        'lib32-alsa-plugins' 'lib32-glib2' 'lib32-glibc' 'libgphoto2'
        'lib32-gst-plugins-base-libs' 'lib32-lcms2' 'lib32-libldap' 'lib32-mpg123'
        'lib32-openal' 'lib32-libpcap' 'lib32-libcanberra-pulse' 'lib32-libudev0-shim'
        'lib32-libusb' 'lib32-vkd3d' 'lib32-libx11' 'lib32-libxext' 'lib32-libxml2'
        'lib32-ocl-icd' 'deepin-udis86' 'lib32-zlib' 'lib32-ncurses' 'lib32-fontconfig'
        'lib32-freetype2' 'lib32-gettext' 'lib32-libxcursor' 'lib32-mesa' 'lib32-libjpeg6'
        'lib32-libxrandr' 'lib32-libxi' 'lib32-glu' 'deepin-wine-helper' 'deepin-wine6-stable' 'p7zip'
		'spark-dwine-helper'
    )
makedepends=('tar')
checkdepends=()
optdepends=()
provides=()
conflicts=('deepin-wxwork' 'com.qq.weixin.work.deepin')
replaces=()
backup=()
options=()
install=
changelog=
source=("https://mirrors.sdu.edu.cn/spark-store-repository/store/chat/com.qq.weixin.work.deepin/${deepin_app}_${pkgver}_all.deb")
# source=("https://com-store-packages.uniontech.com/appstore/pool/appstore/c/${deepin_app}/${deepin_app}_${pkgver}_all.deb")
# source=("./${deepin_app}_${pkgver}_all.deb")
# 换为对象存储的zst文件
noextract=("${deepin_app}_${pkgver}_all.deb")
md5sums=('abb941d9173a153e8c9946dc9cc51a74')
validpgpkeys=()

prepare() {
	rm -rf ${deepin_app}-${pkgver}
	ar -x ${deepin_app}_${pkgver}_all.deb
	mkdir ${deepin_app}-${pkgver}
	tar -xf data.tar.xz --directory="${deepin_app}-${pkgver}"
	tar -xf ../lib.tar.xz --directory="${deepin_app}-${pkgver}"/opt/apps/${deepin_app}/
	cp -rf ../run.sh "${deepin_app}-${pkgver}"/opt/apps/${deepin_app}/files/run.sh
}

pre_install() {
	rm -rf /opt/apps/com.qq.weixin.work.deepin
}

pre_upgrade() {
	rm -rf /opt/apps/com.qq.weixin.work.deepin/files/dlls
}

package() {
	cd "${deepin_app}-${pkgver}"
	cp -rf ./ ${pkgdir}/
	mkdir -p ${pkgdir}/usr/share/applications
	install -Dm644 ${srcdir}/${deepin_app}-${pkgver}/opt/apps/${deepin_app}/entries/applications/${deepin_app}.desktop ${pkgdir}/usr/share/applications/${deepin_app}.desktop
	cp -rf ${srcdir}/${deepin_app}-${pkgver}/opt/apps/${deepin_app}/entries/icons/ ${pkgdir}/usr/share/
	# 更换为deepin-win6 解决汇报新建日报以及查看我提交的日报白屏问题

	# history
	# 更换为deepin-wine5 (6存在拖动边框 任务栏的图标闪烁异常 搜索框弹不出来）
	# sed s#deepin-wine6#deepin-wine5#g /opt/apps/${deepin_app}/files/run.sh

	# 解决更新到 gtk3 后，在 wayland 环境下，发送文件的对话框无法弹出，无法下载和发送文件,点击发送文件或者下载一个文件然后就卡死了
	# GDK_BACKEND=x11

	# 解决deepin 编译deepin-wine6-stable的时候还是使用旧的依赖链，所以程序使用网络时在系统里找不到旧版libldap/libber而停止运行
	# cp -r /opt/apps/com.qq.weixin.deepin/lib /opt/apps/${deepin_app}/lib
	# echo "export LD_LIBRARY_PATH=/opt/apps/${deepin_app}/lib" >> /opt/apps/${deepin_app}/files/run.sh
	# cd ${srcdir}
	# cd ..
	# sudo mkdir -p /opt/apps/${deepin_app}/files
	# sudo cp -rf ./lib /opt/apps/${deepin_app}/
	# sudo cp -rf ./run.sh /opt/apps/${deepin_app}/files/run.sh
}
