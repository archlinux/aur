# Maintainer: cocosoul <952134128@qq.com>


pkgname=xdroid
pkgver=13.1.333
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
optdepends=('linux-headers: 用于构建Linux内核模块的头文件和脚本'
    'linux-lts-headers: 用于构建LTS Linux内核模块的头文件和脚本'
    'linux-zen-headers: 用于构建Linux ZEN内核模块的头文件和脚本')
provides=("xDroidInstall")
conflicts=()
replaces=()
backup=()
options=('!strip')
install=
changelog=
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ChestnutYueyue/xdroid-bin/releases/download/v13.1.333/xDroidInstall-${arch[@]}-v${pkgver}.tar.gz")
# https://github.com/ChestnutYueyue/xdroid-bin/releases/download/v13.1.333/xDroidInstall-x86_64-v13.1.333.tar.gz
noextract=("${pkgname}-${pkgver}.tar.gz")
md5sums=('55c6a49f1df84b12772a0a77a251aeab')
#validpgpkeys=()
version_compare() {
    local v1=$1
    local v2=$2
    local IFS=.
    local i ver1=($v1) ver2=($v2)
    # 比较每个部分的大小
    for ((i = 0; i < ${#ver1[@]} && i < ${#ver2[@]}; i++)); do
        if [[ -z ${ver2[i]} ]]; then
            echo "1"
            return
        elif [[ -z ${ver1[i]} ]]; then
            echo "2"
            return
        elif (( 10#${ver1[i]} > 10#${ver2[i]} )); then
            echo "1"
            return
        elif (( 10#${ver1[i]} < 10#${ver2[i]} )); then
            echo "2"
            return
        fi
    done
    if (( ${#ver1[@]} > ${#ver2[@]} )); then
        echo "1"
    elif (( ${#ver1[@]} < ${#ver2[@]} )); then
        echo "2"
    else
        echo "0"
    fi
}
package() {
    # 获取内核版本号
    # kernel_version_part=$(uname -r | cut -d- -f1 | cut -d. -f1-2 )
    kernel_version_part=$(uname -r | cut -d- -f1)
    # 比较内核版本  内核版本大于等于 4.5.0 i且内核版本小于 6.7.0 
    if [[ $(version_compare "$kernel_version_part" "4.5.0") == "1" && $(version_compare "$kernel_version_part" "6.7.0") == "2" ]]; then
        echo "您的系统内核版本为：$kernel_version_part ，符合安装条件。"
    else
        echo "您的系统内核版本为：$kernel_version_part"
        read -r -p "是否安装LTS内核版本?[Y/n]" answer
        if [ "$answer" == "y" ]; then
            echo "正在安装 LTS内核版本..."
            sudo pacman -S linux-lts linux-lts-headers
            sudo grub-mkconfig -o /boot/grub/grub.cfg
            echo "LTS内核版本安装完成 请重启后 重新运行脚本。"
            exit 1
        fi
    fi
  
    # 安装 xdroid-bin 包
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
exec /opt/${pkgname}/xDroidInstall-${arch[@]}-v${pkgver}.run "\$@"
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
