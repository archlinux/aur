# Maintainer: Masetti <user at example dot com>
# Maintainer: Jove Yu <yushijun110@gmail.com>
# Maintainer: Guoxin "7Ji" Pu <pugokushin@gmail.com>
pkgbase=wps-office-linux
pkgname=('wps-office-linux' 'wps-office-linux-fonts')
pkgver=12.1.2.23578
pkgrel=2
pkgdesc="WPS Office: Writer, Presentation, and Spreadsheets. Compatible with MS Office."
arch=('x86_64')
url="https://linux.wps.cn"
license=('LicenseRef-WPS-EULA')
makedepends=(
  'tar')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core'
         'util-linux-libs' 'libsecret' 'glibc' 'freetype2' 'libcups' 'glib2'
         'glu' 'libsm' 'libxrender' 'fontconfig' 'libxext' 'libxcb' 'bzip2')
optdepends=(
  'ttf-mscorefonts-installer: for better MS Office compatibility'
  'wps-office-linux-fonts: FZ TTF fonts provided by wps office'
  'cups: for printing support')
options=('!strip' '!buildflags')

# 定义基础信息
_base_url="https://wps-linux-personal.wpscdn.cn/wps/download/ep/Linux2023/23578/wps-office_12.1.2.23578.AK.preread.sw_542488_amd64.deb"
_uri="/wps/download/ep/Linux2023/23578/wps-office_12.1.2.23578.AK.preread.sw_542488_amd64.deb"
_key="7f8faaaa468174dc1c9cd62e5f218a5b"

# 计算时间戳和哈希 (在打包时实时生成)
_t=$(date +%s)
_k=$(echo -n "${_key}${_uri}${_t}" | openssl md5 | cut -d' ' -f2)

# 最终合成的 source 链接
source=("${pkgname}-${pkgver}.deb::${_base_url}?t=${_t}&k=${_k}")

sha256sums=('20c9259c7eab08f6451c494b145e80b7941d0e0ed4b7f941645c3ea0fc106167')

prepare() {
  xz -df data.tar.xz
}

_install() {
  tar --no-same-owner -C "${pkgdir}" -xf data.tar "$@"
}

package_wps-office-linux() {
    install=wps-office-linux.install
    conflicts=('wps-office')
    provides=('wps-office')

    _install --exclude ./usr/share/fonts \
            --exclude ./usr/share/templates \
            --exclude ./usr/share/desktop-directories \
            ./opt/kingsoft/wps-office/office6 \
            ./usr

    # to save typing pkgdir
    cd "${pkgdir}"

    # use system lib
    rm opt/kingsoft/wps-office/office6/lib{jpeg,stdc++}.so*

    # fix menu category
    sed -i 's|Categories=.*|&Office;|' usr/share/applications/*.desktop

    # fix input method
    sed -i '2i [[ "$XMODIFIERS" == "@im=fcitx" ]] && export QT_IM_MODULE=fcitx' \
        usr/bin/{wps,wpp,et,wpspdf}

    # allow custom fontconfig
    sed -i '2i [[ -f ~/.config/Kingsoft/fonts/fonts.conf ]] && export FONTCONFIG_FILE=~/.config/Kingsoft/fonts/fonts.conf' \
        usr/bin/{wps,wpp,et,wpspdf}

    # fix bsdtar warning
    export LC_ALL=en_US.UTF-8

    # 默认关闭云服务后台进程：移除可执行权限
    chmod -x "${pkgdir}/opt/kingsoft/wps-office/office6/wpscloudsvr"


    #安装授权许可文件 (根据 control，WPS 有其自定义协议)
    #install -D -m644 "opt/kingsoft/wps-office/office6/mui/zh_CN/zyjkylin_License.rtf" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    #install -D -m644 "opt/kingsoft/wps-office/office6/mui/zh_CN/zyjkylin_EULA_linux.html" "${pkgdir}/usr/share/licenses/${pkgname}/EULA"
}

package_wps-office-linux-fonts() {
  conflicts=('wps-office-fonts')
  provides=('wps-office-fonts')
  _install ./etc/fonts ./usr/share/fonts
}
