# Maintainer: taotieren <admin@taotieren.com>
# Contributor: little_sheepycn <little_sheepycn@redstonebuild.onmicrosoft.com>

pkgname=xdroid-bin
pkgver=13.0.165
pkgrel=1
epoch=
pkgdesc="卓懿,让安卓应用融入Linux平台应用生态体系，卓懿 x86_64 版（个人免费下载使用，不得用于商业用途）。"
arch=('x86_64')
url="https://www.linzhuotech.com/Product/download"
license=('custom')
groups=()
depends=(dkms
    xdg-utils)
makedepends=(libarchive)
checkdepends=()
optdepends=('linux-headers: Headers and scripts for building modules for the Linux kernel'
    'linux-lts-headers: Headers and scripts for building modules for the LTS Linux kernel'
    'linux-zen-headers: Headers and scripts for building modules for the Linux ZEN kernel')
provides=("xDroidInstall")
conflicts=()
replaces=()
backup=()
options=('!strip')
install=
changelog=
_date=20240119
source=("${pkgname}-${pkgver}.tar.gz::https://zhuolin-my.sharepoint.cn/personal/shiyang_zhuolin_partner_onmschina_cn/Documents/卓懿/xDroidInstall-${arch}-v${pkgver}-${_date}.run.tar.gz?ga=1")
# https://zhuolin-my.sharepoint.cn/personal/shiyang_zhuolin_partner_onmschina_cn/Documents/%e5%8d%93%e6%87%bf/xDroidInstall-x86_64-v12.0.136.run.tar.gz?ga=1
noextract=(${pkgname}-${pkgver}.tar.gz)
md5sums=('da6859f01d0ed6e97fa749d7f5f42b3f')
sha256sums=('c12d9f654b223fe9efc80986319cf755204bdf26fb0cdb4ef2c8d55e24452808')
#validpgpkeys=()

package() {
    install -dm0755 "${pkgdir}/opt/${pkgname}" \
                    "${pkgdir}/usr/bin" \
                    "${pkgdir}/usr/share/icons" \
                    "${pkgdir}/usr/share/applications"

    bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.tar.gz" --no-same-owner  --no-same-permissions -C "${pkgdir}/opt/${pkgname}"
    #mv -v "${pkgdir}"/opt/${pkgname}/xDroidInstall-${arch}-v${pkgver}*.run "${pkgdir}/opt/${pkgname}/xDroidInstall-${arch}-v${pkgver}.run"

    ln -sf "/opt/${pkgname%-bin}/xAppCenter.png" "${pkgdir}/usr/share/icons/xAppCenter.png"
    ln -sf "/opt/${pkgname%-bin}/xAppCenter.desktop" "${pkgdir}/usr/share/applications/xAppCenter.desktop"

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname%-bin}-guide" << EOF
xdg-open https://www.linzhuotech.com/Public/Home/img/gitbook/user_manual_nv/_book/index.html
EOF

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/xDroidInstall" << EOF
#!/bin/env bash
export LD_LIBRARY_PATH="/opt/${pkgname}:\$LD_LIBRARY_PATH"
exec /opt/${pkgname}/xDroidInstall-${arch}-v${pkgver}-${_date}.run "\$@"
EOF
    install -Dm0644 /dev/stdin  "${pkgdir}/usr/share/applications/xDroidInstall.desktop" << EOF
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
    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/xDroidUninstall" << EOF
#!/bin/env bash
exec /opt/${pkgname%-bin}/uninstall "\$@"
EOF
    install -Dm0644 /dev/stdin  "${pkgdir}/usr/share/applications/xDroidUninstall.desktop" << EOF
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
