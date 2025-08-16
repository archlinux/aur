# Maintainer: FTS427 <FTS427@outlook.com>
# Contributor: Lunova-Studio <3424968114@qq.com>

pkgname=wonderlab-appimage
_pkgname=wonderlab
pkgver=2.0.0.0707
pkgrel=1
pkgdesc="The next generation cross-platform Minecraft launcher."
arch=('x86_64' 'aarch64')
url="https://github.com/Lunova-Studio/WonderLab.Override"
license=('AGPL3')
options=('!strip')
conflicts=('wonderlab' 'wonderlab-git' 'wonderlab-appimage-feature')
depends=('fuse' 'skia-sharp')
optdepends=('jre-openjdk: for launch Minecraft')
source_x86_64=("${_pkgname}-${arch}.AppImage::${url}/releases/download/v${pkgver}/WonderLab.linux.x64.AppImage")
source_aarch64=("${_pkgname}-${arch}.AppImage::${url}/releases/download/v${pkgver}/WonderLab.linux.arm64.AppImage")
_appimage="${_pkgname}-${arch}.AppImage"
sha256sums_x86_64=('6d77dcfb510d54aad9bb0f29aa3cf321378f4300d3a575893ea2b637fcf6a647')
sha256sums_aarch64=('c1623cd4119b98e8349192506a73debdfbb98d04c22d4a8e1610f159ba24762c')
prepare() {
	chmod +x "${_appimage}"
	./"${_appimage}" --appimage-extract
}

build() {
	chmod -R a-x+rX squashfs-root/usr
}

package() {
	# AppImage
	install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
	# Desktop
	install -Dm644 "${srcdir}/squashfs-root/Lunova.WonderLab.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	# Icon
	install -dm755 "${pkgdir}/usr/share/"
	cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"
	# Symlink executable
	install -dm755 "${pkgdir}/usr/bin"
	ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}
