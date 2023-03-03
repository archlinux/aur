# Maintainer: taotieren <admin@taotieren.com>

pkgname=synwit-jlink-pack
pkgver=220311
pkgrel=1
epoch=
pkgdesc="JLINK Pack 支持包支持华芯微特 MCU 全系列芯片，在 SEGGER JLink 7.62 及以上版本下的安装。"
arch=('any')
url="https://www.synwit.cn/wendang455/"
license=('custom' 'Commercial')
groups=()
depends=("jlink-software-and-documentation>=7.62")
makedepends=('libarchive')
checkdepends=()
optdepends=()
provides=('SWM32_JLINK_pack')
conflicts=()
replaces=()
backup=()
options=('!strip')
install=${pkgname}.install
changelog=
source=("${pkgname}-${pkgver}.rar::https://www.synwit.cn/uploads/soft/20220721/1-220H1111129320.rar"
        "${pkgname}.install")
noextract=(${pkgname}-${pkgver}.rar)
sha256sums=('08699993243e4809296339beaa1b2ac5a17140eb78ad0d8eb274d86e0cfed9a7'
            'c817d29ac83eed7bf124ffe059a0c0a0e892630cafcd057d99c25d52e0b7cebd')

package() {
    _name=synwit
    _aname=swm32
    _path=$_name/$_aname

    install -dm0755 "${pkgdir}/opt/$_path/" \
                    "${pkgdir}/opt/$_path/Devices/"

    bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.rar" --strip-components=1 -C "${pkgdir}/opt/$_path/"

    mv "${pkgdir}/opt/$_path/JFLASH.txt" "${pkgdir}/opt/$_path/$_aname.xml"
    mv "${pkgdir}/opt/$_path/Synwit" "${pkgdir}/opt/$_path/Devices/"

    sed "1i<DataBase>" -i "${pkgdir}/opt/$_path/$_aname.xml"
    echo "</DataBase>" >> "${pkgdir}/opt/$_path/$_aname.xml"

    find "${pkgdir}/opt/$_path/" -type f -exec chmod 644 "{}" \;
    find "${pkgdir}/opt/$_path/" -type d -exec chmod 755 "{}" \;

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" << EOF
#!/bin/bash

if [ ! -d "$HOME"/.config/SEGGER/JLinkDevices ] ; then
    mkdir -p $HOME/.config/SEGGER/JLinkDevices || exit 1
fi

if [ -d "$HOME"/.config/SEGGER/JLinkDevices/$_aname ] ; then
    rm -rf $HOME/.config/SEGGER/JLinkDevices/$_aname || exit 1
fi

if [ ! -d "$HOME"/.config/SEGGER/JLinkDevices/$_aname ] ; then
    cp -r /opt/$_path $HOME/.config/SEGGER/JLinkDevices/ || exit 1
fi

EOF
}
