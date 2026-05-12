# Maintainer: taotieren <admin@taotieren.com>

pkgbase=xbydriver-appimage
pkgname=(xbydriver-{bin,appimage})
_tagname=4.0.9-Beta
pkgver=${_tagname//-/_}
pkgrel=1
pkgdesc="小白羊网盘 - 多网盘统一管理 + 智能媒体库 + 高速下载"
arch=('x86_64' 'aarch64')
url="https://github.com/gaozhangmin/aliyunpan"
license=('custom' 'Commercial')
provides=(${pkgname})
conflicts=(${pkgname})
replaces=(aliyunpan-liupan1890
    aliyunpan-odomu)
depends=()
makedepends=(libarchive)
backup=()
options=()
install=
source_x86_64=("${pkgbase}-${_tagname}-x86_64.AppImage::${url}/releases/download/v${_tagname}/xbyboxplayer-${_tagname}-linux-x86_64.AppImage"
    "${pkgbase%-appimage}-${_tagname}-x86_64.deb::${url}/releases/download/v${_tagname}/xbyboxplayer-${_tagname}-linux-amd64.deb")
source_aarch64=("${pkgbase}-${_tagname}-aarch64.AppImage::${url}/releases/download/v${_tagname}/xbyboxplayer-${_tagname}-linux-arm64.AppImage"
    "${pkgbase%-appimage}-${_tagname}-aarch64.deb::${url}/releases/download/v${_tagname}/xbyboxplayer-${_tagname}-linux-arm64.deb")
sha256sums_x86_64=('9791c9e3101e1acb714860e5b4c06523df7cb17ddf36652c8b99c894fb245ab8'
                   'abdabdfe02ac8dca288b5a16b78e02e36ad480e6480d79c7929897d5621bea7a')
sha256sums_aarch64=('dae1fc8763b148c0c4266cba18b78924afdf972e72b07c49d9ce845ba673dade'
                    '33932d42ee397312d4e101b94a94e34542ed09cf4c5220fc78a52117011499c1')
noextract=(
    ${pkgbase%-appimage}-${_tagname}-x86_64.deb
    ${pkgbase%-appimage}-${_tagname}-aarch64.deb)
_install_path="/opt/appimages"

prepare() {
    cd ${srcdir}
    chmod a+x ${pkgbase}-${_tagname}-${CARCH}.AppImage
    "./${pkgbase}-${_tagname}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/xbyboxplayer.AppImage|g' -i "${srcdir}/squashfs-root/boxplayer.desktop"
}

package_xbydriver-bin() {
    pkgdesc+=" (bin)"
    provides=(${pkgname%-bin})
    conflicts=(${pkgname%-bin})

    if [ -d "${srcdir}/${pkgbase%-appimage}-${_tagname}-${CARCH}" ]; then
        rm -rf "${srcdir}/${pkgbase%-appimage}-${_tagname}-${CARCH}"
    fi
    mkdir -pv "${srcdir}/${pkgbase%-appimage}-${_tagname}-${CARCH}"
    bsdtar -xf "${srcdir}"/${pkgbase%-appimage}-${_tagname}-${CARCH}.deb -C "${srcdir}"/${pkgbase%-appimage}-${_tagname}-${CARCH}
    bsdtar -xf "${srcdir}"/${pkgbase%-appimage}-${_tagname}-${CARCH}/data.tar.xz --strip-components=1 -C ${pkgdir}/

    mv "${pkgdir}/opt/BoxPlayer" "${pkgdir}"/opt/xbyboxplayer
    install -Dm0644 /dev/stdin "${pkgdir}/usr/share/applications/xbyboxplayer.desktop" << EOF
[Desktop Entry]
Name=xbyboxplayer
Name[zh_CN]=小白羊云盘
Exec="/opt/xbyboxplayer/xbyboxplayer" %U
Terminal=false
Type=Application
Icon=xbyboxplayer
StartupWMClass=小白羊云盘
Comment=小白羊云盘
MimeType=x-scheme-handler/xbyboxplayer-oauth;
Categories=Network;
EOF
    local _icon
    for _icon in 30 64 256; do
        install -Dm0644 "${pkgdir}/opt/xbyboxplayer/resources/images/icon_${_icon}x${_icon}.png" \
                    "${pkgdir}/usr/share/icons/hicolor/${_icon}x${_icon}/apps/xbyboxplayer.png"
    done

    rm -rf "${pkgdir}/usr/share/icons/hicolor/0x0/apps/xbyboxplayer.png"

    #修复下载时 aria2c 连接失败的问题
    sed -i 's|async-dns=false|async-dns=true|g' "${pkgdir}"/opt/xbyboxplayer/resources/engine/aria2.conf
}

package_xbydriver-appimage() {
    pkgdesc+=" (AppImage)"
    provides=(${pkgname%-appimage})
    conflicts=(${pkgname%-appimage})

    install -Dm755 "${srcdir}"/${pkgbase}-${_tagname}-${CARCH}.AppImage "${pkgdir}"/${_install_path}/xbyboxplayer.AppImage

    local _icon
    for _icon in 30 64 256; do
        install -Dm0644 "${srcdir}/squashfs-root/resources/images/icon_${_icon}x${_icon}.png" \
                    -t  "${pkgdir}/usr/share/icons/hicolor/${_icon}x${_icon}/apps/xbyboxplayer.png"
    done

    install -Dm644 "${srcdir}/squashfs-root/boxplayer.desktop" -t "${pkgdir}/usr/share/applications"
#     install -Dm644 "${srcdir}/squashfs-root/LICENSE*" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
