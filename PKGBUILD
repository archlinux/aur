# Maintainer: FTS427 <FTS427@outlook.com>
# Contributor: Lunova-Studio <3424968114@qq.com>

pkgname=wonderlab-appimage-feature
_pkgname=wonderlab
pkgver=2.0.0.0818
pkgrel=1
pkgdesc="The next generation cross-platform Minecraft launcher. (dev branch)"
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
sha256sums_x86_64=('ad987d0500ecb14b3a0c9d5c998725f352c90d4ef405b54c4f852f40e59e4959')
sha256sums_aarch64=('2e713f24951903b4ec4615dd9d3840f818f2c08332f1ef9aa6ff78d7af7e4bba')
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
