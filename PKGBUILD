# Maintainer: FTS427 <FTS427@outlook.com>
# Contributor: Lunova-Studio <3424968114@qq.com>

pkgname=wonderlab-appimage-feature
_pkgname=wonderlab
pkgver=2.0.0.0622
pkgrel=1
pkgdesc="The next generation cross-platform Minecraft launcher. (feature branch)"
arch=('x86_64' 'aarch64')
url="https://github.com/Lunova-Studio/WonderLab.Override"
license=('AGPL3')
options=('!strip')
conflicts=('wonderlab' 'wonderlab-git' 'wonderlab-appimage')
depends=('fuse' 'skia-sharp')
optdepends=('jre-openjdk: for launch Minecraft')
source_x86_64=("${_pkgname}-${arch}.AppImage::${url}/releases/download/v${pkgver}/WonderLab.linux.x64.AppImage")
source_aarch64=("${_pkgname}-${arch}.AppImage::${url}/releases/download/v${pkgver}/WonderLab.linux.arm64.AppImage")
_appimage="${_pkgname}-${arch}.AppImage"
sha256sums_x86_64=('26660a7cfdc95aa8f6b86cb2a4222d3b5d6cfaf70d74c318039b216bbcb5368a')
sha256sums_aarch64=('a3f07c289808af2515f18093cb88f4459ff2b4db8e2c59a269a5a0d5a3b14a7a')
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
