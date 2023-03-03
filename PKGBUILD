# Maintainer: taotieren <admin@taotieren.com>

pkgname=artery-jlink-pack
pkgver=2.0.0
pkgrel=0
epoch=
pkgdesc="JLINK Pack 支持包支持雅特力 (Artery) MCU 全系列芯片，在 SEGGER JLink 7.62 及以上版本下的安装。"
arch=('any')
url="https://www.arterytek.com/cn/support/index.jsp?index=0"
license=('custom' 'Commercial')
groups=()
depends=("jlink-software-and-documentation>=7.62")
makedepends=('libarchive')
checkdepends=()
optdepends=()
provides=('AT32_JLINK_pack')
conflicts=()
replaces=()
backup=()
options=('!strip')
install=${pkgname}.install
changelog=
source=("${pkgname}-${pkgver}.zip::https://www.arterytek.com/download/FAQ/FAQ0132_JLink%E6%89%8B%E5%8A%A8%E6%B7%BB%E5%8A%A0Artery%20MCU_V${pkgver}.zip"
        "${pkgname}.install")
noextract=(${pkgname}-${pkgver}.zip)
sha256sums=('58530387ae7c4c70fd291ff3dde9fc134284dfeccbb3869957327df63eb95fad'
            '3f0c2cea25eaad8bd4ca12b6adca76a8f02137bbff55af9a309ddbba3c4aa3e2')

package() {
    _name=artery
    _aname=at32
    _path=$_name/$_aname

    install -dm0755 "${pkgdir}/opt/$_path/" \
                    "${pkgdir}/opt/$_path/Devices/"

    bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.zip"  -C "${pkgdir}/opt/$_path/"

    mv "${pkgdir}/opt/$_path/Device.xml" "${pkgdir}/opt/$_path/$_aname.xml"
    mv "${pkgdir}/opt/$_path/ArteryTek" "${pkgdir}/opt/$_path/Devices/"
    rm -rf "${pkgdir}"/opt/$_path/*.pdf

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
