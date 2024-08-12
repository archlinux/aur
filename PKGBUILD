# Maintainer: FTS427 <FTS427@outlook.com>
# Contributor: Blessing-Studio <3424968114@qq.com>

pkgname=wonderlab-appimage
_pkgname=wonderlab
pkgver=1.2.8.2
pkgrel=2
pkgdesc="The next generation cross-platform Minecraft launcher. (master branch)"
arch=('x86_64' 'aarch64')
url="https://github.com/Blessing-Studio/WonderLab.Override"
license=('AGPL3')
options=('!strip')
conflicts=('wonderlab' 'wonderlab-git' 'wonderlab-appimage-feature')
depends=('fuse')
optdepends=('jre-openjdk: for launch Minecraft')
source_x86_64=("${_pkgname}-${arch}.AppImage::${url}/releases/download/AutoBuild_master/${_pkgname}.${pkgver}.linux-x64.AppImage")
source_aarch64=("${_pkgname}-${arch}.AppImage::${url}/releases/download/AutoBuild_master/${_pkgname}.${pkgver}.linux-arm64.AppImage")
sha512sums_x86_64=('6b0812fd2ecea88d5212d86acd5fb405eb7f1d6b56e58fcadcf031c6d9a3bf585c9508f048a4b224081d988ea63c17a7621d14df9f731074b247050072e1fbc4')
sha512sums_aarch64=('6b0812fd2ecea88d5212d86acd5fb405eb7f1d6b56e58fcadcf031c6d9a3bf585c9508f048a4b224081d988ea63c17a7621d14df9f731074b247050072e1fbc4')
_appimage="${_pkgname}-${arch}.AppImage"

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
	install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

	# Desktop
	install -Dm644 "${srcdir}/squashfs-root/blessing.${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

	# Icon
	install -dm755 "${pkgdir}/usr/share/"
	cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

	# Symlink executable
	install -dm755 "${pkgdir}/usr/bin"
	ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}
