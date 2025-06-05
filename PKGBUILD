# Maintainer: taotieren <admin@taotieren.com>
# Contributor: little_sheepycn <little_sheepycn@redstonebuild.onmicrosoft.com>

pkgname=xdroid-bin
pkgver=13.2.380
pkgrel=3
epoch=
pkgdesc="卓懿,让安卓应用融入Linux平台应用生态体系，卓懿 x86_64 版（个人免费下载使用，不得用于商业用途）。"
arch=('x86_64')
url="https://www.linzhuotech.com/Product/download"
license=('LicenseRef-custom')
groups=()
depends=(
    dkms
    xdg-utils
)
makedepends=(
    libarchive
    unzip
)
checkdepends=()
optdepends=(
    'linux-headers: Headers and scripts for building modules for the Linux kernel'
    'linux-lts-headers: Headers and scripts for building modules for the LTS Linux kernel'
    'linux-zen-headers: Headers and scripts for building modules for the Linux ZEN kernel'
)
provides=("xDroidInstall")
conflicts=()
replaces=()
backup=()
options=('!strip')
install=${pkgname}.install
changelog=
_date=20250306
# https://zhuolin-my.sharepoint.cn/personal/shiyang_zhuolin_partner_onmschina_cn/Documents/%e5%8d%93%e6%87%bf/xDroidInstall-x86_64-v13.2.380-20250306.tar.xz?ga=1
source=(
    "${pkgname}-${pkgver}.tar.xz::https://zhuolin-my.sharepoint.cn/personal/shiyang_zhuolin_partner_onmschina_cn/Documents/卓懿/xDroidInstall-${arch}-v${pkgver}-${_date}.tar.xz?ga=1"
    "${pkgname}.install"
)
noextract=(${pkgname}-${pkgver}.tar.xz)
sha256sums=('cd06938f10c9227969c4af52ee23cb6b7a6b81c0a9ec44fec7446616b34d4ae9'
    '7d6168f0402ad58d35a7900ebc4e3008b6c0cb96261e2f216731e28188cd1d5d')
#validpgpkeys=()

package() {
    install -dm0755 "${pkgdir}/opt/${pkgname}" \
        "${pkgdir}/usr/bin" \
        "${pkgdir}/usr/share/icons" \
        "${pkgdir}/usr/share/applications"

    bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.tar.xz" --no-same-owner --no-same-permissions -C "${pkgdir}/opt/${pkgname}"
    # unzip "${srcdir}/${pkgname}-${pkgver}.tar.gz" -d "${pkgdir}/opt/${pkgname}"
    chmod +x "${pkgdir}/opt/${pkgname}"/*.run
    chown root:root "${pkgdir}/opt/${pkgname}"/*.run
    #mv -v "${pkgdir}"/opt/${pkgname}/xDroidInstall-${arch}-v${pkgver}*.run "${pkgdir}/opt/${pkgname}/xDroidInstall-${arch}-v${pkgver}.run"

    ln -sf "/opt/${pkgname%-bin}/xAppCenter.png" "${pkgdir}/usr/share/icons/xAppCenter.png"
    ln -sf "/opt/${pkgname%-bin}/xAppCenter.desktop" "${pkgdir}/usr/share/applications/xAppCenter.desktop"

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname%-bin}-guide" <<EOF
xdg-open https://www.linzhuotech.com/Public/Home/img/gitbook/user_manual_nv/_book/index.html
EOF

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/xDroidInstall" <<EOF
#!/bin/env bash
export LD_LIBRARY_PATH="/opt/${pkgname}:\$LD_LIBRARY_PATH"
exec /opt/${pkgname}/xDroidInstall-${arch}-v${pkgver}-${_date}.run "\$@"
EOF
    install -Dm0644 /dev/stdin "${pkgdir}/usr/share/applications/xDroidInstall.desktop" <<EOF
[Desktop Entry]
Categories=System;
Comment=LinZhuo xDroid xDroidInstall
Exec=xDroidInstall
Hidden=false
Icon=xAppCenter
Name=xDroidInstall
NoDisplay=false
Type=Application
X-Deepin-Vendor=user-custom
EOF
    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/xDroidUninstall" <<EOF
#!/bin/env bash
exec /opt/${pkgname%-bin}/uninstall "\$@"
EOF
    install -Dm0644 /dev/stdin "${pkgdir}/usr/share/applications/xDroidUninstall.desktop" <<EOF
[Desktop Entry]
Categories=System;
Comment=LinZhuo xDroid xDroidUninstall
Exec=xDroidUninstall
Hidden=false
Icon=xAppCenter
Name=xDroidUninstall
NoDisplay=false
Type=Application
X-Deepin-Vendor=user-custom
EOF
}
