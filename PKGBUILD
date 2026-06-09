# Maintainer: taotieren <admin@taotieren.com>

pkgbase=dm-tools-appimage
pkgname=(dm-tools-appimage)
pkgver=2.1.6.7
pkgrel=1
pkgdesc="DM-USB2FDCAN (Damiao 达妙) host computer software supports DM-USB2FDCAN series CAN cards"
arch=('x86_64')
url="https://github.com/dmBots/motor-debugging-tool"
license=('LGPL-3.0-only AND LicenseRef-scancode-commercial-license')
provides=(${pkgname%-appimage})
conflicts=(${pkgname%-appimage})
replaces=()
depends=(
    sh
    glibc
    hicolor-icon-theme
    zlib
)
makedepends=(
    git
    libarchive
)
optdepends=(
    "kh-ucanfd: KunHong UCANFD Linux driver"
    "openarm-can: A C++ library for CAN communication with OpenArm robotic hardware, supporting Damiao motors over CAN/CAN-FD interfaces."
    "python-openarm-can: Python bindings for the OpenArm CAN library, enabling easy integration and communication with OpenArm robotic hardware over CAN/CAN-FD interfaces."
)
backup=()
options=(!debug !strip !lto)
install=
_name=DMTool-v${pkgver}-${CARCH}.AppImage
source=(
    "motor-debugging-tool::git+${url}.git"
)
sha256sums=('SKIP')
noextract=()
_install_path="/opt/appimages"

prepare() {
    cd ${srcdir}/motor-debugging-tool/Linux/x86_64
    chmod +x ${_name}
    "./${_name}" --appimage-extract >/dev/null
    sed -i -e 's|Exec=serial-port-assistant|Exec=/usr/bin/dm-tools|g' \
        -e 's|Name=serial-port-assistant|Name=DMTool|g' \
        -e 's|Icon=send|Icon=dm-tools.png|g' \
        "squashfs-root/DMTool.desktop"
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
SUBSYSTEM=="usb", ATTR{idVendor}=="34b7", ATTR{idProduct}=="6877", MODE="0666", GROUP="uucp", TAG+="uaccess"
SUBSYSTEM=="usb_device", ATTR{idVendor}=="34b7", ATTR{idProduct}=="6877", MODE="0666", GROUP="uucp", TAG+="uaccess"

KERNEL=="ttyUSB*", ATTRS{idVendor}=="34b7", ATTRS{idProduct}=="6877", MODE="0666", SYMLINK+="ttyDM_FDCAN_%n"
KERNEL=="ttyACM*", ATTRS{idVendor}=="34b7", ATTRS{idProduct}=="6877", MODE="0666", SYMLINK+="ttyDM_FDCAN_%n"
EOF
    
    cd ${srcdir}/motor-debugging-tool/Linux/x86_64
    install -vDm755 ${_name} "${pkgdir}"/${_install_path}/${pkgname}.AppImage

    # local _icon
    # for _icon in 16 32 64 128 256; do
    #     install -Dm0644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/send.png" \
    #                 -t  "${pkgdir}/usr/share/icons/hicolor/${_icon}x${_icon}/apps"
    # done
    install -Dm0644 "squashfs-root/send.png" \
        "${pkgdir}/usr/share/icons/hicolor/24x24/apps/${pkgbase%-appimage}.png"
    install -Dm644 "squashfs-root/DMTool.desktop" "${pkgdir}/usr/share/applications/${pkgbase%-appimage}.desktop"
    install -Dm644 "squashfs-root"/*.txt -t  "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    
    cd ${srcdir}/motor-debugging-tool/
    install -vDm644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
    install -vDm644 *.pdf -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
