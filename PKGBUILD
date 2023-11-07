# Maintainer: taotieren <admin@taotieren.com>

pkgbase=xbydriver-appimage
pkgname=(xbydriver-{bin,appimage})
pkgver=3.12.1
pkgrel=1
pkgdesc="阿里云盘小白羊版 v3 修复版"
arch=('x86_64' 'aarch64')
url="https://github.com/gaozhangmin/aliyunpan"
license=('custom' 'Commercial')
provides=(${pkgname})
conflicts=(${pkgname})
replaces=(aliyunpan-liupan1890
    aliyunpan-odomu)
depends=()
makedepends=()
backup=()
options=(!strip)
install=
source_x86_64=("${pkgbase}-${pkgver}-x86_64.AppImage::${url}/releases/download/v${pkgver}/XBYDriver-${pkgver}-linux-x86_64.AppImage"
    "${pkgbase%-appimage}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/XBYDriver-${pkgver}-linux-amd64.deb")
source_aarch64=("${pkgbase}-${pkgver}-aarch64.AppImage::${url}/releases/download/v${pkgver}/XBYDriver-${pkgver}-linux-arm64.AppImage"
    "${pkgbase%-appimage}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/XBYDriver-${pkgver}-linux-arm64.deb")
sha256sums_x86_64=('4fc9b9b7575ad383f39e7e57248fbc3a158388264a7f08ba3900d40db5b7f4bd'
                   '831bdc5358a700e6158fb7949326e1e34eb1581ab810eb09e51b641176de0bf5')
sha256sums_aarch64=('16210f89e5f5e0fa2158fd262d579fd9d245242fbf54fb760a09505cfccd127c'
                    '6f69f35b53ca1ae383e003990f8eac10b47ba804b0553adf7c1098e66ec331c6')
noextract=(
    ${pkgbase%-appimage}-${pkgver}-x86_64.deb
    ${pkgbase%-appimage}-${pkgver}-aarch64.deb)
_install_path="/opt/appimages"

prepare() {
    cd ${srcdir}
    chmod a+x ${pkgbase}-${pkgver}-${CARCH}.AppImage
    "./${pkgbase}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/xbydriver-appimage.AppImage|g' -i "${srcdir}/squashfs-root/xbyyunpan.desktop"
}

package_xbydriver-bin() {
    pkgdesc+=" (bin)"
    provides=(${pkgname%-bin})
    conflicts=(${pkgname%-bin})

    if [ -d "${srcdir}/${pkgbase%-appimage}-${pkgver}-${CARCH}" ]; then
        rm -rf "${srcdir}/${pkgbase%-appimage}-${pkgver}-${CARCH}"
    fi
    mkdir -pv "${srcdir}/${pkgbase%-appimage}-${pkgver}-${CARCH}"
    bsdtar -xf "${srcdir}"/${pkgbase%-appimage}-${pkgver}-${CARCH}.deb -C "${srcdir}"/${pkgbase%-appimage}-${pkgver}-${CARCH}
    bsdtar -xf "${srcdir}"/${pkgbase%-appimage}-${pkgver}-${CARCH}/data.tar.xz --strip-components=1 -C ${pkgdir}/

    mv "${pkgdir}/opt/小白羊云盘" "${pkgdir}"/opt/${pkgbase%-appimage}
    install -Dm0644 /dev/stdin "${pkgdir}/usr/share/applications/xbyyunpan.desktop" << EOF
[Desktop Entry]
Name=xbydriver
Name[zh_CN]=小白羊云盘
Exec="/opt/xbydriver/xbyyunpan" %U
Terminal=false
Type=Application
Icon=xbyyunpan
StartupWMClass=小白羊云盘
Comment=小白羊云盘
Categories=Network;
EOF
    local _icon
    for _icon in 24 64 256; do
        install -Dm0644 "${pkgdir}/opt/xbydriver/resources/images/icon_${_icon}x${_icon}.png" \
                    "${pkgdir}/usr/share/icons/hicolor/${_icon}x${_icon}/apps/xbyyunpan.png"
    done

    rm -rf "${pkgdir}/usr/share/icons/hicolor/0x0/apps/xbyyunpan.png"

    #修复下载时 aria2c 连接失败的问题
    sed -i 's|async-dns=false|async-dns=true|g' "${pkgdir}"/opt/${pkgbase%-appimage}/resources/engine/aria2.conf
}

package_xbydriver-appimage() {
    pkgdesc+=" (AppImage)"
    provides=(${pkgname%-appimage})
    conflicts=(${pkgname%-appimage})

    install -Dm755 "${srcdir}"/${pkgbase}-${pkgver}-${CARCH}.AppImage "${pkgdir}"/${_install_path}/${pkgname}.AppImage

    local _icon
    for _icon in 16 32 64 128 256; do
        install -Dm0644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/xbyyunpan.png" \
                    -t  "${pkgdir}/usr/share/icons/hicolor/${_icon}x${_icon}/apps"
    done

    install -Dm644 "${srcdir}/squashfs-root/xbyyunpan.desktop" -t "${pkgdir}/usr/share/applications"
#     install -Dm644 "${srcdir}/squashfs-root/LICENSE*" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
