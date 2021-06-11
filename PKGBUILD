# Maintainer: taotieren <admin@taotieren.com>

pkgname=h7toolpc-bin
pkgver=2.0.5
pkgrel=3
pkgdesc="H7-TOOL 的 PC 上位机，支持串口、CAN、示波器、CMSIS-DAP、DS18B20、RTT Viewer、脱机烧录等"
arch=('x86_64')
url="http://www.armbbs.cn/forum.php?mod=viewthread&tid=95468"
license=('unknow')
provides=(${pkgname})
conflicts=(${pkgname} ${pkgname%-bin})
#replaces=(${pkgname})
depends=('wine')
optdepends=("wine-mono-gecko-version-fix: Fix the version numbers of wine-mono and wine-gecko files to solve the dialog box that pops up when starting wine.")
makedepends=('unarchiver' 'wqy-zenhei')
backup=()
options=('!strip')
install=${pkgname}.install
source=("${pkgname/pc-bin/PC_release}.zip::http://www.armfly.com/download/H7-TOOL/${pkgname/pc-bin/PC_release}(V${pkgver}).zip"
        "icons.tar.gz"
        "${pkgname}.install")
sha256sums=('13A02CB749BC6E5C69986EE231E0647ED829C5D5247BD77D4509A91093F7E121'
            '6823224b5699dc17c41efdcbc8465554f007cb62cadea0aad9b67c08c5698142'
            '10ebc665ba27ab7b38659e4b8fc9b88f45af0600aa6039ff3f563c5272988b99')
noextract=("${pkgname/pc-bin/PC_release}.zip"
            "icons.tar.gz")

prepare() {
    unar -e GBK "${srcdir}/${pkgname/pc-bin/PC_release}.zip"
}

