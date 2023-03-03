# Maintainer: taotieren <admin@taotieren.com>

pkgbase=mcu-jlink-pack
pkgname=({mcu,hkmicrochip,holtek}-jlink-pack)
pkgver=67f2f2b
pkgrel=1
epoch=
arch=('any')
url="https://github.com/taotieren/mcu-jlink-pack"
license=('custom' 'Commercial' 'MIT')
groups=()
depends=("jlink-software-and-documentation>=7.62")
makedepends=(git)
checkdepends=()
optdepends=()
conflicts=()
replaces=()
backup=()
options=()
changelog=
source=("${pkgbase}::git+${url}.git")
noextract=()
sha256sums=('SKIP')

pkgver(){
    cd "${srcdir}/${pkgname}"
    git describe --always | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package_mcu-jlink-pack() {
    pkgdesc="JLINK Pack 支持包支持 MCU 全系列芯片，在 SEGGER JLink 7.62 及以上版本下的安装。"
    provides=('MCU_JLINK_pack')
    depends=(hkmicrochip-jlink-pack
              holtek-jlink-pack)
}

package_hkmicrochip-jlink-pack() {
    pkgdesc="JLINK Pack 支持包支持航顺(HK32) MCU 全系列芯片，在 SEGGER JLink 7.62 及以上版本下的安装。"
    provides=('HK32_JLINK_pack')
    install=${pkgname}.install

    _name=hkmicrochip
    _aname=hk32
    _path=$_name/$_aname

    install -dm0755 "${pkgdir}/opt/$_path/"

    cp -rv "${srcdir}"/${pkgbase}/HKMicroChip/* "${pkgdir}/opt/$_path/"
#     mv "${pkgdir}"/opt/$_path/Devices/HKMicrochip "${pkgdir}"/opt/$_path/HKMicrochip
#     rm -rf "${pkgdir}"/opt/$_path/Devices
#
#     sed "s|Devices/||g" -i "${pkgdir}/opt/$_path/$_aname.xml"

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

package_holtek-jlink-pack() {
    pkgdesc="JLINK Pack 支持包支持合泰(HT32) MCU 全系列芯片，在 SEGGER JLink 7.62 及以上版本下的安装。"
    provides=('HK32_JLINK_pack')
    install=${pkgname}.install

    _name=holtek
    _aname=ht32
    _path=$_name/$_aname

    install -dm0755 "${pkgdir}/opt/$_path/"

    cp -rv "${srcdir}"/${pkgbase}/Holtek/* "${pkgdir}/opt/$_path/"

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
