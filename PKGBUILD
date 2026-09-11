# Maintainer: KafCoppelia <k740677208@gmail.com>

# BUILD INSTRUCTIONS:
#
# 1. Go to https://softwaretools.infineon.com/tools/com.ifx.tb.tool.modustoolboxprogtools and login with your Infineon account.
# 2. Click on "Download" and download the current version
# 3. Download the .deb package and place it in the same directory as the PKGBUILD
# 4. Build

_pkgname=ModusToolboxProgtools
pkgname=modustoolbox-progtools
_pkgver=1.9
pkgver=${_pkgver}.0.2261
pkgrel=1
pkgdesc="Provides a cross-platform installation of several utilities that allow you to program flash on Infineon MCU and Kit devices."
arch=('x86_64')
license=("LicenseRef-${pkgname}")
depends=('fontconfig' 'libglvnd' 'dbus' 'krb5' 'libxkbcommon' 'libxkbcommon-x11' 'pango' 'xcb-util-cursor' 'xcb-util-keysyms' 'xcb-util-wm' 'xcb-util-renderutil' \
    'openssl-1.1' 'gtk3' 'xcb-util-image' 'zstd' 'systemd-libs' 'glib2' 'zlib' 'freetype2' 'libxcb' 'libx11' 'glibc')
url="https://softwaretools.infineon.com/tools/com.ifx.tb.tool.modustoolboxprogtools"
source=("file://${_pkgname}_${pkgver}.deb")
sha256sums=('42f48cec9f7b770dc966949a9274167ef96e9935c969f5b65fc6da2ffb0fa436')
options=('!strip')
install="${pkgname}.install"


prepare() {
    cd ${srcdir}
    bsdtar -xf data.tar.zst -C ./
    rm data.tar.zst
    mv ./opt/Tools/${_pkgname}-${_pkgver} ./opt/
    # Remove the empty directory
    rm -r ./opt/Tools
    # Update link in desktop file
    sed -i "s/opt\/Tools/opt/" ./usr/share/applications/ModusToolbox-Programming-Tools-${pkgver}.desktop
    # itb-launcher-service-setup
    cd ${srcdir}/opt/${_pkgname}-${_pkgver}/resources
    mkdir -p itb-launcher-service-setup
    bsdtar -xf ./itb-launcher-service-setup.deb -C ./
    mkdir -p data
    bsdtar -xf data.tar.gz -C data/
}

package() {
    cp -ar ${srcdir}/opt ${pkgdir}/
    cp -ar ${srcdir}/usr ${pkgdir}/
    # itb-launcher-service-setup
    cp -ar ${srcdir}/opt/${_pkgname}-${_pkgver}/resources/data/opt ${pkgdir}/
    cp -ar ${srcdir}/opt/${_pkgname}-${_pkgver}/resources/data/usr ${pkgdir}/
    rm -rf ${pkgdir}/opt/${_pkgname}-${_pkgver}/resources

    # Install license
    install -d ${pkgdir}/usr/share/licenses/${pkgname}
    install -Dm644 ${srcdir}/usr/share/doc/ModusToolbox-Programming-Tools-${pkgver}/LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
