# Maintainer: taotieren <admin@taotieren.com>

pkgname=h7toolpc-bin
pkgver=2.0.5
pkgrel=1
pkgdesc="H7-TOOL 的 PC 上位机，支持串口、CAN、示波器、CMSIS-DAP、DS18B20、RTT Viewer、脱机烧录等"
arch=('x86_64')
url="http://www.armbbs.cn/forum.php?mod=viewthread&tid=95468"
license=('MIT')
provides=(${pkgname})
conflicts=(${pkgname} ${pkgname%-bin})
#replaces=(${pkgname})
depends=('wine')
optdepends=("wine-mono-gecko-version-fix: Fix the version numbers of wine-mono and wine-gecko files to solve the dialog box that pops up when starting wine.")
makedepends=('unarchiver')
backup=()
options=('!strip')
install=${pkgname}.install
source=("${pkgname/pc-bin/PC_release}.zip::http://www.armfly.com/download/H7-TOOL/${pkgname/pc-bin/PC_release}(V${pkgver}).zip"
        "${pkgname}.install")
sha256sums=('13A02CB749BC6E5C69986EE231E0647ED829C5D5247BD77D4509A91093F7E121'
            'SKIP')
noextract=("${pkgname/pc-bin/PC_release}.zip")


prepare() {
    unar -e GBK "${srcdir}/${pkgname/pc-bin/PC_release}.zip"
}

package() {
    export LC_CTYPE="zh_CN.UTF-8"
    armfly="opt/armfly"
    install -dm0755 "${pkgdir}/${armfly}/${pkgname%-bin}"
    cp -ra ${srcdir}/${pkgname/pc-bin/PC_release}/* "${pkgdir}/${armfly}/${pkgname%-bin}"
#     cd "${srcdir}/${pkgname/pc-bin/PC_release}"
    find "${pkgdir}/${armfly}" -type f -exec chmod 644 "{}" \;
    find "${pkgdir}/${armfly}" -type d -exec chmod 755 "{}" \;
#     install -Dm0755 "${srcdir}/${pkgname/pc-bin/PC_release}/${pkgname/pc-bin/PC}.exe" "${pkgdir}/${armfly}/${pkgname%-bin}/${pkgname%-bin}.exe"
#     install -Dm0644 "${srcdir}/${pkgname%-bin}/LICENSE" "${pkgdir}/${armfly}/licenses/${pkgname%-bin}/LICENSE"
#     install -Dm0644 "${srcdir}/${pkgname%-bin}/developments/logo/xboot-logo.svg" "${pkgdir}/${armfly}/pixmaps/${pkgname%-bin}.svg"
#     install -Dm0644 "${srcdir}/${pkgname%-bin}/developments/logo/xboot-logo.svg" "${pkgdir}/${armfly}/icons/hicolor/scalable/mimetypes/application-x-${pkgname%-bin}.svg"
    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname%-bin}" << EOF
#!/bin/bash
export WINEARCH=win32 WINEPREFIX="$HOME/.${pkgname%-bin}/wine"

if [ ! -d "$HOME"/.${pkgname%-bin} ] ; then
  mkdir -p "$HOME"/.${pkgname%-bin}/wine || exit 1
  #Each user will have its app.ini, we copy the default file since ${pkgname%-bin}
  #needs to write here.
  cp -r /${armfly}/${pkgname%-bin}/app.ini "$HOME"/.${pkgname%-bin} || exit 1
  cp -r /${armfly}/${pkgname%-bin}/Backup "$HOME"/.${pkgname%-bin} || exit 1
  cp -r /${armfly}/${pkgname%-bin}/Readback "$HOME"/.${pkgname%-bin} || exit 1
  cp -r /${armfly}/${pkgname%-bin}/ini "$HOME"/.${pkgname%-bin} || exit 1
  cp -r /${armfly}/${pkgname%-bin}/log "$HOME"/.${pkgname%-bin} || exit 1
  cp -r /${armfly}/${pkgname%-bin}/*.lua "$HOME"/.${pkgname%-bin} || exit 1

  #We symlink the files emule needs to read to work
  ln -s /${armfly}/${pkgname%-bin}/${pkgname/pc-bin/PC}.exe "$HOME"/.${pkgname%-bin}/${pkgname%-bin} || exit 1
  ln -s -T /${armfly}/${pkgname%-bin}/EMMC "$HOME"/.${pkgname%-bin}/EMMC || exit 1
  ln -s -T /${armfly}/${pkgname%-bin}/Help "$HOME"/.${pkgname%-bin}/Help || exit 1
  ln -s -T /${armfly}/${pkgname%-bin}/USBBus "$HOME"/.${pkgname%-bin}/USBBus || exit 1
  ln -s -T /${armfly}/${pkgname%-bin}/ChangeLog.txt "$HOME"/.${pkgname%-bin}/ChangeLog.txt || exit 1
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
Icon=${pkgname%-bin}
Version=${pkgver}
EOF

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname/-bin/-old}" << EOF
#!/bin/bash
export WINEARCH=win32 WINEPREFIX="$HOME/.${pkgname%-bin}/wine"

if [ ! -d "$HOME"/.${pkgname%-bin} ] ; then
  mkdir -p "$HOME"/.${pkgname%-bin}/wine || exit 1
  #Each user will have its app.ini, we copy the default file since ${pkgname%-bin}
  #needs to write here.
  cp -r /${armfly}/${pkgname%-bin}/app.ini "$HOME"/.${pkgname%-bin} || exit 1
  cp -r /${armfly}/${pkgname%-bin}/Backup "$HOME"/.${pkgname%-bin} || exit 1
  cp -r /${armfly}/${pkgname%-bin}/Readback "$HOME"/.${pkgname%-bin} || exit 1
  cp -r /${armfly}/${pkgname%-bin}/ini "$HOME"/.${pkgname%-bin} || exit 1
  cp -r /${armfly}/${pkgname%-bin}/log "$HOME"/.${pkgname%-bin} || exit 1
  cp -r /${armfly}/${pkgname%-bin}/*.lua "$HOME"/.${pkgname%-bin} || exit 1

  #We symlink the files emule needs to read to work
  ln -s /${armfly}/${pkgname%-bin}/${pkgname/pc-bin/PC(PC V1.44 用于升级V2.00前的固件)}.exe "$HOME"/.${pkgname%-bin}/${pkgname/-bin/-old} || exit 1
  ln -s -T /${armfly}/${pkgname%-bin}/EMMC "$HOME"/.${pkgname%-bin}/EMMC || exit 1
  ln -s -T /${armfly}/${pkgname%-bin}/Help "$HOME"/.${pkgname%-bin}/Help || exit 1
  ln -s -T /${armfly}/${pkgname%-bin}/USBBus "$HOME"/.${pkgname%-bin}/USBBus || exit 1
  ln -s -T /${armfly}/${pkgname%-bin}/ChangeLog.txt "$HOME"/.${pkgname%-bin}/ChangeLog.txt || exit 1
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
Icon=${pkgname%-bin}
Version=${pkgver}
EOF

}