package() {
    export LC_CTYPE="zh_CN.UTF-8"

    armfly="opt/armfly"
    _ftname="wqy-zenhei.ttc"

    install -dm0755 "${pkgdir}/${armfly}/${pkgname%-bin}"

    cp -ra ${srcdir}/${pkgname/pc-bin/PC_release}/* "${pkgdir}/${armfly}/${pkgname%-bin}"

    find "${pkgdir}/${armfly}" -type f -exec chmod 644 "{}" \;
    find "${pkgdir}/${armfly}" -type d -exec chmod 755 "{}" \;

    install -Dm0644 /dev/stdin "${pkgdir}/${armfly}/${pkgname%-bin}/ttffont.reg" << EOF
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

[HKEY_CURRENT_USER\Software\Wine\X11 Driver]
"ClientSideWithRender"="N"

EOF

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname%-bin}" << EOF
#!/bin/bash
export LC_CTYPE="zh_CN.UTF-8"
export WINEARCH=win32 WINEPREFIX="$HOME/.${pkgname%-bin}/wine"

if [ ! -d "$HOME"/.${pkgname%-bin} ] ; then
    mkdir -p "$HOME"/.${pkgname%-bin}/wine || exit 1

    cp -r /${armfly}/${pkgname%-bin}/app.ini "$HOME"/.${pkgname%-bin} || exit 1
    cp -r /${armfly}/${pkgname%-bin}/Backup "$HOME"/.${pkgname%-bin} || exit 1
    cp -r /${armfly}/${pkgname%-bin}/Readback "$HOME"/.${pkgname%-bin} || exit 1
    cp -r /${armfly}/${pkgname%-bin}/ini "$HOME"/.${pkgname%-bin} || exit 1
    cp -r /${armfly}/${pkgname%-bin}/log "$HOME"/.${pkgname%-bin} || exit 1
    cp -r /${armfly}/${pkgname%-bin}/*.lua "$HOME"/.${pkgname%-bin} || exit 1
    cp -r /${armfly}/${pkgname%-bin}/ttffont.reg "$HOME"/.${pkgname%-bin}/wine || exit 1

    ln -s /${armfly}/${pkgname%-bin}/${pkgname/pc-bin/PC}.exe "$HOME"/.${pkgname%-bin}/${pkgname%-bin} || exit 1
    ln -s -T /${pkgdir}/${armfly}/${pkgname%-bin}/Driver "$HOME"/.${pkgname%-bin}/Driver || exit 1
    ln -s -T /${armfly}/${pkgname%-bin}/EMMC "$HOME"/.${pkgname%-bin}/EMMC || exit 1
    ln -s -T /${armfly}/${pkgname%-bin}/Help "$HOME"/.${pkgname%-bin}/Help || exit 1
    ln -s -T /${armfly}/${pkgname%-bin}/USBBus "$HOME"/.${pkgname%-bin}/USBBus || exit 1
    ln -s -T /${armfly}/${pkgname%-bin}/ChangeLog.txt "$HOME"/.${pkgname%-bin}/ChangeLog.txt || exit 1
fi

if [ ! -f "$HOME"/.${pkgname%-bin}/fontok ] ; then
    touch "$HOME"/.${pkgname%-bin}/fontok || exit 1
    cd "$HOME"/.${pkgname%-bin}/wine && regedit ttffont.reg
fi

wine "$HOME"/.${pkgname%-bin}/${pkgname%-bin} "$@"
EOF

    install -Dm0644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop" << EOF
[Desktop Entry]
Name=${pkgname%-bin}
Name[zh_CN]=${pkgname%-bin}
Comment=H7-TOOL 的 PC 上位机，支持串口、CAN、示波器、CMSIS-DAP、DS18B20、RTT Viewer、脱机烧录等
#MimeType=application/x-${pkgname%-bin};
Exec=${pkgname%-bin} %f
Type=Application
Categories=Development;Tool;
Terminal=false
Icon=${pkgname%-bin}.png
Version=${pkgver}
EOF

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname/-bin/-old}" << EOF
#!/bin/bash
export LC_CTYPE="zh_CN.UTF-8"
export WINEARCH=win32 WINEPREFIX="$HOME/.${pkgname%-bin}/wine"

if [ ! -d "$HOME"/.${pkgname%-bin} ] ; then
    mkdir -p "$HOME"/.${pkgname%-bin}/wine || exit 1

    cp -r /${armfly}/${pkgname%-bin}/app.ini "$HOME"/.${pkgname%-bin} || exit 1
    cp -r /${armfly}/${pkgname%-bin}/Backup "$HOME"/.${pkgname%-bin} || exit 1
    cp -r /${armfly}/${pkgname%-bin}/Readback "$HOME"/.${pkgname%-bin} || exit 1
    cp -r /${armfly}/${pkgname%-bin}/ini "$HOME"/.${pkgname%-bin} || exit 1
    cp -r /${armfly}/${pkgname%-bin}/log "$HOME"/.${pkgname%-bin} || exit 1
    cp -r /${armfly}/${pkgname%-bin}/*.lua "$HOME"/.${pkgname%-bin} || exit 1
    cp -r /${armfly}/${pkgname%-bin}/ttffont.reg "$HOME"/.${pkgname%-bin}/wine || exit 1

    ln -s /${armfly}/${pkgname%-bin}/${pkgname/pc-bin/PC(PC V1.44 用于升级V2.00前的固件)}.exe "$HOME"/.${pkgname%-bin}/${pkgname/-bin/-old} || exit 1
    ln -s -T /${pkgdir}/${armfly}/${pkgname%-bin}/Driver "$HOME"/.${pkgname%-bin}/Driver || exit 1
    ln -s -T /${armfly}/${pkgname%-bin}/EMMC "$HOME"/.${pkgname%-bin}/EMMC || exit 1
    ln -s -T /${armfly}/${pkgname%-bin}/Help "$HOME"/.${pkgname%-bin}/Help || exit 1
    ln -s -T /${armfly}/${pkgname%-bin}/USBBus "$HOME"/.${pkgname%-bin}/USBBus || exit 1
    ln -s -T /${armfly}/${pkgname%-bin}/ChangeLog.txt "$HOME"/.${pkgname%-bin}/ChangeLog.txt || exit 1
fi

if [ ! -f "$HOME"/.${pkgname%-bin}/fontok ] ; then
    touch "$HOME"/.${pkgname%-bin}/fontok || exit 1
    cd "$HOME"/.${pkgname%-bin}/wine && regedit ttffont.reg
fi

    wine "$HOME"/.${pkgname%-bin}/${pkgname/-bin/-old} "$@"
EOF

    install -Dm0644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname/-bin/-old}.desktop" << EOF
[Desktop Entry]
Name=${pkgname/-bin/-old}
Name[zh_CN]=${pkgname/-bin/-old}
Comment=H7-TOOL 旧版的 PC 上位机，支持串口、CAN、示波器、CMSIS-DAP、DS18B20、RTT Viewer、脱机烧录等
#MimeType=application/x-${pkgname%-bin};
Exec=${pkgname/-bin/-old} %f
Type=Application
Categories=Development;Tool;
Terminal=false
Icon=${pkgname%-bin}.png
Version=1.44
EOF

    install -Dm644 /dev/stdin "${pkgdir}/usr/lib/udev/rules.d/99-h7tool.rules" << EOF
# Copy this file to /etc/udev/rules.d/ or /usr/lib/udev/rules.d/
# If rules fail to reload automatically, you can refresh udev rules
# with the command "sudo udevadm control --reload"

ACTION!="add|change", GOTO="h7tool_rules_end"

SUBSYSTEM=="gpio", MODE="0660", GROUP="plugdev", TAG+="uaccess"

SUBSYSTEM!="usb|tty|hidraw", GOTO="h7tool_rules_end"

# Please keep this list sorted by VID:PID

# H7-tool
ATTRS{idVendor}=="C251", ATTRS{idProduct}=="F00A", MODE="666", GROUP="plugdev", TAG+="uaccess"

# CMSIS-DAP compatible adapters
ATTRS{product}=="*CMSIS-DAP*", MODE="666", GROUP="plugdev", TAG+="uaccess"

LABEL="h7tool_rules_end"
EOF

    tar -xf "${srcdir}/icons.tar.gz" -C "${pkgdir}/usr/share"
#     install -Dm0644 "${srcdir}/${pkgname%-bin}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
