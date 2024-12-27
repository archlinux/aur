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
sha512sums_x86_64=('f0909642a1f87ec2ea8d0117b54c722e7d5c4b6c250865d78c8278e426c2d01e6f4c47cd2c23fece47b1c64369116cc1fa30b7e7759ccade01441e6f0f2b0fe6')
sha512sums_aarch64=('f0909642a1f87ec2ea8d0117b54c722e7d5c4b6c250865d78c8278e426c2d01e6f4c47cd2c23fece47b1c64369116cc1fa30b7e7759ccade01441e6f0f2b0fe6')
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
