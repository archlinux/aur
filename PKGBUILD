# Maintainer: nmdpkvs <952134128@qq.com>
pkgname=xdroid
pkgver=13.1.333
pkgrel=2
pkgdesc="X Droid is a software that allows Linux platforms (including domestic Linux platforms) to run various Android applications with high performance, supporting native running with large screens, multiple windows, no virtual machines, and no emulators"
arch=("${CARCH}")
url="https://www.linzhuotech.com/Product/download"
license=('custom')
depends=('dkms' 'xdg-utils')
makedepends=(libarchive)
optdepends=('linux-headers: 用于构建Linux内核模块的头文件和脚本'
    'linux-lts-headers: 用于构建LTS Linux内核模块的头文件和脚本'
    'linux-zen-headers: 用于构建Linux ZEN内核模块的头文件和脚本')
provides=("xDroidInstall")
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ChestnutYueyue/xdroid-bin/releases/download/v${pkgver}/xDroidInstall-${arch[@]}-v${pkgver}.tar.gz")
noextract=("${pkgname}-${pkgver}.tar.gz")
md5sums=("$(cat md5sums-${arch}.md5)")

package() {
    bash "${startdir}/kernel_version"
    install -dm0755 "${pkgdir}/opt/${pkgname}" \
                    "${pkgdir}/usr/bin" \
                    "${pkgdir}/usr/share/icons" \
                    "${pkgdir}/usr/share/applications"
    bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.tar.gz" --no-same-owner  --no-same-permissions -C "${pkgdir}/opt/${pkgname}"
    ln -sf "/opt/${pkgname}/xAppCenter.png" "${pkgdir}/usr/share/icons/xAppCenter.png"
    ln -sf "/opt/${pkgname}/xAppCenter.desktop" "${pkgdir}/usr/share/applications/xAppCenter.desktop"
    install -Dm0755 "${startdir}/xdroid-guide" "${pkgdir}/usr/bin/xdroid-guide"
    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/xDroidInstall" << EOF
    #!/bin/env bash
    export LD_LIBRARY_PATH="/opt/${pkgname}:\$LD_LIBRARY_PATH"
    exec /opt/${pkgname}/xDroidInstall-${arch[@]}-v${pkgver}.run "\$@"
EOF
    install -Dm0644 "${startdir}/xDroidInstall.desktop" "${pkgdir}/usr/share/applications/xDroidInstall.desktop"
    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/xDroidUninstall" << EOF
    #!/bin/env bash
    exec /opt/${pkgname}/uninstall "\$@"
EOF
    install -Dm0644 "${startdir}/xDroidUninstall.desktop"  "${pkgdir}/usr/share/applications/xDroidUninstall.desktop"
}
