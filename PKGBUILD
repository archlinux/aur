# Maintainer: megrxu <megrxu at proton.me>
pkgname=fudancloud
pkgver=4.0.2
pkgrel=1
pkgdesc="复旦云盘客户端"
arch=('x86_64')
url="https://cloud.fudan.edu.cn"
license=('custom:proprietary')
depends=(glib2 expat libxcb libxcomposite libxshmfence at-spi2-core libcups gtk3 libdrm nspr pango nss libxext dbus gcc-libs libxfixes libxdamage cairo alsa-lib libx11 glibc mesa libxkbcommon nodejs bash gdk-pixbuf2 libxrandr)
options=()
source_x86_64=("${url}/clients/fudancloud_${pkgver}_amd64.deb")
sha512sums_x86_64=('dbc1b84e98935b4530606e1064c72b0d3e1b3dbbf960816c1845b14709e02faebb87e23e596928a6d6e610caa837afedd0e816d62cb04d6f093d25766a15d14a')

post_install() {
	gtk-update-icon-cache -q -t -f usr/share/icons/hicolor
	update-desktop-database -q
}

post_upgrade() {
	post_install
}

post_remove() {
	gtk-update-icon-cache -q -t -f usr/share/icons/hicolor
	update-desktop-database -q
}

package(){

	# Extract package data
	tar -xz -f data.tar.gz --transform "s/FudanCloud-v${pkgver}/${pkgname}/g" -C "${pkgdir}"

	# Remove shipped std libs
	find ${pkgdir}/opt/${pkgname}/lib/ -type f,l -not \( -name 'libffmpeg.so' -o -name 'libnode.so' -o -name 'libnw.so' \) -delete

	# Fix binary path
	mv ${pkgdir}/opt/${pkgname}/FudanCloud ${pkgdir}/opt/${pkgname}/${pkgname};
	sed -i "s|FudanCloud-v${pkgver}/FudanCloud|${pkgname}/${pkgname}|g" ${pkgdir}/usr/share/applications/FudanCloud.desktop
}
