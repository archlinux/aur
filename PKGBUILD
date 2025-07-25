# Based off of: https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html
# Maintainer: ZachAR3 <Zach4R3@gmail.com>

_pkgname=Eden
pkgname="eden-bin"
pkgver=0.0.2
pkgrel=1
pkgdesc="The Eden Nintendo Switch emulator AppImage."
arch=('x86_64')
url="https://git.eden-emu.dev/eden-emu/eden"
license=('GPL3')
depends=('zlib' 'hicolor-icon-theme')
options=(!strip)
_appimage="${_pkgname}-Linux-${pkgver}-pre-alpha-amd64.AppImage"
source_x86_64=("${_appimage}::https://github.com/eden-emulator/Releases/releases/download/v${pkgver}-pre-alpha/${_pkgname}-Linux-${pkgver}-pre-alpha-amd64.AppImage")
sha256sums_x86_64=("4cda90cceb7f8343cfe7b854dd6e73b9415af8da30144e778ef9b76f70b31f6b")

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

# Fix .desktop file
build() {
    sed -i "s|^Exec=.*|Exec=/usr/bin/${_pkgname}|" "squashfs-root/eden.desktop"

}

package() {
    install -Dm755 "${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
    install -Dm644 "squashfs-root/eden.desktop" \
        "${pkgdir}/usr/share/applications/eden.desktop"
    # copy icon
    install -Dm644 "squashfs-root/eden.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/eden.svg"
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
        echo "${pkgdir}/usr/bin/${_pkgname}"
    }
