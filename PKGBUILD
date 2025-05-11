# Based off of: https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html
# Maintainer: ZachAR3 <Zach4R3@gmail.com>

_pkgname=Eden
pkgname="eden-bin"
pkgver=0.0.1
pkgrel=1
pkgdesc="The Eden Nintendo Switch emulator AppImage."
arch=('x86_64')
url="https://git.eden-emu.dev/eden-emu/eden"
license=('GPL3')
depends=('zlib' 'hicolor-icon-theme')
makedepends=('megatools')
options=(!strip)
_appimage="${_pkgname}-Linux-${pkgver}-pre-alpha-amd64.AppImage"
_sha256="6602e9083d2d4bb149e45a8629d894f813fc2569a6bc0835d76e26e3165008f4"

source=("mega::https://mega.nz/#!MEGALINK!KEY")  # Fake URL
md5sums=('SKIP')  # Skip checksum since we download manually in prepare

# Download from mega and check SHA256
prepare() {
    if [[ ! -f ${_appimage} ]]; then
        echo "Downloading AppImage..."
        megadl 'https://mega.nz/file/tI1mSYTb#ISZfSEVZk80NEvmc_x9as20O173I2jiXDEg9F2mE-8c' --path "${_appimage}"
    fi

    # Verify SHA256 checksum
    echo "Verifying checksum..."
    if ! echo "${_sha256}  ${_appimage}" | sha256sum --check --status; then
        error "SHA256 checksum verification failed for ${_appimage}!"
        return 1
    fi


    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

# Fix .desktop file
build() {
    sed -i "s|^Exec=.*|Exec=/usr/bin/${_pkgname}|" "squashfs-root/org.eden_emu.eden.desktop"

}

package() {
    install -Dm755 "${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
    install -Dm644 "squashfs-root/org.eden_emu.eden.desktop" \
        "${pkgdir}/usr/share/applications/org.eden_emu.eden.desktop"
    # copy icon
    install -Dm644 "squashfs-root/org.eden_emu.eden.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/org.eden_emu.eden.svg"
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
        echo "${pkgdir}/usr/bin/${_pkgname}"
    }
