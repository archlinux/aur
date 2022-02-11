# Maintainer: Arkylin <x@xyz.blue>
pkgname=oss-browser-git
pkgver=1.16.0
pkgrel=1
pkgdesc="ossbrowser是阿里云官方提供的OSS图形化管理工具，提供类似Windows资源管理器的功能"
arch=('x86_64')
url="https://github.com/aliyun/oss-browser"
license=('Apache License 2.0')
depends=('gconf' 'git' 'unzip' 'fakeroot' 'gtk2' 'make' 'nodejs' 'npm')
makedepends=('tar')
source=(
	"git+https://github.com/aliyun/oss-browser.git"
	oss-browser.desktop
)
sha512sums=(
	'SKIP'
	'046494233e8f6fd99bfe5b6ad458229d9a6dfc3ac90bcb1e8b0135a0193d24a8db582fab96fb6db0b439be8a72443bc8d9d1a0d07a67dad86540ab420a6dbd7c'
)

package() {
    cd ${srcdir}
	msg "安装cnpm...仅使用npm会报错"
	if [ -f "/usr/bin/cnpm" ];then
  		msg "已存在cnpm"
		msg "electron1.8.4版本已经404"
		msg "electron 1.8.4更改为1.8.8"
		sed -i 's/"electron": "1.8.4"/"electron": "1.8.8"/' ${srcdir}/oss-browser/package.json
		cd ${srcdir}/oss-browser
		make i
		make build
		msg "补全electron-log依赖"
		cd dist
		cnpm install
		msg "生成linux64包"
		cd ..
		make linux64
		msg "解压软件包..."
		mkdir -p ${pkgdir}/opt/oss-browser
		unzip -d ${pkgdir}/opt/oss-browser ${srcdir}/oss-browser/releases/*/oss-browser-linux-x64.zip
		cp -r ${pkgdir}/opt/oss-browser/oss-browser-linux-x64/* ${pkgdir}/opt/oss-browser
		msg "创建图标..."
		mkdir -p ${pkgdir}/usr/share/applications
		cp -r ${srcdir}/oss-browser.desktop ${pkgdir}/usr/share/applications
		rm -rf ${pkgdir}/opt/oss-browser/oss-browser-linux-x64
	else
		msg "不存在，请按照下列命令安装cnpm！"
		msg "sudo npm install -g cnpm --registry=https://registry.npmmirror.com"
		msg "请按Ctrl+C退出安装程序！"
		sleep 1d
	fi
}
