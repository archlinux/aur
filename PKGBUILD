# Maintainer: taotieren <admin@taotieren.com>

pkgbase=dm-tools-appimage
pkgname=(dm-tools-appimage)
pkgver=2.1.5.3
pkgrel=6
pkgdesc="DM-USB2FDCAN (Damiao 达妙) host computer software supports DM-USB2FDCAN series CAN cards"
arch=('x86_64')
url="https://gitee.com/kit-miao/dm-tools"
license=('LGPL-3.0-only AND LicenseRef-scancode-commercial-license')
provides=(${pkgname%-appimage})
conflicts=(${pkgname%-appimage})
replaces=()
depends=(
    sh
    glibc
    hicolor-icon-theme
    zlib
    qt6-base
)
makedepends=(libarchive)
optdepends=(
    "kh-ucanfd: KunHong UCANFD Linux driver"
    "openarm-can: A C++ library for CAN communication with OpenArm robotic hardware, supporting Damiao motors over CAN/CAN-FD interfaces."
    "python-openarm-can: Python bindings for the OpenArm CAN library, enabling easy integration and communication with OpenArm robotic hardware over CAN/CAN-FD interfaces."
)
backup=()
options=(!debug !strip !lto)
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
    "./${pkgbase}-${pkgver}-${CARCH}.AppImage" --appimage-extract >/dev/null
    sed -i -e 's|Exec=serial-port-assistant|Exec=/usr/bin/dm-tools|g' \
        -e 's|Name=serial-port-assistant|Name=DMTool|g' \
        -e 's|Icon=send|Icon=dm-tools.png|g' \
        "${srcdir}/squashfs-root/DMTool.desktop"
}

package() {
    install -vDm755 /dev/stdin ${pkgdir}/usr/bin/dm-tools <<EOF
#!/bin/bash
# /usr/bin/dm-tools

export QT_QPA_PLATFORM=xcb
export QT_QPA_PLATFORM_PLUGIN_PATH=/usr/lib/qt6/plugins
export QT_PLUGIN_PATH=/usr/lib/qt6/plugins
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export DISPLAY=:0

if [[ "\$XDG_SESSION_TYPE" == "wayland" ]]; then
    # 检查 Xwayland 是否运行
    if pgrep -x Xwayland >/dev/null; then
        # 通常 Xwayland 使用 :0
        export DISPLAY=:0
    else
        # 如果 Xwayland 未运行，尝试启动
        echo "警告: 检测到 Wayland 会话，但 Xwayland 未运行"
        echo "尝试启动 Xwayland..."
        if command -v Xwayland >/dev/null; then
            Xwayland :1 &
            sleep 1
            export DISPLAY=:1
        else
            echo "错误: 未找到 Xwayland，请安装 xorg-xwayland"
            echo "运行: sudo pacman -S xorg-xwayland"
            exit 1
        fi
    fi
fi

# 如果 DISPLAY 未设置，设置为默认值
if [[ -z "\$DISPLAY" ]]; then
    export DISPLAY=:0
fi

# 如果 DISPLAY 是 wayland-0，改为 :0
if [[ "\$DISPLAY" == "wayland-0" ]]; then
    export DISPLAY=:0
fi

if ! xhost >/dev/null 2>&1; then
    echo "错误: 无法连接到 X11 服务器 (DISPLAY=\$DISPLAY)"
    echo ""
    echo "可能的解决方案:"
    echo "1. 确保 X11 服务器正在运行"
    echo "2. 如果您使用 Wayland，请安装 xorg-xwayland:"
    echo "   sudo pacman -S xorg-xwayland"
    echo "3. 检查 DISPLAY 环境变量是否正确"
    echo "4. 尝试设置 DISPLAY=:0 或 DISPLAY=:1"
    echo ""
    exit 1
fi

xhost +SI:localuser:\$USER >/dev/null 2>&1 || true

if [[ ! -f "/usr/lib/qt6/plugins/platforms/libqxcb.so" ]]; then
    echo "警告: 未找到 Qt xcb 插件"
    echo "请确保已安装 qt6-base 和 qt6-wayland"
fi

exec /${_install_path}/${pkgname}.AppImage "\$@"
EOF
    install -vDm644 /dev/stdin "${pkgdir}/usr/lib/udev/rules.d/99-dm-fdcan.rules" <<EOF
SUBSYSTEM=="usb", ATTR{idVendor}=="34b7", ATTR{idProduct}=="6877", MODE="0666", GROUP="uucp"
SUBSYSTEM=="usb_device", ATTR{idVendor}=="34b7", ATTR{idProduct}=="6877", MODE="0666", GROUP="uucp"

KERNEL=="ttyUSB*", ATTRS{idVendor}=="34b7", ATTRS{idProduct}=="6877", MODE="0666", GROUP="uucp", SYMLINK+="ttyDM_FDCAN_%n"
KERNEL=="ttyACM*", ATTRS{idVendor}=="34b7", ATTRS{idProduct}=="6877", MODE="0666", GROUP="uucp", SYMLINK+="ttyDM_FDCAN_%n"
EOF

    install -vDm755 "${srcdir}"/${pkgbase}-${pkgver}-${CARCH}.AppImage "${pkgdir}"/${_install_path}/${pkgname}.AppImage

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
