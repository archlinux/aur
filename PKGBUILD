# Maintainer: taotieren <admin@taotieren.com>

pkgname=xdroid-bin
pkgver=8.0.64
pkgrel=1
epoch=
pkgdesc="卓懿,让安卓应用融入Linux平台应用生态体系，卓懿 x86_64 版（个人免费下载使用，不得用于商业用途）。"
arch=('x86_64')
url="https://www.linzhuotech.com/Product/download"
license=('custom')
groups=()
depends=("dkms" "xdg-utils")
makedepends=("libarchive")
checkdepends=()
optdepends=()
provides=("xDroidInstall")
conflicts=()
replaces=()
backup=()
options=('!strip')
install=
changelog=
source=("${pkgname}-${pkgver}.zip::https://d6.injdk.cn/xdroid/xDroidInstall-${arch}-v${pkgver}.zip")
noextract=(${pkgname}-${pkgver}.zip)
sha256sums=('508a8fb4a17e83c22db181f62202c40ee0b4aeb8a73393a6c856e2aa0748de1d')
#validpgpkeys=()

package() {
    install -dm0755 "${pkgdir}/opt/${pkgname}" \
                    "${pkgdir}/usr/bin" \
                    "${pkgdir}/usr/share/icons" \
                    "${pkgdir}/usr/share/applications"

    bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.zip" --no-same-owner  --no-same-permissions -C "${pkgdir}/opt/${pkgname}"

    ln -sf "/opt/${pkgname%-bin}/xAppCenter.png" "${pkgdir}/usr/share/icons/xAppCenter.png"
    ln -sf "/opt/${pkgname%-bin}/xAppCenter.desktop" "${pkgdir}/usr/share/applications/xAppCenter.desktop"

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname%-bin}-guide" << EOF
xdg-open https://www.linzhuotech.com/Public/Home/img/gitbook/user_manual_nv/_book/index.html
EOF

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/xDroidInstall" << EOF
#!/bin/env bash
export LD_LIBRARY_PATH="/opt/${pkgname}:\$LD_LIBRARY_PATH"
exec /opt/${pkgname}/xDroidInstall-${arch}-v${pkgver}.run "\$@"
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
