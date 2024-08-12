# Maintainer: FTS427 <FTS427@outlook.com>
# Contributor: Blessing-Studio <3424968114@qq.com>

pkgname=wonderlab-appimage-feature
_pkgname=wonderlab
pkgver=2.0.1
pkgrel=2
pkgdesc="The next generation cross-platform Minecraft launcher. (feature branch)"
arch=('x86_64' 'aarch64')
url="https://github.com/Blessing-Studio/WonderLab.Override"
license=('AGPL3')
options=('!strip')
conflicts=('wonderlab' 'wonderlab-git' 'wonderlab-appimage')
depends=('fuse')
optdepends=('jre-openjdk: for launch Minecraft')
source_x86_64=("${_pkgname}-${arch}.AppImage::${url}/releases/download/AutoBuild_feature/${_pkgname}.${pkgver}.linux-x64.AppImage")
source_aarch64=("${_pkgname}-${arch}.AppImage::${url}/releases/download/AutoBuild_feature/${_pkgname}.${pkgver}.linux-arm64.AppImage")
_appimage="${_pkgname}-${arch}.AppImage"
sha512sums_x86_64=('43d332fdc14ae1bc1033fafacf8b92bff16c0fbea540d7ce0df797d740b831ff5fbf2c424f2c0ecab7f53dbdf6e6b7f5948cd5e518ca4717bf040a850eb0a69a')
sha512sums_aarch64=('43d332fdc14ae1bc1033fafacf8b92bff16c0fbea540d7ce0df797d740b831ff5fbf2c424f2c0ecab7f53dbdf6e6b7f5948cd5e518ca4717bf040a850eb0a69a')
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
