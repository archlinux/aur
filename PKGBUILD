# Maintainer: taotieren <admin@taotieren.com>

pkgname=xdroid-bin
pkgver=6.3016
pkgrel=1
epoch=
pkgdesc="卓懿,让安卓应用融入Linux平台应用生态体系，卓懿 x86_64 版（个人免费下载使用，不得用于商业用途）。"
arch=('x86_64')
url="https://www.linzhuotech.com/Product/download"
license=('custom')
groups=()
depends=("dkms" "xdg-utils")
makedepends=()
checkdepends=()
optdepends=()
provides=("xDroidInstall")
conflicts=()
replaces=()
backup=()
options=('!strip')
install=
changelog=
source=("${pkgname}-${pkgver}.tar.gz::https://d3.injdk.cn/xDroid/xDroidInstall-${arch}-v${pkgver}.tar.gz")
noextract=(${pkgname}-${pkgver}.tar.gz)
sha256sums=('7f04300962974b9d8263bd4af16ea6dddc45336443eed2c3c1fdc3bdd7a11e33')
#validpgpkeys=()

package() {
    install -dm0755 "${pkgdir}/opt/${pkgname}" \
                    "${pkgdir}/usr/bin" \
                    "${pkgdir}/usr/share/icons" \
                    "$pkgdir/usr/share/applications"

    tar -xf "${srcdir}/${pkgname}-${pkgver}.tar.gz" --no-same-owner  --no-same-permissions --strip-components=2 -C "${pkgdir}/opt/${pkgname}"

    ln -sf "/opt/${pkgname}/xAppCenter.png" "${pkgdir}/usr/share/icons/xAppCenter.png"
    ln -sf "/opt/${pkgname}/xAppCenter.desktop" "${pkgdir}/usr/share/applications/xAppCenter.desktop"
    ln -sf "/opt/${pkgname}/xDroidInstall.desktop" "${pkgdir}/usr/share/applications/xDroidInstall.desktop"

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname%-bin}-guide" << EOF
xdg-open https://www.linzhuotech.com/Public/Home/img/gitbook/user_manual_nv/_book/index.html
EOF

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/xDroidInstall" << EOF
#!/bin/env bash
export LD_LIBRARY_PATH="/opt/${pkgname}:\$LD_LIBRARY_PATH"
exec /opt/${pkgname}/xDroidInstall "\$@"
EOF
    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/xDroidUninstall" << EOF
#!/bin/env bash
exec /opt/${pkgname%-bin}/uninstall "\$@"
EOF
    install -Dm0644 /dev/stdin  "${pkgdir}/usr/share/applications/xDroidiUninstall.desktop" << EOF
Desktop Entry]
Categories=System;
Comment=LinZhuo xDroid xDroidiUninstall
Exec=xDroidiUninstall
Hidden=false
Icon=xAppCenter
Name=xDroidiUninstall
NoDisplay=false
Type=Application
X-Deepin-Vendor=user-custom
EOF
}
