# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=sunloginclient
pkgver=10.0.2.24779
pkgrel=1
pkgdesc="Sunlogin Remote Control is a software that supports remote control of mobile devices, Windows, Mac, Linux and other systems. It is the best choice for IT technology, game players, designers and other people with remote management needs."
arch=("x86_64")
url="https://sunlogin.oray.com"
depends=("libappindicator-gtk3"  "webkitgtk" 'aspell' 'hspell' 'nuspell' 'libvoikko')
license=('unknown')
#optdepends=('aspell' 'hspell' 'nuspell' 'libvoikko')
options=("!emptydirs" "!strip")
source=("http://download.oray.com/sunlogin/linux/SunloginClient-${pkgver}_amd64.deb")
install='sunloginclient.INSTALL'
backup=("etc/orayconfig.conf")
sha256sums=('da2a61d106c2cecce271c89cd182b162bce34018539e1ba431580c5bbe120252')

package() {
	bsdtar -xf data.tar.xz -C "${pkgdir}"

	install -Dm644 "${pkgdir}/usr/local/sunlogin/scripts/runsunloginclient.service" "${pkgdir}/usr/lib/systemd/system/runsunloginclient.service"

	install -dm755 "${pkgdir}/opt"
	cp -rp "${pkgdir}/usr/local/sunlogin" "${pkgdir}/opt/sunlogin"

	rm -r "${pkgdir}/usr/local/"
	rm -r "${pkgdir}/opt/sunlogin/scripts"
	# 修改路径
	sed -i 's#/usr/local/#/opt/#g' "${pkgdir}/opt/sunlogin/etc/watch.sh"
	sed -i "s#/usr/local/#/opt/#g" "${pkgdir}/usr/lib/systemd/system/runsunloginclient.service"
	sed -i 's#Exec=/usr/local/sunlogin/#Exec=/usr/#g' "${pkgdir}/usr/share/applications/sunlogin.desktop"
    sed -i 's#Icon=/usr/local/sunlogin/res/icon/sunlogin_client.png#Icon=sunlogin_client#g' "${pkgdir}/usr/share/applications/sunlogin.desktop"
	
	# 修改权限
	#chmod 766 "${pkgdir}/usr/local/sunlogin/res/skin/"*.skin
	chmod 766 "${pkgdir}/opt/sunlogin/res/skin/"*.skin
	
	# 安装图标
    install -Dm644 "${pkgdir}/opt/sunlogin/res/icon/sunlogin_client.png" "${pkgdir}/usr/share/pixmaps/sunlogin_client.png"

	# 创建软链
	install -dm755 "$pkgdir/usr/bin"
	ln -s "/opt/sunlogin/bin/sunloginclient" "${pkgdir}/usr/bin/sunloginclient"
	 
	#  ugly hack
	sed -i "s#/usr/local/sunlogin\x0#/opt/sunlogin\x0\x0\x0\x0\x0\x0\x0#g" "${pkgdir}/opt/sunlogin/bin/sunloginclient"
}
