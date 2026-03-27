# Maintainer: taotieren <admin@taotieren.com>

pkgbase=xbydriver-appimage
pkgname=(xbydriver-{bin,appimage})
_tagname=4.0.0-beta
pkgver=${_tagname//-/_}
pkgrel=7
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
source_x86_64=("${pkgbase}-${_tagname}-x86_64.AppImage::${url}/releases/download/v${_tagname}/alixby-${_tagname}-linux-x86_64.AppImage"
    "${pkgbase%-appimage}-${_tagname}-x86_64.deb::${url}/releases/download/v${_tagname}/alixby-${_tagname}-linux-amd64.deb")
source_aarch64=("${pkgbase}-${_tagname}-aarch64.AppImage::${url}/releases/download/v${_tagname}/alixby-${_tagname}-linux-arm64.AppImage"
    "${pkgbase%-appimage}-${_tagname}-aarch64.deb::${url}/releases/download/v${_tagname}/alixby-${_tagname}-linux-arm64.deb")
sha256sums_x86_64=('8b4efda1a0593f905b319c0351b626b9dc0f087512c1bdd0f18f6e85d85d062b'
                   'aea5c2349d0d3a77c628d17bc0a84f227b8e1cdaaceef82ea840e0ff3a114d44')
sha256sums_aarch64=('2458060bbdebd17a6de150e4efc595278852d19d00824ba3ccc288368bfdf3f1'
                    '0f0d41f79ae4480b95d2b949d65f14e20fe13affb7644f76d247bac10d682117')
noextract=(
    ${pkgbase%-appimage}-${_tagname}-x86_64.deb
    ${pkgbase%-appimage}-${_tagname}-aarch64.deb)
_install_path="/opt/appimages"

prepare() {
    cd ${srcdir}
    chmod a+x ${pkgbase}-${_tagname}-${CARCH}.AppImage
    "./${pkgbase}-${_tagname}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/alixby.AppImage|g' -i "${srcdir}/squashfs-root/alixby.desktop"
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

    mv "${pkgdir}/opt/小白羊 BoxPlayer" "${pkgdir}"/opt/alixby
    install -Dm0644 /dev/stdin "${pkgdir}/usr/share/applications/alixby.desktop" << EOF
[Desktop Entry]
Name=alixby
Name[zh_CN]=小白羊云盘
Exec="/opt/alixby/alixby" %U
Terminal=false
Type=Application
Icon=alixby
StartupWMClass=小白羊云盘
Comment=小白羊云盘
Categories=Network;
EOF
    local _icon
    for _icon in 30 64 256; do
        install -Dm0644 "${pkgdir}/opt/alixby/resources/images/icon_${_icon}x${_icon}.png" \
                    "${pkgdir}/usr/share/icons/hicolor/${_icon}x${_icon}/apps/xbyyunpan.png"
    done

    rm -rf "${pkgdir}/usr/share/icons/hicolor/0x0/apps/alixby.png"

    #修复下载时 aria2c 连接失败的问题
    sed -i 's|async-dns=false|async-dns=true|g' "${pkgdir}"/opt/alixby/resources/engine/aria2.conf
}

package_xbydriver-appimage() {
    pkgdesc+=" (AppImage)"
    provides=(${pkgname%-appimage})
    conflicts=(${pkgname%-appimage})

    install -Dm755 "${srcdir}"/${pkgbase}-${_tagname}-${CARCH}.AppImage "${pkgdir}"/${_install_path}/alixby.AppImage

    local _icon
    for _icon in 16 32 64 128 256; do
        install -Dm0644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/alixby.png" \
                    -t  "${pkgdir}/usr/share/icons/hicolor/${_icon}x${_icon}/apps"
    done

    install -Dm644 "${srcdir}/squashfs-root/alixby.desktop" -t "${pkgdir}/usr/share/applications"
#     install -Dm644 "${srcdir}/squashfs-root/LICENSE*" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
