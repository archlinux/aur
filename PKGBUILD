# Maintainer: FTS427 <FTS427@outlook.com>
# Contributor: Blessing-Studio <3424968114@qq.com>
pkgname=wonderlab-appimage
_pkgname=wonderlab
pkgver=1.2.7.f2a4
pkgrel=3.4
pkgdesc="Next generation cross-platform Minecraft launcher"
arch=('x86_64' 'aarch64')
url="https://github.com/Blessing-Studio/WonderLab.Override"
license=('AGPL3')
options=('!strip')
conflicts=('wonderlab' 'wonderalb-git')
depends=('fuse')
optdepends=('jre-openjdk: for launch minecraft')
source_x86_64=("${_pkgname}-${arch}.AppImage::${url}/releases/download/AutoBuild_master/wonderlab.1.2.7-preview.linux-x64.AppImage")
source_aarch64=("${_pkgname}-${arch}.AppImage::${url}/releases/download/AutoBuild_master/wonderlab.1.2.7-preview.linux-arm64.AppImage")
sha512sums_x86_64=('SKIP')
sha512sums_aarch=('SKIP')
_appimage="${_pkgname}-${arch}.AppImage"
noextract=("${_appimage}")

prepare() {
	chmod +x "${_appimage}"
	./"${_appimage}" --appimage-extract
}

build() {
	sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|" "squashfs-root/blessing.${_pkgname}.desktop"
	chmod -R a-x+rX squashfs-root/usr
}

package() {
	# AppImage
	install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${_pkgname}/${_pkgname}.AppImage"

	# Desktop
	install -Dm644 "${srcdir}/squashfs-root/blessing.${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

	# Icon
	install -dm755 "${pkgdir}/usr/share/"
	cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

	# Symlink executable
	install -dm755 "${pkgdir}/usr/bin"
	ln -s "/opt/${_pkgname}/${_pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}
