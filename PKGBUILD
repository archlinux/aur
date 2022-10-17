# Maintainer: taotieren <admin@taotieren.com>
# Contributor: little_sheepycn <little_sheepycn@redstonebuild.onmicrosoft.com>

pkgname=xdroid-bin
pkgver=9.0.5
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
source=("${pkgname}-${pkgver}.tar.gz::https://d6.injdk.cn/xdroid/xDroidInstall-${arch}-v${pkgver}.run.tar.gz")
noextract=(${pkgname}-${pkgver}.tar.gz)
sha256sums=('438803baef30141994e9582f6c5505af07dbec638396a048740b59d52b8e8033')
#validpgpkeys=()

package() {
    install -dm0755 "${pkgdir}/opt/${pkgname}" \
                    "${pkgdir}/usr/bin" \
                    "${pkgdir}/usr/share/icons" \
                    "${pkgdir}/usr/share/applications"

    bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.tar.gz" --no-same-owner  --no-same-permissions -C "${pkgdir}/opt/${pkgname}"
    mv -v "${pkgdir}"/opt/${pkgname}/xDroidInstall-${arch}-v${pkgver}*.run "${pkgdir}/opt/${pkgname}/xDroidInstall-${arch}-v${pkgver}.run"

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
