# Maintainer: taotieren <admin@taotieren.com>

pkgbase=mcu-jlink-pack
pkgname=({airmcu,mcu,hkmicrochip,holtek,nationstech,py32}-jlink-pack)
pkgver=r8.94c90db
pkgrel=3
epoch=
arch=('any')
url="https://github.com/taotieren/mcu-jlink-pack"
license=('custom' 'Commercial' 'MIT')
groups=()
depends=(
    bash
    "jlink-software-and-documentation>=7.62")
makedepends=(git)
checkdepends=()
optdepends=()
conflicts=()
replaces=()
backup=()
options=('!strip' '!debug' '!lto')
changelog=
source=("${pkgbase}::git+${url}.git"
    "AirMCU-Jlink::git+https://github.com/Air-duino/AirMCU-Jlink.git"
    "airmcu-jlink-pack.install"
    "hkmicrochip-jlink-pack.install"
    "holtek-jlink-pack.install"
    "nationstech-jlink-pack.install"
    "py32-jlink-pack.install")
noextract=()
sha256sums=('SKIP'
            'SKIP'
            '42a0931b0b5f6c84655fe6aace1902abde56b7fee42b2147ee3364789d6389d2'
            'a526e928d9c5f57a05e7f938818c66504409809b9614c5450bc7c15c8b12871a'
            '5453ba72d95c28241b5e8af002ce601ee6cf7749023256598457df219659326a'
            '2281486bc2005550ff062e9788aff466d6b7d438551d97202c15579b7f344630'
            '9e580eb5f854343c2f2d9c1a289911b4f5d275d841d5bf91d966f1716e9ec487')

prepare() {
    git -C "${srcdir}/${pkgbase}" clean -dfx
    cd "${srcdir}/${pkgbase}"
    git submodule init
    git config submodule.AirMCU-Jlink.url "$srcdir/AirMCU-Jlink"
    git -c protocol.file.allow=always submodule update
}

