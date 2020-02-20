#Maintainer: weearc <q19981121@163.com>
pkgname=qiniuclient
_pkgname=qiniuClient
pkgver=v0.3.0
_pkgver=0.3.0
pkgrel=1
epoch=
pkgdesc="云存储管理客户端。仿文件夹式管理、图片预览、拖拽上传、文件夹上传、同步、批量导出URL等功能"
arch=("any")
url="https://github.com/willnewii/qiniuClient"
license=('MIT')
groups=()
depends=(
	 'electron4'
	 'libxcb'
	)
makedepends=(
	     'yarn'
	     'npm')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
	"https://github.com/willnewii/qiniuClient/archive/$_pkgver.tar.gz")
noextract=()
sha256sums=('449ebf10c4d6936dac6df9498cf9043a542570cd7017de12d79386ff3506478b'
)
validpgpkeys=()

prepare(){
    tar -xvf $_pkgver.tar.gz
}

build() {
	cd $_pkgname-$_pkgver/
	yarn
    npm run build:dir
}
package() {
	install -d ${pkgdir}/opt
	install -d ${pkgdir}/usr/bin
	install -d ${pkgdir}/usr/share/icons
	install -d ${pkgdir}/usr/share/applications
	
	mkdir ${pkgdir}/opt/$_pkgname
	install -Dm644 ${srcdir}/$_pkgname-$_pkgver/build/linux-unpacked/resources/app.asar ${pkgdir}/opt/$_pkgname/app.asar
	
	echo "[Desktop Entry]
Name=qiniuclient
Name[zh_CN]=云存储管理客户端
GenericName=Third party OSS client
Exec=qiniuclient
Terminal=false
Icon=$_pkgname
Type=Application
Categories=Network;FileTransfer;
}" > ${pkgdir}/usr/share/applications/$_pkgname.desktop
    
    echo "#!/bin/bash
electron4 /opt/$_pkgname/app.asar $@" > ${pkgdir}/usr/bin/qiniuclient && chmod a+x ${pkgdir}/usr/bin/qiniuclient
    for i in 16 22 24 32 36 48 64 72 96 128 256
	do
        mkdir -p ${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps
        install -Dm644 ${srcdir}/$_pkgname-$_pkgver/src/main/assets/icon.png ${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/$_pkgname.png
    done
    
}
