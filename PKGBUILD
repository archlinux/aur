# Maintainer: taotieren <admin@taotieren.com>

pkgbase=aliyunpan-odomu-appimage
pkgname=aliyunpan-odomu
pkgver=3.10.33
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
sha256sums_x86_64=('0ed104fba0ea1503de31f9e87becc364a6c0a0a11cf9f6b3386dccc884391982')
sha256sums_aarch64=('f5ed0919f1552f0253a29f74e271543d1687d6f407a92603f4036eb0d1e762e8')

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
