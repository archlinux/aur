# Maintainer: taotieren <admin@taotieren.com>

pkgbase=dm-tools-appimage
pkgname=(dm-tools-appimage)
pkgver=2.1.5.3
pkgrel=4
pkgdesc="DM-USB2FDCAN (Damiao 达妙) host computer software supports DM-USB2FDCAN series CAN cards"
arch=('x86_64')
url="https://gitee.com/kit-miao/dm-tools"
license=('LGPL-3.0-only AND LicenseRef-scancode-commercial-license')
provides=(${pkgname%-appimage})
conflicts=(${pkgname%-appimage})
replaces=()
depends=(
    glibc
    hicolor-icon-theme
    zlib
)
makedepends=(libarchive)
optdepends=(
    "kh-ucanfd: KunHong UCANFD Linux driver"
    "openarm-can: A C++ library for CAN communication with OpenArm robotic hardware, supporting Damiao motors over CAN/CAN-FD interfaces."
    "python-openarm-can: Python bindings for the OpenArm CAN library, enabling easy integration and communication with OpenArm robotic hardware over CAN/CAN-FD interfaces."
)
backup=()
options=(!debug)
install=
source=(
    "${pkgbase}-${pkgver}-${CARCH}.AppImage::${url}/releases/download/v${pkgver}/DMTool%20v${pkgver}-x86_64.AppImage"
)
sha256sums=('1dbcd3b642f8a771453b4080523a712b421257c6f3c1ebf3f356c2551ba669c0')
noextract=()
_install_path="/opt/appimages"

prepare() {
    cd ${srcdir}
    chmod a+x ${pkgbase}-${pkgver}-${CARCH}.AppImage
    "./${pkgbase}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed -i -e 's|Exec=serial-port-assistant|Exec=/usr/bin/dm-tools|g' \
        -e 's|Name=serial-port-assistant|Name=DMTool|g' \
        -e 's|Icon=send|Icon=dm-tools.png|g' \
         "${srcdir}/squashfs-root/DMTool.desktop"
}

package() {
    install -Dm755 /dev/stdin ${pkgdir}/usr/bin/dm-tools <<EOF
#!/bin/bash
# /usr/bin/dm-tools

export QT_QPA_PLATFORM=xcb
export QT_QPA_PLATFORM_PLUGIN_PATH=/usr/lib/qt6/plugins
export QT_PLUGIN_PATH=/usr/lib/qt6/plugins
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export DISPLAY=:0

if [[ -z "\$DISPLAY" ]] || [[ "\$DISPLAY" == "wayland-0" ]]; then
    export DISPLAY=:0
fi

exec /${_install_path}/${pkgname}.AppImage "\$@"
EOF
    install -Dm644 /dev/stdin "${pkgdir}/usr/lib/udev/rules.d/99-dm-fdcan.rules" <<EOF
SUBSYSTEM=="usb", ATTR{idVendor}=="34b7", ATTR{idProduct}=="6877", MODE="0666", GROUP="uucp"
SUBSYSTEM=="usb_device", ATTR{idVendor}=="34b7", ATTR{idProduct}=="6877", MODE="0666", GROUP="uucp"

KERNEL=="ttyUSB*", ATTRS{idVendor}=="34b7", ATTRS{idProduct}=="6877", MODE="0666", GROUP="uucp", SYMLINK+="ttyDM_FDCAN_%n"
KERNEL=="ttyACM*", ATTRS{idVendor}=="34b7", ATTRS{idProduct}=="6877", MODE="0666", GROUP="uucp", SYMLINK+="ttyDM_FDCAN_%n"
EOF

    install -Dm755 "${srcdir}"/${pkgbase}-${pkgver}-${CARCH}.AppImage "${pkgdir}"/${_install_path}/${pkgname}.AppImage

    # local _icon
    # for _icon in 16 32 64 128 256; do
    #     install -Dm0644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/send.png" \
    #                 -t  "${pkgdir}/usr/share/icons/hicolor/${_icon}x${_icon}/apps"
    # done
    install -Dm0644 "${srcdir}/squashfs-root/send.png" \
                 "${pkgdir}/usr/share/icons/hicolor/24x24/apps/${pkgbase%-appimage}.png"
    install -Dm644 "${srcdir}/squashfs-root/DMTool.desktop" "${pkgdir}/usr/share/applications/${pkgbase%-appimage}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/LGPLv3.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
