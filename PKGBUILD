# Maintainer: taotieren <admin@taotieren.com>

pkgbase=aicube-isp-wine
pkgname=(aicube-isp-wine)
_name=AiCube-ISP
_tagname=6.96V-plus
pkgver=${_tagname//-/_}
pkgrel=1
pkgdesc="Wine AiCube 辅助开发，图形配置界面自动生成配置代码与程序框架；远程现场升级 APP 发布；单片机在线升级仿真调试平台软件；ISP 下载"
arch=('x86_64')
url="https://www.stcai.com/gjrj"
license=('LicenseRef-STCAI')
provides=('aicube-isp' 'stc-isp' 'stcai-isp' 'stc-isp-wine' 'stc-isp-bin')
conflicts=('aicube-isp' 'stc-isp' 'stcai-isp' 'stc-isp-wine' 'stc-isp-bin')
replaces=(
    'stc-isp-bin'
    'stc-isp-wine'
)
depends=(
    'sh'
    'wine'
    'wqy-microhei'
    'winetricks'
    'wine-mono'
    'wine-gecko'
)
optdepends=()
makedepends=('libarchive')
backup=()
options=('!strip' '!debug')
install=${pkgname}.install
source=(
    "http://www.stcaimcu.com/data/download/Tools/${_name}-v${_tagname}.zip"
    "${pkgname}.install"
    "icon.svg"
)
sha256sums=('97abbe01f9863df6477b7aa5d58b46dfb3f6bc8d93cfd5751cfe5800a0d827ab'
            'aa592f476dee3501ee22b26b5311826d6a6dd6ed03f7a94945016e058af4af24'
            'c04d3cf704c9055e4b0bb010d946c5e90710677c459def826f762c8e9d717538')
# noextract=("${_name}-v${pkgver}.zip")

# prepare() {
#     unar -e GBK "${srcdir}/${_name}-v${pkgver}.zip"
#     bsdtar -xf  "${srcdir}/${_name}-v${pkgver}.zip"
# }

package() {
    export LC_CTYPE="zh_CN.UTF-8"

    _stc="opt/stcai"
    _ftname="wqy-microhei.ttc"

    install -vdm0755 "${pkgdir}/${_stc}/${pkgname%-wine}"
    install -vDm6644 "${srcdir}/icon.svg" "${pkgdir}/usr/share/pixmaps/${pkgname%-wine}.svg"

    install -vDm0755 "${srcdir}/${_name}-v${_tagname}.exe" -t "${pkgdir}/${_stc}/${pkgname%-wine}"

    find "${pkgdir}/${_stc}" -type f -exec chmod 644 "{}" \;
    find "${pkgdir}/${_stc}" -type d -exec chmod 755 "{}" \;

    install -vDm0644 /dev/stdin "${pkgdir}/${_stc}/${pkgname%-wine}/regpatch.reg" << EOF
REGEDIT4

[HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\FontLink\SystemLink]
"Lucida Sans Unicode"="${_ftname}"
"Microsoft Sans Serif"="${_ftname}"
"MS Sans Serif"="${_ftname}"
"Tahoma"="${_ftname}"
"Tahoma Bold"="${_ftname}"
"SimSun"="${_ftname}"
"Arial"="${_ftname}"
"Arial Black"="${_ftname}"
"Lucida Sans Unicode"=str(7):"${_ftname}"
"Microsoft Sans Serif"=str(7):"${_ftname}"
"Tahoma"=str(7):"${_ftname}"
"Lucida Sans Unicode"="${_ftname}"
"Microsoft Sans Serif"="${_ftname}"
"Microsoft YaHei"="${_ftname}"
"微软雅黑"="${_ftname}"
"宋体"="${_ftname}"
"新細明體"="${_ftname}"
"DFKai-SB"="${_ftname}"
"FangSong"="${_ftname}"
"KaiTi"="${_ftname}"
"Microsoft JhengHei"="${_ftname}"
"Microsoft YaHei"="${_ftname}"
"MingLiU"="${_ftname}"
"NSimSun"="${_ftname}"
"PMingLiU"="${_ftname}"
"SimHei"="${_ftname}"
"SimKai"="${_ftname}"
"SimSun"="${_ftname}"

[HKEY_CURRENT_USER\Software\Wine\X11 Driver]
"ClientSideAntiAliasWithCore"="N"
"ClientSideAntiAliasWithRender"="N"
"ClientSideWithRender"="N"

[HKEY_CURRENT_USER\Control Panel\Desktop]
"FontSmoothing"="2"
"FontSmoothingOrientation"=dword:00000001
"FontSmoothingType"=dword:00000002
"FontSmoothingGamma"=dword:00000578

[HKEY_LOCAL_MACHINE\Software\Wine\Ports]
"COM1"="/dev/ttyUSB0"
"COM2"="/dev/ttyUSB1"
"COM3"="/dev/ttyUSB2"
"COM4"="/dev/ttyUSB3"
"COM5"="/dev/ttyUSB4"
"COM6"="/dev/ttyUSB5"
"COM7"="/dev/ttyUSB6"
"COM8"="/dev/ttyUSB7"
"COM9"="/dev/ttyUSB8"
"COM10"="/dev/ttyACM0"
"COM11"="/dev/ttyACM1"
"COM12"="/dev/ttyACM2"
"COM13"="/dev/ttyACM3"
"COM14"="/dev/ttyACM4"
"COM15"="/dev/ttyACM5"
"COM16"="/dev/ttyACM6"
"COM17"="/dev/ttyACM7"
"COM18"="/dev/ttyACM8"
"COM19"="/dev/ttyACM9"
EOF

    install -vDm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname%-wine}" << EOF
#!/bin/bash
export LC_CTYPE="zh_CN.UTF-8"
export WINEARCH=wow64 WINEPREFIX="\$HOME/.${pkgname%-wine}/wine"
export WINEDLLOVERRIDES="mscoree,mshtml="

if [ ! -d "\$HOME"/.${pkgname%-wine} ] ; then
    mkdir -p "\$HOME"/.${pkgname%-wine}/wine || exit 1

    cp -r /${_stc}/${pkgname%-wine}/regpatch.reg "\$HOME"/.${pkgname%-wine}/wine || exit 1

    ln -s /${_stc}/${pkgname%-wine}/${_name}-v${_tagname}.exe "\$HOME"/.${pkgname%-wine}/${_name}.exe || exit 1
fi

if [ ! -f "\$HOME"/.${pkgname%-wine}/regpatchok ] ; then
    touch "\$HOME"/.${pkgname%-wine}/regpatchok || exit 1
    cd "\$HOME"/.${pkgname%-wine}/wine && regedit regpatch.reg && wineserver -k
    winetricks -q mfc42
fi

wine "\$HOME"/.${pkgname%-wine}/${_name}.exe "\$@"
EOF

    install -vDm0644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname%-wine}.desktop" << EOF
[Desktop Entry]
Name=${pkgname%-wine}
Name[zh_CN]=${pkgname%-wine}
Comment=${pkgdesc}
#MimeType=application/x-${pkgname%-wine};
Exec=${pkgname%-wine} %f
Type=Application
Categories=Development;Tool;
Terminal=false
Icon=${pkgname%-wine}.svg
Version=${pkgver}
EOF
}
