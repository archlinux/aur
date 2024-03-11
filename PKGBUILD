# Maintainer: leaeasy <leaeasy at gmail dot com>
# Maintainer: 7Ji <pugokushin at gmail dot com>

pkgname=wechat-beta-bwrap
pkgver=1.0.0.145
pkgrel=15
pkgdesc="WeChat Testing with bwrap sandbox"
arch=('x86_64' 'aarch64')
url="https://weixin.qq.com"
license=('proprietary')
conflicts=('wechat-uos')
depends=('nss' 'xdg-utils' 'libxss' 'libnotify' 'bubblewrap' 
	'xdg-user-dirs' 'xdg-desktop-portal' 'openssl-1.1' 'lsb-release')
source=(
	wechat.sh
	wechat-beta.desktop
	wechat-beta.png
	license.tar.gz
)

_uosver=2.1.5
_uos_deb_url_common=https://home-store-packages.uniontech.com/appstore/pool/appstore/c/com.tencent.weixin/com.tencent.weixin_
_beta_deb_url_common=https://cdn4.cnxclm.com/uploads/2024/03/05
_beta_deb_id_x86_64=3VDyAc0x
_beta_deb_id_aarch64=NKX87bHT

_uos_deb_stem=wechat-uos_"${_uosver}"
_beta_deb_stem=wechat-beta_"${pkgver}"

source_x86_64=(
	"${_uos_deb_stem}_x86_64.deb::${_uos_deb_url_common}${_uosver}_amd64.deb"
	"${_beta_deb_stem}_x86_64.deb::${_beta_deb_url_common}/${_beta_deb_id_x86_64}_${_beta_deb_stem}_amd64.deb"
)

source_aarch64=(
	"${_uos_deb_stem}_aarch64.deb::${_uos_deb_url_common}${_uosver}_arm64.deb"
	"${_beta_deb_stem}_aarch64.deb::${_beta_deb_url_common}/${_beta_deb_id_aarch64}_wechat-beta_1.0.0.150_arm64.deb" # Upstream provides .150 aarch64 instead of .145
)

noextract=()
for _source in "${source_x86_64[@]}" "${source_aarch64[@]}"; do
	noextract+=("${_source%%::*}")
done

md5sums=(
	'9894bcb03dc7e4151aca9cc245d317df'
	'4967385a00db424e596263618335411f'
	'cf971cb2cb01d8a5fd89d3a3555abfaf'
	'6b159c6e9d21a98925489bc37a9aea43'
)

md5sums_x86_64=(
	'27d585e8fc57950ed4f4f3ffc036447f'
	'1da072bd774d1b5c08b9545b409e3fcb'
)

md5sums_aarch64=(
	'5be8de0d40ad21bcc49ae4bd8041a0bf'
	'b9d2d3461964da54eb630ef6f07d4ccc'
)

build() {
	echo "Extract wechat-uos deb file"
	mkdir -p wechat-uos
	bsdtar -xf "${_uos_deb_stem}_${CARCH}.deb" -C wechat-uos
	bsdtar -xf wechat-uos/data.tar.xz -C wechat-uos ./usr/lib/license/libuosdevicea.so

	echo "Extract wechat-beta deb file"
	mkdir -p wechat-beta
	bsdtar -xpf "${_beta_deb_stem}_${CARCH}.deb" -C wechat-beta
}

package() {
	echo "Extract wechat-beta deb file"
	bsdtar -xpf wechat-beta/data.tar.xz -C ${pkgdir}
	echo "Fixing licenses"
	mkdir -p ${pkgdir}/usr/share/wechat-uos
	cp -r license/etc ${pkgdir}/usr/share/wechat-uos
	cp -r license/var ${pkgdir}/usr/share/wechat-uos
	install -Dm644 wechat-uos/usr/lib/license/libuosdevicea.so ${pkgdir}/usr/lib/license/libuosdevicea.so
	echo "Clean unused file"
	rm -f "${pkgdir}/usr/share/applications/wechat.desktop"
	echo "Installing stuff in place"
	install -Dm644 wechat-beta.desktop "${pkgdir}/usr/share/applications/wechat-beta.desktop"
	install -Dm755 wechat.sh "${pkgdir}/usr/bin/wechat-beta"
	install -Dm644 wechat-beta.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/wechat-beta.png"
}
