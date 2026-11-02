# Maintainer: KafCoppelia <k740677208@gmail.com>

# BUILD INSTRUCTIONS:
#
# 1. Go to https://softwaretools.infineon.com/tools/com.ifx.tb.tool.modustoolboxprogtools and login with your Infineon account.
# 2. Click on "Download" and download the current version
# 3. Download the .deb package and place it in the same directory as the PKGBUILD
# 4. Build

_pkgname=ModusToolboxProgtools
pkgname=modustoolbox-progtools
_pkgver=2.0
pkgver=${_pkgver}.0.2521
pkgrel=1
pkgdesc="Provides a cross-platform installation of several utilities that allow you to program flash on Infineon MCU and Kit devices."
arch=('x86_64')
license=("LicenseRef-${pkgname}")
depends=('at-spi2-core' 'bash' 'cairo' 'coreutils' 'dbus' 'fontconfig' 'freetype2' 'gdk-pixbuf2' 'glib2' 'glibc' 'grep' 'gtk3' 'hicolor-icon-theme' 'kmod' 'krb5' 'libdrm' 'libgcc' 'libglvnd' 'libstdc++' 'libx11' 'libxcb' 'libxkbcommon' 'libxkbcommon-x11' 'openssl-1.1' 'pango' 'systemd-libs' 'wayland' 'xcb-util-cursor' 'xcb-util-image' 'xcb-util-keysyms' 'xcb-util-renderutil' 'xcb-util-wm' 'zlib' 'zstd')
makedepends=('patchelf')
optdepends=('jlink-software-and-documentation: J-Link probe support')
url="https://softwaretools.infineon.com/tools/com.ifx.tb.tool.modustoolboxprogtools"
source=("file://${_pkgname}_${pkgver}.deb")
sha256sums=('f8f35e3c01d55faad438d4b721a420ead75c5a5268ab8b3f43837f8561932468')
options=('!strip' '!debug')
install="${pkgname}.install"

prepare() {
    cd "${srcdir}"
    bsdtar -xf data.tar.zst
    mv "opt/Tools/${_pkgname}-${_pkgver}" opt/
    rmdir opt/Tools
    local product="${srcdir}/opt/${_pkgname}-${_pkgver}"

    # Keep private bundled libraries while removing upstream build-machine paths.
    patchelf --set-rpath '$ORIGIN/../lib' "${product}/fw-loader/bin/fw-loader"
    patchelf --set-rpath '$ORIGIN' "${product}/fw-loader/lib/libcybridge.so"
    patchelf --set-rpath '$ORIGIN' "${product}/mtb-programmer/lib/libcybridge.so"
    sed -i "s|/opt/Tools/${_pkgname}-${_pkgver}|/usr/lib/${_pkgname}-${_pkgver}|g" \
        "usr/share/applications/ModusToolbox-Programming-Tools-${pkgver}.desktop"

    mkdir launcher-service
    bsdtar -xf "${product}/resources/itb-launcher-service-setup.deb" -C launcher-service
    bsdtar -xf launcher-service/data.tar.gz -C launcher-service
    sed -i 's|/opt/LauncherService|/usr/lib/LauncherService|g' \
        launcher-service/usr/share/applications/idc-launcher-service.desktop

    # udev runs helpers as root; package the rules instead of invoking vendor installers.
    sed -i -e "s|/opt/infineon/udev_rules/driver_media/|/usr/lib/${_pkgname}-${_pkgver}/driver_media/|g" \
        -e "s|/opt/infineon/udev_rules/|/usr/lib/${_pkgname}-${_pkgver}/driver_media/|g" \
        "${product}/driver_media/67-mtb-tty.rules"
    sed -i 's/sudo modprobe/modprobe/' "${product}/driver_media/infineon_"*.sh
    find "${product}" -name '*.rules' -exec sed -i 's/, GROUP="plugdev"//g' {} +
    sed -i 's/" RUN+=/", RUN+=/' "${product}/openocd/udev_rules/66-wiced-JTAG.rules"
}

package() {
    local product="${pkgdir}/usr/lib/${_pkgname}-${_pkgver}"
    install -dm755 "${pkgdir}/usr/lib" "${pkgdir}/opt"
    cp -a "${srcdir}/opt/${_pkgname}-${_pkgver}" "${pkgdir}/usr/lib/"
    cp -a "${srcdir}/usr/"* "${pkgdir}/usr/"
    cp -a "${srcdir}/launcher-service/opt/LauncherService" "${pkgdir}/usr/lib/"
    cp -a "${srcdir}/launcher-service/usr/"* "${pkgdir}/usr/"
    ln -s "/usr/lib/${_pkgname}-${_pkgver}" "${pkgdir}/opt/${_pkgname}-${_pkgver}"
    ln -s /usr/lib/LauncherService "${pkgdir}/opt/LauncherService"
    rm -rf "${product}/resources"

    install -Dm644 "${product}/driver_media/67-mtb-tty.rules" "${pkgdir}/usr/lib/udev/rules.d/67-modustoolbox-tty.rules"
    install -Dm644 "${product}/fw-loader/udev_rules/57-cypress_programmer.rules" "${pkgdir}/usr/lib/udev/rules.d/57-modustoolbox-programmer.rules"
    install -Dm644 "${product}/mtb-programmer/udev_rules/70-wiced-JTAG.rules" "${pkgdir}/usr/lib/udev/rules.d/70-modustoolbox-wiced-JTAG.rules"
    install -Dm644 "${product}/openocd/udev_rules/60-openocd.rules" "${pkgdir}/usr/lib/udev/rules.d/60-modustoolbox-openocd.rules"
    install -Dm644 "${product}/openocd/udev_rules/66-wiced-JTAG.rules" "${pkgdir}/usr/lib/udev/rules.d/66-modustoolbox-wiced-JTAG.rules"

    install -Dm644 "${srcdir}/usr/share/doc/ModusToolbox-Programming-Tools-${pkgver}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
