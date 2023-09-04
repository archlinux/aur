# Maintainer: taotieren <admin@taotieren.com>

pkgbase=cloud-fs-bin
pkgname=clouddrive
pkgver=0.5.6
pkgrel=0
pkgdesc="CloudDrive是一个强大的多云盘管理工具，为用户提供包含云盘本地挂载的一站式的多云盘解决方案。"
arch=('x86_64' 'aarch64')
url="https://github.com/cloud-fs/cloud-fs.github.io"
license=('custom' 'Commercial')
provides=(${pkgname%-bin} clouddrive)
conflicts=(${pkgname%-bin} clouddrive)
replaces=()
depends=(fuse3)
makedepends=(libarchive)
backup=()
options=(!strip)
install=
source_x86_64=("${pkgname}-2-x86_64-${pkgver}.tgz::${url}/releases/download/v${pkgver}/clouddrive-2-linux-x86_64-${pkgver}.tgz")
source_aarch64=("${pkgname}-2-aarch64-${pkgver}.tgz::${url}/releases/download/v${pkgver}/clouddrive-2-linux-aarch64-${pkgver}.tgz")
sha256sums_x86_64=('e1bd60825a3f7e2f0f452f2b6d4df2984aa8021fe8ea413a6cd7c4a25f15d7a0')
sha256sums_aarch64=('62ddb4a0390e6a19a19d25457f1d5f1c32abcbff51cfed74bc5ae53c7a9de378')
noextract=(${pkgname}-2-x86_64-${pkgver}.tgz
    ${pkgname}-2-aarch64-${pkgver}.tgz)

_install_path="opt/${pkgname}"

package() {
    cd ${srcdir}
    install -dm755 ${pkgdir}/${_install_path}
    bsdtar xf "${pkgname}-2-${CARCH}-${pkgver}.tgz" --strip-components=2 -C ${pkgdir}/${_install_path}

    install -Dm755 /dev/stdin  "${pkgdir}/usr/bin/${pkgname}" << EOF
#!/bin/env bash

cd /opt/clouddrive
./clouddrive --no-sandbox

EOF

    install -Dm0644 "${pkgdir}/${_install_path}/wwwroot/icon-192.png" \
        "${pkgdir}/usr/share/icons/hicolor/192x192/apps/${pkgname}.png"
    install -Dm0644 "${pkgdir}/${_install_path}/wwwroot/icon-512.png" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"

    install -Dm644 /dev/stdin  "${pkgdir}/usr/share/applications/${pkgname}.desktop" << EOF
[Desktop Entry]
Name=${pkgname}
Name[zh_CN]=云盘
Exec=${pkgname} %U
Terminal=false
Type=Application
Icon=${pkgname}
StartupWMClass=云盘
X-AppImage-Version=${pkgver}
Comment=${pkgdesc}
Categories=Network;
EOF
#     install -Dm644 "${pkgdir}/${_install_path}/LICENSE*" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
