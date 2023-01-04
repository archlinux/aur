# Contributor: taotieren <admin@taotieren.com>

pkgname=bouffalolab-devcude-bin
pkgver=1.8.1
pkgrel=0
pkgdesc="Dev Cube 是博流提供的芯片集成开发工具，包含 IOT 程序下载、MCU 程序下载和RF性能测试三大功能。工具提供程序固件启动时的时钟，电源，Flash 参数等配置，并可根据用户需求对程序进行加密和签名，生成应用程序启动信息文件。工具还可烧写用户资源文件，分区表文件以及 EFUSE 配置文件等。工具可对 Flash 进行擦、改、写"
arch=('x86_64')
url="https://dev.bouffalolab.com/download"
license=('custom')
provides=("Bouffalo-Lab-Dev-Cube" "bflb-iot-tool")
conflicts=(python-bflb-iot-tool)
#replaces=(${pkgname})
depends=('libusb' 'libftdi' 'hidapi' 'openocd')
makedepends=('libarchive')
optdepends=("jlink-software-and-documentation: Segger JLink software & documentation pack for Linux")
backup=()
options=('!strip')
install=${pkgname}.install
source=("${pkgname%-bin}-${pkgver}.zip::https://dev.bouffalolab.com/media/upload/download/BouffaloLabDevCube-v${pkgver}.zip")
sha256sums=('f278894b09884055179f19be6ed84ffd85d3b91cfeb1d75b7c4906734dd5c0c2')
noextract=(${pkgname%-bin}-${pkgver}.zip)

package() {
#     export LC_CTYPE="zh_CN.UTF-8"
    install -dm0755 "${pkgdir}/opt/bouffalolab/${pkgname%-bin}/"

    bsdtar xf "${srcdir}/${pkgname%-bin}-${pkgver}.zip" --strip-components=1 -C  "${pkgdir}/opt/bouffalolab/${pkgname%-bin}"
    rm -rf "${pkgdir}"/opt/bouffalolab/${pkgname%-bin}/*.exe
    rm -rf "${pkgdir}"/opt/bouffalolab/${pkgname%-bin}/*-macos
    rm -rf "${pkgdir}"/opt/bouffalolab/${pkgname%-bin}/*/*/*.exe
    rm -rf "${pkgdir}"/opt/bouffalolab/${pkgname%-bin}/*/*/*.dll
    rm -rf "${pkgdir}"/opt/bouffalolab/${pkgname%-bin}/utils/jlink

    # desktop entry
    install -Dm0644 /dev/stdin ${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop <<EOF
[Desktop Entry]
Name=${pkgname%-bin}
Name[zh_CN]=${pkgname%-bin}
Comment=${pkgdesc}
#MimeType=application/x-${pkgname%-bin};
Exec=${pkgname%-bin} %f
Type=Application
Categories=Development;Tool;
Terminal=false
Icon=${pkgname%-bin}.png
Version=1.0
EOF

    install -Dm0644 /dev/stdin ${pkgdir}/usr/share/applications/bflb-iot-tool.desktop <<EOF
[Desktop Entry]
Name=bflb-iot-tool
Name[zh_CN]=bflb-iot-tool
Comment=${pkgdesc}
#MimeType=application/x-bflb-iot-tool;
Exec=bflb-iot-tool %f
Type=Application
Categories=Development;Tool;
Terminal=false
Icon=bflb-iot-tool.png
Version=1.0
EOF

    _path=/opt/bouffalolab/
    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname%-bin}" << EOF
#!/bin/bash
# export LC_CTYPE="zh_CN.UTF-8"

if [ ! -d "$HOME"/.local/share/${pkgname%-bin} ] ; then
    cp -a /${_path}/${pkgname%-bin}/ "$HOME"/.local/share/ || exit 1
    ln -sf  "$HOME"/.local/share/${pkgname%-bin}/BLDevCube-ubuntu "$HOME"/.local/share/${pkgname%-bin}/${pkgname%-bin} || exit 1
fi

/"$HOME"/.local/share/${pkgname%-bin}/${pkgname%-bin} "\$@"
EOF

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/bflb-iot-tool" << EOF
#!/bin/bash
# export LC_CTYPE="zh_CN.UTF-8"

if [ ! -d "$HOME"/.local/share/${pkgname%-bin} ] ; then
    cp -a /${_path}/${pkgname%-bin}/ "$HOME"/.local/share/ || exit 1
    ln -sf  "$HOME"/.local/share/${pkgname%-bin}/bflb_iot_tool-ubuntu "$HOME"/.local/share/${pkgname%-bin}/bflb-iot-tool || exit 1
fi

/"$HOME"/.local/share/${pkgname%-bin}/bflb-iot-tool "\$@"
EOF
}
