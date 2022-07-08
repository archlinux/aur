# Maintainer: 302606571@qq.com
# Contributor: luosoy <249799588@qq.com>
pkgname=com.qq.weixin.work.deepin
pkgver=3.1.12.6001deepin8
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
        'lib32-libxrandr' 'lib32-libxi' 'lib32-glu' 'deepin-wine-helper' 'deepin-wine5-stable' 'p7zip'
    )
makedepends=('tar')
checkdepends=()
optdepends=()
provides=()
conflicts=('deepin-wxwork')
replaces=()
backup=()
options=()
install=
changelog=
source=("https://com-store-packages.uniontech.com/appstore/pool/appstore/c/${pkgname}/${pkgname}_${pkgver}_i386.deb")
# source=("./com.qq.weixin.work.deepin_3.1.12.6001deepin8_i386.deb")
# 换为对象存储的zst文件
# source=("https://community-store-packages.deepin.com/appstore/pool/appstore/c/${pkgname}/${pkgname}_${pkgver}_i386.deb")
# source=("https://master.dl.sourceforge.net/project/deepin-wine-apps/${pkgname}_${pkgver}_i386.deb")
noextract=("${pkgname}_${pkgver}_i386.deb")
md5sums=('36c6c6cc6033468a3dd8f130d6f8afad')
validpgpkeys=()

prepare() {
	ar -x ${pkgname}_${pkgver}_i386.deb
	mkdir ${pkgname}-${pkgver}
	tar -xf data.tar.xz --directory="${pkgname}-${pkgver}"
	cp -rf ../lib "${pkgname}-${pkgver}"/opt/apps/com.qq.weixin.work.deepin/ 
	cp -rf ../run.sh "${pkgname}-${pkgver}"/opt/apps/com.qq.weixin.work.deepin/files/run.sh
}

package() {
	cd "${pkgname}-${pkgver}"
	cp -r ./ ${pkgdir}/
	mkdir -p ${pkgdir}/usr/share/applications
	install -Dm644 ${srcdir}/${pkgname}-${pkgver}/opt/apps/${pkgname}/entries/applications/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
	cp -r ${srcdir}/${pkgname}-${pkgver}/opt/apps/${pkgname}/entries/icons/ ${pkgdir}/usr/share/

	# 更换为deepin-wine5 (6存在拖动边框 任务栏的图标闪烁异常 搜索框弹不出来）
	# sed s#deepin-wine6#deepin-wine5#g /opt/apps/com.qq.weixin.work.deepin/files/run.sh

	# 解决更新到 gtk3 后，在 wayland 环境下，发送文件的对话框无法弹出，无法下载和发送文件,点击发送文件或者下载一个文件然后就卡死了
	# GDK_BACKEND=x11

	# 解决deepin 编译deepin-wine6-stable的时候还是使用旧的依赖链，所以程序使用网络时在系统里找不到旧版libldap/libber而停止运行
	# cp -r /opt/apps/com.qq.weixin.deepin/lib /opt/apps/com.qq.weixin.work.deepin/lib
	# echo "export LD_LIBRARY_PATH=/opt/apps/com.qq.weixin.work.deepin/lib" >> /opt/apps/com.qq.weixin.work.deepin/files/run.sh
	# cd ${srcdir}
	# cd ..
	# sudo mkdir -p /opt/apps/com.qq.weixin.work.deepin/files
	# sudo cp -rf ./lib /opt/apps/com.qq.weixin.work.deepin/
	# sudo cp -rf ./run.sh /opt/apps/com.qq.weixin.work.deepin/files/run.sh
}
