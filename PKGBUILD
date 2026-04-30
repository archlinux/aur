# Maintainer: taotieren <admin@taotieren.com>

pkgbase=xbydriver-appimage
pkgname=(xbydriver-{bin,appimage})
_tagname=4.0.5-beta
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
sha256sums_x86_64=('4c13c43de9e7983c7b52b72b8a8c08bcb75cac1812b1a1da8a3f62afd2b60acc'
                   '34bd39565ce6fc8db59dd49e30af5871314861d7ac2d9e402a4906225e3f80a0')
sha256sums_aarch64=('3de05925bd137c60014d85b2581924ca5486276098b16884d975061c9360e71c'
                    '8f93903ee80ae158be66c4faf42f31501ceba2ebf7725f5dc9ac94d4d48c4698')
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
