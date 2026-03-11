# Maintainer: Rongbo Wu <wurongbo2012@hotmail.com>

_pkgname=eden
_pkgver=0.2.0-rc1
pkgname="eden-opt"
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="The Eden Nintendo Switch emulator Clang PGO version (with additional patches for SteamOS)."
arch=('x86_64' 'aarch64')
url="https://git.eden-emu.dev/eden-emu/eden"
license=('GPL-3.0-only AND BSL-1.0')
depends=('zlib' 'qt6-base' 'mbedtls'
    'opus'
    'spirv-tools'
    'libfmt.so=12-64'
    'libusb'
)
makedepends=(patchelf)
optdepends=(
    'shared-mime-info'
    'libsm'
)
options=(!strip)
_appimage="${_pkgname}-${pkgver}"
source=("${url}/raw/branch/master/dist/dev.eden_emu.eden.xml")
source_x86_64=("${_appimage}-x86_64::${url}/releases/download/v${_pkgver}/Eden-Linux-v${_pkgver}-steamdeck-clang-pgo.AppImage")
source_aarch64=("${_appimage}-aarch64::${url}/releases/download/v${_pkgver}/Eden-Linux-v${_pkgver}-aarch64-clang-pgo.AppImage")
b2sums=('SKIP'
)
sha256sums_x86_64=("SKIP")
sha256sums_aarch64=("SKIP")

prepare() {
    chmod +x "${_appimage}-$CARCH"
    ./"${_appimage}-$CARCH" --appimage-extract
    # icon name
    sed -i "s|org.eden_emu.eden|dev.eden_emu.eden|" dev.eden_emu.eden.xml
}

# Fix .desktop file executable
build() {
  sed -i \
    -e "s|^Exec=.*|Exec=/opt/${_pkgname}/bin/eden %f|" \
    -e "s|^TryExec=.*||" \
    -e "s|^Name=.*|Name=Eden Opt|" \
    squashfs-root/dev.eden_emu.eden.desktop
  patchelf --set-rpath /opt/${_pkgname}/lib squashfs-root/shared/bin/eden*
}

package() {
    # file associations
    install -Dm644 dev.eden_emu.eden.xml "${pkgdir}/usr/share/mime/packages/dev.eden_emu.eden.xml"
    install -Dm755 squashfs-root/shared/bin/eden ${pkgdir}/opt/${_pkgname}/bin/eden
    install -Dm755 squashfs-root/shared/bin/eden-cli ${pkgdir}/usr/bin/eden-cli

    install -D squashfs-root/dev.eden_emu.eden.desktop \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    install -Dm644 squashfs-root/dev.eden_emu.eden.svg \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/dev.eden_emu.eden.svg"
    install -d ${pkgdir}/opt/${_pkgname}/lib
    cp -a squashfs-root/shared/lib/libenet.so* ${pkgdir}/opt/${_pkgname}/lib/
    cp -a squashfs-root/shared/lib/libboost* ${pkgdir}/opt/${_pkgname}/lib/
}

# Update mime database for file associations
post_install() {
    update-mime-database /usr/share/mime
}