pkgver() {
    cd "${srcdir}/${pkgbase}"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

package_mcu-jlink-pack() {
    pkgdesc="JLINK Pack 支持包支持 MCU 全系列芯片，在 SEGGER JLink 7.62 及以上版本下的安装。"
    provides=('MCU_JLINK_pack')
    depends=(
        airmcu-jlink-pack
        hkmicrochip-jlink-pack
        holtek-jlink-pack
        nationstech-jlink-pack
        py32-jlink-pack)
}

package_airmcu-jlink-pack() {
    pkgdesc="JLINK Pack 支持包支持合宙(AirMCU) MCU 全系列芯片，在 SEGGER JLink 7.62 及以上版本下的安装。"
    provides=('AirMCU_JLINK_pack')
    install=${pkgname}.install

    _name=AirMCU
    _aname=AirM2M
    _path=$_name/$_aname

    install -dm0755 "${pkgdir}/opt/$_path/"

    mv -f "${srcdir}"/${pkgbase}/AirMCU-Jlink/$_aname/FLM/AIR32F10X_1024.FLM "${srcdir}"/${pkgbase}/AirMCU-Jlink/$_aname/FLM/Air32F10X_1024.FLM

    cp -rv "${srcdir}"/${pkgbase}/AirMCU-Jlink/$_aname/* "${pkgdir}/opt/$_path/"

    find "${pkgdir}/opt/$_path/" -type f -exec chmod 644 "{}" \;
    find "${pkgdir}/opt/$_path/" -type d -exec chmod 755 "{}" \;

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" <<EOF
#!/bin/bash

if [ ! -d "\$HOME"/.config/SEGGER/JLinkDevices ] ; then
    mkdir -p \$HOME/.config/SEGGER/JLinkDevices || exit 1
fi

if [ -d "\$HOME"/.config/SEGGER/JLinkDevices/$_aname ] ; then
    rm -rf \$HOME/.config/SEGGER/JLinkDevices/$_aname || exit 1
fi

if [ ! -d "\$HOME"/.config/SEGGER/JLinkDevices/$_aname ] ; then
    cp -r /opt/$_path \$HOME/.config/SEGGER/JLinkDevices/ || exit 1
fi
EOF
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

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" <<EOF
#!/bin/bash

if [ ! -d "\$HOME"/.config/SEGGER/JLinkDevices ] ; then
    mkdir -p \$HOME/.config/SEGGER/JLinkDevices || exit 1
fi

if [ -d "\$HOME"/.config/SEGGER/JLinkDevices/$_aname ] ; then
    rm -rf \$HOME/.config/SEGGER/JLinkDevices/$_aname || exit 1
fi

if [ ! -d "\$HOME"/.config/SEGGER/JLinkDevices/$_aname ] ; then
    cp -r /opt/$_path \$HOME/.config/SEGGER/JLinkDevices/ || exit 1
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
    echo "</DataBase>" >>"${pkgdir}/opt/$_path/$_aname.xml"

    find "${pkgdir}/opt/$_path/" -type f -exec chmod 644 "{}" \;
    find "${pkgdir}/opt/$_path/" -type d -exec chmod 755 "{}" \;

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" <<EOF
#!/bin/bash

if [ ! -d "\$HOME"/.config/SEGGER/JLinkDevices ] ; then
    mkdir -p \$HOME/.config/SEGGER/JLinkDevices || exit 1
fi

if [ -d "\$HOME"/.config/SEGGER/JLinkDevices/$_aname ] ; then
    rm -rf \$HOME/.config/SEGGER/JLinkDevices/$_aname || exit 1
fi

if [ ! -d "\$HOME"/.config/SEGGER/JLinkDevices/$_aname ] ; then
    cp -r /opt/$_path \$HOME/.config/SEGGER/JLinkDevices/ || exit 1
fi
EOF
}

package_nationstech-jlink-pack() {
    pkgdesc="JLINK Pack 支持包支持 Nationstech (国民技术) 全系列芯片，在 SEGGER JLink 7.62 及以上版本下的安装。"
    provides=('Nationstech_JLINK_pack')
    install=${pkgname}.install

    _name=nationstech
    _aname=n32
    _path=$_name/$_aname

    install -dm0755 "${pkgdir}/opt/$_path/"

    cp -rv "${srcdir}"/${pkgbase}/Nationstech/* "${pkgdir}/opt/$_path/"

    rm -rf "${pkgdir}/opt/$_path/JLink*"

    find "${pkgdir}/opt/$_path/" -type f -exec chmod 644 "{}" \;
    find "${pkgdir}/opt/$_path/" -type d -exec chmod 755 "{}" \;

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" <<EOF
#!/bin/bash

if [ ! -d "\$HOME"/.config/SEGGER/JLinkDevices ] ; then
    mkdir -p \$HOME/.config/SEGGER/JLinkDevices || exit 1
fi

if [ -d "\$HOME"/.config/SEGGER/JLinkDevices/$_aname ] ; then
    rm -rf \$HOME/.config/SEGGER/JLinkDevices/$_aname || exit 1
fi

if [ ! -d "\$HOME"/.config/SEGGER/JLinkDevices/$_aname ] ; then
    cp -r /opt/$_path \$HOME/.config/SEGGER/JLinkDevices/ || exit 1
fi
EOF
}

package_py32-jlink-pack() {
    pkgdesc="JLINK Pack 支持包支持 py32 (普冉半导体) 全系列芯片，在 SEGGER JLink 7.62 及以上版本下的安装。"
    provides=('PY32_JLINK_pack')
    install=${pkgname}.install

    _name=Puya
    _aname=py32
    _path=$_name/$_aname

    install -dm0755 "${pkgdir}/opt/$_path/"

    cp -rv "${srcdir}"/${pkgbase}/PY32_JFlash/* "${pkgdir}/opt/$_path/"

    rm -rf "${pkgdir}/opt/$_path/JLink*"

    find "${pkgdir}/opt/$_path/" -type f -exec chmod 644 "{}" \;
    find "${pkgdir}/opt/$_path/" -type d -exec chmod 755 "{}" \;

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" <<EOF
#!/bin/bash

if [ ! -d "\$HOME"/.config/SEGGER/JLinkDevices ] ; then
    mkdir -p \$HOME/.config/SEGGER/JLinkDevices || exit 1
fi

if [ -d "\$HOME"/.config/SEGGER/JLinkDevices/$_aname ] ; then
    rm -rf \$HOME/.config/SEGGER/JLinkDevices/$_aname || exit 1
fi

if [ ! -d "\$HOME"/.config/SEGGER/JLinkDevices/$_aname ] ; then
    cp -r /opt/$_path \$HOME/.config/SEGGER/JLinkDevices/ || exit 1
fi
EOF
}
