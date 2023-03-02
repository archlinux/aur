# Maintainer: taotieren <admin@taotieren.com>

pkgname=mm32-jlink-pack
pkgver=0.98
pkgrel=0
epoch=
pkgdesc="JLINK Pack 支持包支持 MM32 全系列芯片，在 SEGGER JLink 6.10 及以上版本下的安装。"
arch=('any')
url="https://www.mindmotion.com.cn/support/software/jlink_pack/"
license=('custom' 'Commercial')
groups=()
depends=("jlink-software-and-documentation>=6.10")
makedepends=('libarchive')
checkdepends=()
optdepends=()
provides=('MM32_JLINK_pack')
conflicts=()
replaces=()
backup=()
options=('!strip')
install=${pkgname}.install
changelog=
source=("${pkgname}-${pkgver}.zip::https://www.mindmotion.com.cn/download1.aspx?itemid=152&typeid=4"
        "${pkgname}.install")
noextract=(${pkgname}-${pkgver}.zip)
sha256sums=('f8e4f6b932daadff751484915a49c1fc6e73f3084b146a65c88e06374ac784a4'
            'de1e76c8cc464ac1a42b4466a82d75120c01f30d64b1f2c8ca122ea08c2c4d22')

package() {
    install -dm0755 "${pkgdir}/opt/mindmotion/mm32/"
    bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.zip" --strip-components=1 -C "${pkgdir}/opt/mindmotion/mm32/"

    find "${pkgdir}/opt/mindmotion/mm32/" -type f -exec chmod 644 "{}" \;
    find "${pkgdir}/opt/mindmotion/mm32/" -type d -exec chmod 755 "{}" \;

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" << EOF
#!/bin/bash

if [ ! -d "$HOME"/.config/SEGGER/JLinkDevices ] ; then
    mkdir -p $HOME/.config/SEGGER/JLinkDevices || exit 1
fi

if [ -d "$HOME"/.config/SEGGER/JLinkDevices/mm32 ] ; then
    rm -rf $HOME/.config/SEGGER/JLinkDevices/mm32 || exit 1
fi

if [ ! -d "$HOME"/.config/SEGGER/JLinkDevices/mm32 ] ; then
    cp -r /opt/mindmotion/mm32 $HOME/.config/SEGGER/JLinkDevices/ || exit 1
fi

EOF
}
