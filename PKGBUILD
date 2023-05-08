# Maintainer: Tianrui Wei <archlinux_aur at mail dot tianrui-wei dot com>
# Contributor: Marcio Silva <marcionps at gmail dot com>
# Based  on the template from https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html

_pkgname=obsidian

pkgname="${_pkgname}"-appimage
pkgver=1.2.7
pkgrel=1
pkgdesc="Obsidian is a powerful knowledge base that works on top of a local folder of plain text Markdown files"
arch=('x86_64' 'aarch64')
url="https://obsidian.md/"
license=('custom:Commercial')
depends=('zlib' 'hicolor-icon-theme' 'fuse2')
provides=("${_pkgname}")
conflicts=("${_pkgname}" 'obsidian' 'obsidian-insider')
options=(!strip)
_appimage="${pkgname}-${pkgver}.AppImage"
source_x86_64=("${_appimage}::https://github.com/obsidianmd/obsidian-releases/releases/download/v${pkgver}/Obsidian-${pkgver}.AppImage")
source_aarch64=("${_appimage}::https://github.com/obsidianmd/obsidian-releases/releases/download/v${pkgver}/Obsidian-${pkgver}-arm64.AppImage")
noextract=("${_appimage}")
sha256sums_x86_64=('c53de8bf19214bb9a991b0249ad08c0aed56ee9ec5eb85ac580d07560ee0c7cf')
sha256sums_aarch64=('cace56eae581068d886aabdc4a745a7fcd61f671bae35c9b1a2bbf497c658ac1')


prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname} %u|"\
        "squashfs-root/${_pkgname}.desktop"
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop"\
            "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}
