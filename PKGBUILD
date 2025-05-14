# Maintainer: JP Roemer <jp+aur@roemer.im>

pkgname=ledfx-cc-bin
_pkgname="${pkgname%-bin}"
pkgver=2.0.108b6
_pkgver="${pkgver//b/-b}"
pkgrel=2
pkgdesc="Network based LED effect controller with support for advanced real-time audio effects"
arch=('x86_64')
url="https://github.com/LedFx/LedFx"
license=('GPL3')
conflicts=("$_pkgname")
provides=("$_pkgname")
depends=('zlib' 'fuse' 'glu')
options=('!strip')
_appimage="LedFx_CC-v${_pkgver}--linux-amd64.AppImage"
noextract=("${_appimage}")
source_x86_64=(
    "${_appimage}::https://github.com/YeonV/LedFx-Builds/releases/download/v${_pkgver}/${_appimage}"
    'ledfx-desktop.patch'
)
sha256sums_x86_64=('add92771b1eccc0cc106ac4fea5a1952911261d540103c6d9c3c3e26521b0fbc'
                   '2b3bef62571d65b3a7aed8a8458dc41030d18345128d46f851c5281ce60ab836')

prepare() {
    chmod +x "${srcdir}/${_appimage}"
    ${srcdir}/${_appimage} --appimage-extract ledfx.desktop
    ${srcdir}/${_appimage} --appimage-extract 'usr/share/icons/hicolor/512x512/apps/ledfx.png'
}

build() {
    # Patch desktop files so it will work outside of AppImage container
    patch -Np0 -i "${srcdir}/ledfx-desktop.patch" -o "${srcdir}/ledfx.desktop"
}

package() {
    # Install AppImage
    install -Dm 0755 "${srcdir}/${_appimage}" \
        "${pkgdir}/opt/${_pkgname}/${_appimage}"
    # Install Desktop file
    install -Dm 0644 "${srcdir}/ledfx.desktop" \
        "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    # Copy icons
    install -Dm 0644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/ledfx.png" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/ledfx.png"
    # Symlink executable
    install -dm 0755 "${pkgdir}/usr/bin"
    ln -s "/opt/${_pkgname}/${_appimage}" "${pkgdir}/usr/bin/${_pkgname}"
}
