# Maintainer: taotieren <admin@taotieren.com>

pkgbase=aliyunpan-odomu-appimage
pkgname=aliyunpan-odomu
pkgver=3.10.25
pkgrel=0
pkgdesc="阿里云盘小白羊版 v3 修复版"
arch=('x86_64' 'aarch64')
url="https://github.com/odomu/aliyunpan"
license=('custom' 'Commercial')
provides=(${pkgname})
conflicts=(${pkgname})
replaces=(aliyunpan-liupan1890)
depends=()
makedepends=()
backup=()
options=()
install=
source_x86_64=("${pkgname}-x86_64-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/alixby-${pkgver}-linux-x86_64.AppImage")
source_aarch64=("${pkgname}-aarch64-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/alixby-${pkgver}-linux-arm64.AppImage")
sha256sums_x86_64=('94e10ced67dd012b78353c3bf8adb97539feb1ebdc53321afe8359410aa5ba36')
sha256sums_aarch64=('5e722157d3bff14d2c81cb1d5a71d429bd8e625dcf6699c2c5a92dce42565e1f')

_install_path="/opt/appimages"

prepare() {
    # Change src path name
    if [ ${CARCH} = "x86_64" ]; then
        install -Dm 755 ${pkgname}-x86_64-${pkgver}.AppImage ${pkgname}-${pkgver}.AppImage
    elif [ ${CARCH} = "aarch64" ]; then
        install -Dm 755  ${pkgname}-aarch64-${pkgver}.AppImage ${pkgname}-${pkgver}.AppImage
    fi

#     chmod a+x ${pkgname}-${pkgver}.AppImage
    "./${pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/aliyunpan-odomu.AppImage|g' -i "${srcdir}/squashfs-root/alixby.desktop"
}

package() {
    install -Dm755 "${pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname}.AppImage"

    local _icon
    for _icon in 16 32 64 128 256; do
        install -Dm0644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icon}x${_icon}/apps/alixby.png" \
                    -t  "${pkgdir}/usr/share/icons/hicolor/${_icon}x${_icon}/apps"
    done

    install -Dm644 "${srcdir}/squashfs-root/alixby.desktop" -t "${pkgdir}/usr/share/applications"
#     install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
