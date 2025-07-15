# Maintainer: taotieren <admin@taotieren.com>

pkgname=h7toolpc-wine
pkgver=2.29
pkgrel=1
pkgdesc="Wine H7-TOOL 的 PC 上位机，支持串口、CAN、示波器、CMSIS-DAP、DS18B20、RTT Viewer、脱机烧录等"
arch=('x86_64')
url="http://www.armbbs.cn/forum.php?mod=viewthread&tid=95468"
license=('unknow')
provides=(${pkgname})
conflicts=(${pkgname} ${pkgname%-wine} 'h7toolpc-bin')
replaces=(h7toolpc-bin)
depends=(
    bash
    hicolor-icon-theme
    wine
    wqy-microhei)
optdepends=()
makedepends=(libarchive)
backup=()
options=('!strip' '!debug')
install=${pkgname}.install
# https://www.armfly.com/download/H7-TOOL/h7toolPC_release(V2.2.7).7z
source=("${pkgname/pc-wine/PC_release}-${pkgver}.7z::https://www.armfly.com/download/H7-TOOL/${pkgname/pc-wine/PC_release}(V${pkgver}).7z"
    "icons.tar.gz"
    "${pkgname}.install")
sha256sums=('72ba58a3151110296bcf1e3209f2cf7500b97b393480dc205f361bbbd1de60c5'
            '6823224b5699dc17c41efdcbc8465554f007cb62cadea0aad9b67c08c5698142'
            'b7ed44498e84bae5f174fd0a4a56aea0298ce93bc9a5de8b1dfb41c067705d27')
noextract=("icons.tar.gz")

