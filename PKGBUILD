# Maintainer: leaeasy <leaeasy at gmail dot com>
#
pkgname=wechat-beta-bwrap
pkgver=1.0.0.145
pkgrel=12
uosver=2.1.5
epoch=
pkgdesc="WeChat Testing with bwrap sandbox"
arch=('x86_64')
url=""
license=('proprietary')
conflicts=('wechat-uos')
groups=()
depends=('nss' 'xdg-utils' 'libxss' 'libnotify' 'bubblewrap' 
	'xdg-user-dirs' 'xdg-desktop-portal' 'openssl-1.1' 'lsb-release')
source=(
	wechat.sh
	wechat-beta.desktop
	wechat-beta.png
	license.tar.gz
	wechat-uos_${uosver}_amd64.deb::"https://home-store-packages.uniontech.com/appstore/pool/appstore/c/com.tencent.weixin/com.tencent.weixin_${uosver}_amd64.deb"
	wechat-beta_${pkgver}_amd64.deb::"https://cdn4.cnxclm.com/uploads/2024/03/05/3VDyAc0x_wechat-beta_1.0.0.145_amd64.deb?attname=wechat-beta_${pkgver}_amd64.deb"
)

noextract=(
	wechat-uos_${uosver}_amd64.deb
	wechat-beta_${pkgver}_amd64.deb
)

md5sums=('222a2eb9b29569c4753ec887a505164d'
         '4967385a00db424e596263618335411f'
         'cf971cb2cb01d8a5fd89d3a3555abfaf'
         '6b159c6e9d21a98925489bc37a9aea43'
         '27d585e8fc57950ed4f4f3ffc036447f'
         '1da072bd774d1b5c08b9545b409e3fcb')
build() {
	echo "Extract wechat-uos deb file"
	mkdir -p ${srcdir}/wechat-uos
	bsdtar -xf ${srcdir}/wechat-uos_${uosver}_amd64.deb -C ${srcdir}/wechat-uos
	bsdtar -xf ${srcdir}/wechat-uos/data.tar.xz -C ${srcdir}/wechat-uos ./usr/lib/license/libuosdevicea.so

	echo "Extract wechat-beta deb file"
	mkdir -p ${srcdir}/wechat-beta
	bsdtar -xpf wechat-beta_${pkgver}_amd64.deb -C ${srcdir}/wechat-beta
}

package() {
	echo "Extract wechat-beta deb file"
	bsdtar -xpf ${srcdir}/wechat-beta/data.tar.xz -C ${pkgdir}
	echo "Fixing licenses"
	mkdir -p ${pkgdir}/usr/share/wechat-uos
	cp -r license/etc ${pkgdir}/usr/share/wechat-uos
	cp -r license/var ${pkgdir}/usr/share/wechat-uos
	install -Dm644 ${srcdir}/wechat-uos/usr/lib/license/libuosdevicea.so ${pkgdir}/usr/lib/license/libuosdevicea.so
	echo "Clean unused file"
	rm -f "${pkgdir}/usr/share/applications/wechat.desktop"
	echo "Installing stuff in place"
	install -Dm644 wechat-beta.desktop "${pkgdir}/usr/share/applications/wechat-beta.desktop"
	install -Dm755 wechat.sh "${pkgdir}/usr/bin/wechat-beta"
	install -Dm644 wechat-beta.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/wechat-beta.png"
}
