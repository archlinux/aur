# Maintainer: 7Ji <pugokushin at gmail dot com>
# Maintainer: leaeasy <leaeasy at gmail dot com>

pkgname=wechat-universal-bwrap
pkgver=1.0.0.236
pkgrel=2
pkgdesc="WeChat (Universal) with bwrap sandbox"
arch=('x86_64' 'aarch64' 'loong64')
url="https://weixin.qq.com"
license=('proprietary')
provides=('wechat-universal')
conflicts=('wechat-universal')
replaces=('wechat-beta'{,-bwrap})
depends=('nss' 'flatpak-xdg-utils' 'libxss' 'libnotify' 'bubblewrap' 
	'xdg-user-dirs' 'xdg-desktop-portal' 'openssl-1.1' 'lsb-release')
options=(!strip !debug emptydirs)
source=(
	fake_dde-file-manager
	wechat.sh
	wechat-universal.desktop
	wechat-universal.png
	license.tar.gz
)

_deb_url_common=https://home-store-packages.uniontech.com/appstore/pool/appstore/c/com.tencent.wechat/com.tencent.wechat_"${pkgver}"
_deb_stem=wechat-universal_"${pkgver}"

source_x86_64=(
	"${_deb_stem}_x86_64.deb::${_deb_url_common}_amd64.deb"
)

source_aarch64=(
	"${_deb_stem}_aarch64.deb::${_deb_url_common}_arm64.deb"
)

source_loong64=(
	"${_deb_stem}_loong64.deb::${_deb_url_common}_loongarch64.deb"
)

noextract=("${_deb_stem}"_{x86_64,aarch64,loong64}.deb)

sha256sums=(
	'201d904c7a0e38a6ed7dd12f9300c71babd685b26cf2fce65f76126e23f38c4a'
	'3996ad25f95eb2ac73fb536a6080a20802dd4e5eb155d8f329fa0e568bfbc00f'
	'b783b7b0035efb5a0fcb4ddba6446f645a4911e4a9f71475e408a5c87ef04c30'
	'bc13a14c8680daa03c617e71f48419a1b05e2b9d75bb58b15a89d0d191d0fb12'
	'53760079c1a5b58f2fa3d5effe1ed35239590b288841d812229ef4e55b2dbd69'
)

sha256sums_x86_64=(
	'958c2705d3b37470f7272737379d5ed7d3809cf51f9a9ac94f81cbbc9346541a'
)
sha256sums_aarch64=(
	'0c57d85184dff673d4f50cfa0c2980ac01316c12e3e5a2beed2c2a3c3a954863'
)
sha256sums_loong64=(
	'abc9209859990a359c690faccea589ee69aa488a9dbfae693b89055cec341a52'
)

package() {
	echo 'Popupating pkgdir with data from wechat-universal deb file...'
	bsdtar -xOf "${_deb_stem}_${CARCH}.deb" ./data.tar.xz |
		xz -cdT0 |
		bsdtar -xpC "${pkgdir}" ./opt/apps/com.tencent.wechat/files
	mv "${pkgdir}"/opt/{apps/com.tencent.wechat/files,wechat-universal}
	rm -rf "${pkgdir}"/opt/apps

	echo 'Fixing licenses...'
	local _wechat_root="${pkgdir}"/usr/share/wechat-universal
	install -dm755 {"${pkgdir}","${_wechat_root}"}/usr/lib/license
	mv "${pkgdir}"/opt/wechat-universal/libuosdevicea.so "${_wechat_root}"/usr/lib/license/
	cp -ra license/etc "${_wechat_root}"
	cp -ra license/var "${_wechat_root}"

	echo 'Installing fake deepin file manager...'
	install -Dm755 {fake_,"${_wechat_root}"/usr/bin/}dde-file-manager

	echo 'Installing desktop files...'
	install -Dm644 wechat-universal.desktop "${pkgdir}"/usr/share/applications/wechat-universal.desktop
	install -Dm755 wechat.sh "${pkgdir}"/usr/bin/wechat-universal
	install -Dm644 wechat-universal.png "${pkgdir}"/usr/share/icons/hicolor/256x256/apps/wechat-universal.png
}