package() {
    armfly="opt/armfly"

    install -dm0755 "${pkgdir}/${armfly}/${pkgname%-wine}"

    cp -ra ${srcdir}/${pkgname/pc-wine/PC_release}/* "${pkgdir}/${armfly}/${pkgname%-wine}"

    find "${pkgdir}/${armfly}" -type f -exec chmod 644 "{}" \;
    find "${pkgdir}/${armfly}" -type d -exec chmod 755 "{}" \;

    _ftname="wqy-microhei.ttc"
    install -Dm0644 /dev/stdin "${pkgdir}/${armfly}/${pkgname%-wine}/regpatch.reg" <<EOF
REGEDIT4

[HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\FontLink\SystemLink]
"Lucida Sans Unicode"="${_ftname}"
"Microsoft Sans Serif"="${_ftname}"
"MS Sans Serif"="${_ftname}"
"Tahoma"="${_ftname}"
"Tahoma Bold"="${_ftname}"
"SimSun"="${_ftname}"
"Arial"="${_ftname}"
"Arial Black"="${_ftname}"
"Lucida Sans Unicode"=str(7):"${_ftname}"
"Microsoft Sans Serif"=str(7):"${_ftname}"
"Tahoma"=str(7):"${_ftname}"
"Lucida Sans Unicode"="${_ftname}"
"Microsoft Sans Serif"="${_ftname}"
"Microsoft YaHei"="${_ftname}"
"微软雅黑"="${_ftname}"
"宋体"="${_ftname}"
"新細明體"="${_ftname}"
"DFKai-SB"="${_ftname}"
"FangSong"="${_ftname}"
"KaiTi"="${_ftname}"
"Microsoft JhengHei"="${_ftname}"
"Microsoft YaHei"="${_ftname}"
"MingLiU"="${_ftname}"
"NSimSun"="${_ftname}"
"PMingLiU"="${_ftname}"
"SimHei"="${_ftname}"
"SimKai"="${_ftname}"
"SimSun"="${_ftname}"

[HKEY_CURRENT_USER\Software\Wine\X11 Driver]
"ClientSideAntiAliasWithCore"="N"
"ClientSideAntiAliasWithRender"="N"
"ClientSideWithRender"="N"

[HKEY_CURRENT_USER\Control Panel\Desktop]
"FontSmoothing"="2"
"FontSmoothingType"=dword:00000002
"FontSmoothingGamma"=dword:00000578
"FontSmoothingOrientation"=dword:00000001

[HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion]
"RegisteredOrganization"="H7-TOOL"
"RegisteredOwner"="H7-TOOL"

[HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\winebus]
"Start"=dword:00000002

[HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\winehid]
"Start"=dword:00000002

[HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\wineusb]
"Start"=dword:00000002

[HKEY_LOCAL_MACHINE\Software\Wine\Ports]
"COM1"="/dev/ttyUSB0"
"COM2"="/dev/ttyUSB1"
"COM3"="/dev/ttyUSB2"
"COM4"="/dev/ttyUSB3"
"COM5"="/dev/ttyUSB4"
"COM6"="/dev/ttyUSB5"
"COM7"="/dev/ttyUSB6"
"COM8"="/dev/ttyUSB7"
"COM9"="/dev/ttyUSB8"
"COM10"="/dev/ttyACM0"
"COM11"="/dev/ttyACM1"
"COM12"="/dev/ttyACM2"
"COM13"="/dev/ttyACM3"
"COM14"="/dev/ttyACM4"
"COM15"="/dev/ttyACM5"
"COM16"="/dev/ttyACM6"
"COM17"="/dev/ttyACM7"
"COM18"="/dev/ttyACM8"
"COM19"="/dev/ttyACM9"

EOF

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname%-wine}" <<EOF
#!/bin/bash
export WINEARCH=win64 WINEPREFIX="\$HOME/.${pkgname%-wine}/wine"

if [ ! -d "\$HOME"/.${pkgname%-wine} ] ; then
    mkdir -p "\$HOME"/.${pkgname%-wine}/wine || exit 1

    cp -r /${armfly}/${pkgname%-wine}/app*.ini "\$HOME"/.${pkgname%-wine} || exit 1
    cp -r /${armfly}/${pkgname%-wine}/Backup "\$HOME"/.${pkgname%-wine} || exit 1
    cp -r /${armfly}/${pkgname%-wine}/Readback "\$HOME"/.${pkgname%-wine} || exit 1
    cp -r /${armfly}/${pkgname%-wine}/ini "\$HOME"/.${pkgname%-wine} || exit 1
    cp -r /${armfly}/${pkgname%-wine}/log "\$HOME"/.${pkgname%-wine} || exit 1
    cp -r /${armfly}/${pkgname%-wine}/Lua "\$HOME"/.${pkgname%-wine} || exit 1
    cp -r /${armfly}/${pkgname%-wine}/Trace "\$HOME"/.${pkgname%-wine} || exit 1
    cp -r /${armfly}/${pkgname%-wine}/regpatch.reg "\$HOME"/.${pkgname%-wine}/wine || exit 1

    ln -s /${armfly}/${pkgname%-wine}/${pkgname/pc-wine/PC}.exe "\$HOME"/.${pkgname%-wine}/${pkgname%-wine} || exit 1
    ln -s -T /${pkgdir}/${armfly}/${pkgname%-wine}/Driver "\$HOME"/.${pkgname%-wine}/Driver || exit 1
    ln -s -T /${armfly}/${pkgname%-wine}/EMMC "\$HOME"/.${pkgname%-wine}/EMMC || exit 1
    ln -s -T /${armfly}/${pkgname%-wine}/Help "\$HOME"/.${pkgname%-wine}/Help || exit 1
    ln -s -T /${armfly}/${pkgname%-wine}/USBBus "\$HOME"/.${pkgname%-wine}/USBBus || exit 1
    ln -s -T /${armfly}/${pkgname%-wine}/ChangeLog.txt "\$HOME"/.${pkgname%-wine}/ChangeLog.txt || exit 1

    regedit "\$HOME"/.${pkgname%-wine}/wine/regpatch.reg
#     winetricks -q hid
#     winetricks -q comctl32
#     winetricks -q comctl32ocx
#     winetricks -q comdlg32ocx
#     wine "\$HOME"/.${pkgname%-wine}/Driver/stm32_vcp/VCP_V1.5.0_Setup_W7_x86_32bits.exe /S
#     wine "\$HOME"/.${pkgname%-wine}/Driver/WinUSB/zadig-2.5.exe
    wineserver -k
fi

wine "\$HOME"/.${pkgname%-wine}/${pkgname%-wine} -opengl "\$@"
EOF

    install -Dm0644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname%-wine}.desktop" <<EOF
[Desktop Entry]
Name=${pkgname%-wine}
Name[zh_CN]=${pkgname%-wine}
Comment=${pkgdesc}
#MimeType=application/x-${pkgname%-wine};
Exec=${pkgname%-wine} %f
Type=Application
Categories=Development;Tool;
Terminal=false
Icon=${pkgname%-wine}.png
Version=${pkgver}
EOF

    install -Dm0644 /dev/stdin "${pkgdir}/etc/udev/rules.d/10-h7tool.rules" <<EOF
# Copy this file to /etc/udev/rules.d/ or /usr/lib/udev/rules.d/
# If rules fail to reload automatically, you can refresh udev rules
# with the command "sudo udevadm control --reload"

ACTION!="add|change", SUBSYSTEM!="usb_device", GOTO="h7tool_rules_end"

# SUBSYSTEM=="gpio", MODE="0666", GROUP="uucp", TAG+="uaccess"

# SUBSYSTEM!="usb|tty|hidraw", GOTO="h7tool_rules_end"

# Please keep this list sorted by VID:PID

# H7-tool
# ATTRS{idVendor}=="c251", ATTRS{idProduct}=="f00a", MODE="666", GROUP="uucp", TAG+="uaccess"
# BUS=='usb',
ATTRS{manufacturer}=="H7-TOOL By ARMFLY", MODE="0666", GROUP="uucp", TAG+="uaccess"

LABEL="h7tool_rules_end"
EOF

    bsdtar -xf "${srcdir}/icons.tar.gz" -C "${pkgdir}/usr/share"
    #     install -Dm0644 "${srcdir}/${pkgname%-wine}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname%-wine}/LICENSE"
}
