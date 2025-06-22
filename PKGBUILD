# Maintainer: FTS427 <FTS427@outlook.com>
# Contributor: Lunova-Studio <3424968114@qq.com>

pkgname=wonderlab-appimage
_pkgname=wonderlab
pkgver=2.0.0.0611
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
sha256sums_x86_64=('f98f1963c8886286d1b1a77dad917b3a3bb026eb087fe7b8d615997973865d84')
sha256sums_aarch64=('177f089a2bb33dddf09a436bb926f2f0b9f7284490bc3d302a529a35fe2076ef')
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
