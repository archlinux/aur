# Maintainer: Jasmin <theblazehen@gmail.com>
# Contributor: XSilverTH <XSilverTH@proton.me>

pkgname=adb-gui-kit-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="A modern desktop toolkit for ADB, Fastboot, and scrcpy"
arch=('x86_64')
url="https://github.com/Drenzzz/ADBKit"
license=('MIT')
depends=('gtk4' 'webkitgtk-6.0' 'android-tools' 'scrcpy' 'hicolor-icon-theme')
provides=('adb-gui-kit')
conflicts=('adb-gui-kit')
options=('!strip')

_upstreamver=${pkgver/beta/-beta}
source=("adb-gui-kit.desktop"
        "${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/Drenzzz/ADBKit/v${_upstreamver}/LICENSE")
sha256sums=('dea69b0a76f5cfdf4d0dce7c9d0a8ce40e814d8dca257941114e987df4427cbf'
            'de44595fa04a3dd2ed40f3177084d40f03d720996b0355e71cb449b84a804923')
source_x86_64=("${pkgname}-${pkgver}-x86_64.AppImage::https://github.com/Drenzzz/ADBKit/releases/download/v${_upstreamver}/ADBKit-${_upstreamver}-linux-amd64-system.AppImage")

sha256sums_x86_64=('9836cfeb17fb5c739a39e12e7e77e6c40fbfff4f15b865e7390b184653a998ba')

prepare() {
    cd "$srcdir"
    chmod +x "${pkgname}-${pkgver}-${CARCH}.AppImage"
    ./"${pkgname}-${pkgver}-${CARCH}.AppImage" --appimage-extract
}

package() {
    local _squashfs="${srcdir}/squashfs-root"
    local _install_path="${pkgdir}/opt/${pkgname}"

    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/applications"
    install -d "${pkgdir}/usr/share/icons/hicolor/256x256/apps"
    install -d "${_install_path}"

    # Install main executable from usr/bin
    install -m755 "${_squashfs}/usr/bin/ADBKit" "${_install_path}/adb-gui-kit"

    # Create launcher script
    cat <<EOF > "${pkgdir}/usr/bin/adb-gui-kit"
#!/bin/sh
cd "/opt/${pkgname}"
exec ./adb-gui-kit "\$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/adb-gui-kit"

    install -m644 "${srcdir}/adb-gui-kit.desktop" "${pkgdir}/usr/share/applications/"

    # Use icon from AppImage
    install -m644 "${_squashfs}/usr/share/icons/hicolor/256x256/apps/ADBKit.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/adb-gui-kit.png"

    install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
