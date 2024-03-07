# Maintainer: leaeasy <leaeasy at gmail dot com>
#
pkgname=wechat-beta-bwrap-qt5ct
pkgver=1.0.0.145
pkgrel=6
uosver=2.1.5
epoch=
replaces=('wechat-beta-bwrap' 'wechat-uos-bwrap')
pkgdesc="WeChat Beta with bwrap sandbox"
arch=('x86_64')
url=""
license=('proprietary')
groups=()
depends=('nss' 'xdg-utils' 'libxss' 'libnotify' 'bubblewrap' 'xdg-desktop-portal' 'openssl-1.1' 'lsb-release' 'qt5ct')
makedepends=('dpkg' 'aria2')
DLAGENTS=('https::/usr/bin/aria2c -x 16 -o %o %u')
source=(
	wechat.sh
	wechat-beta.desktop
	wechat-beta.svg
	license.tar.gz
	wechat-uos-${uosver}-x86_64.deb::"https://home-store-packages.uniontech.com/appstore/pool/appstore/c/com.tencent.weixin/com.tencent.weixin_${uosver}_amd64.deb"
	wechat-beta-${pkgver}-amd64.deb::"https://cdn4.cnxclm.com/uploads/2024/03/05/3VDyAc0x_wechat-beta_1.0.0.145_amd64.deb?attname=wechat-beta-${pkgver}-amd64.deb"
)

noextract=()
md5sums=('af3a9d94930915dc37c95cc179e111c8'
         '4967385a00db424e596263618335411f'
         '600e74549ce2258c045d5c2f7689ea63'
         '6b159c6e9d21a98925489bc37a9aea43'
         '27d585e8fc57950ed4f4f3ffc036447f'
         '1da072bd774d1b5c08b9545b409e3fcb')
build() {
	echo "Extract wechat-uos deb file"
	mkdir -p wechat-uos
	dpkg -x ${srcdir}/wechat-uos-${uosver}-x86_64.deb wechat-uos
}

package() {
	echo "Extract wechat-beta deb file"
	dpkg -x wechat-beta-${pkgver}-amd64.deb ${pkgdir}/
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
	install -Dm644 wechat-beta.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/wechat-beta.svg"
}
