# Maintainer: Rongbo Wu <wurongbo2012@hotmail.com>

_pkgname=eden
_pkgver=0.2.1
pkgname="eden-opt"
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="The Eden Nintendo Switch emulator Clang PGO version (for Zen2 +)."
arch=('x86_64' 'aarch64')
url="https://git.eden-emu.dev/eden-emu/eden"
license=('GPL-3.0-only')
depends=('enet'
    'qt6-base'
    'qt6-charts'
    'opus'
    'spirv-tools'
    'libfmt.so=12-64'
    'libusb'
    'libva'
)
makedepends=(patchelf)
optdepends=(
    'shared-mime-info'
    'libsm'
)
options=(!strip)
_appimage="${_pkgname}-${pkgver}"
source=("${url}/raw/branch/master/dist/dev.eden_emu.eden.xml")
source_x86_64=("${_appimage}-x86_64::https://stable.eden-emu.dev/v${_pkgver}/Eden-Linux-v${_pkgver}-steamdeck-clang-pgo.AppImage")
source_aarch64=("${_appimage}-aarch64::https://stable.eden-emu.dev/v${_pkgver}/Eden-Linux-v${_pkgver}-aarch64-clang-pgo.AppImage")
sha256sums=('4a332861910dbe07d9aa7a7f57e779b1086ad571b0986b4862b995388f51fbbe')
sha256sums_x86_64=('5cc5b358ac6449b40021b20ba2430b4d12302737db15c8cbe5b46ce9aab85ce5')
sha256sums_aarch64=('b64f926cbf74fd870a39b144971084323d895d51919b91e906328e7f81bea087')

prepare() {
    chmod +x "${_appimage}-$CARCH"
    ./"${_appimage}-$CARCH" --appimage-extract
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
    cp -a squashfs-root/shared/lib/libboost* ${pkgdir}/opt/${_pkgname}/lib/
}

# Update mime database for file associations
post_install() {
    update-mime-database /usr/share/mime
}
