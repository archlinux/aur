# Maintainer: logan_reed <liulingzhang.work@icloud.com>

_pkgname=navicat17-premium-cs
pkgname=navicat17-premium-zh-cn
pkgver=17.3.8
pkgrel=1
pkgdesc="Navicat Premium is a multi-connection database development tool. (Chinese Simplified)"
arch=('x86_64' 'aarch64')
url='https://www.navicat.com.cn/products/navicat-premium'
license=('custom:Navicat')
source_x86_64=("${_pkgname}-x86_64-${pkgver}.AppImage::https://dn.navicat.com/download/navicat17-premium-cs-x86_64.AppImage")
source_aarch64=("${_pkgname}-aarch64-${pkgver}.AppImage::https://dn.navicat.com/download/navicat17-premium-cs-aarch64.AppImage")

sha512sums_x86_64=('f980bda3fca75348deb7d672dc6afe6522f49f6b276ce6691de797b1c64c07524c094bbcbfa31205887b26fe26a1c0311b7692be550696cb14e63a22fbca3ad0')
sha512sums_aarch64=('0d682df1b6fc76f74878933e5030af4a5eef701989727e59ac1945449c87ce215cc7ec0ca3fac0c9b21faa1f9b70e0c32cab07b4d7798990250a6e245104e3af')

options=('!strip' '!debug')

prepare() {
    cd "${srcdir}/" && rm -rf "squashfs-root"
    local _arch_suffix
    case "${CARCH}" in
        x86_64)  _arch_suffix="x86_64" ;;
        aarch64) _arch_suffix="aarch64" ;;
    esac
    chmod +x "${srcdir}/${_pkgname}-${_arch_suffix}-${pkgver}.AppImage"
    "${srcdir}/${_pkgname}-${_arch_suffix}-${pkgver}.AppImage" --appimage-extract
}


package() {

    install -d "${pkgdir}/opt/${_pkgname}"
    cp -a "${srcdir}/squashfs-root/." "${pkgdir}/opt/${_pkgname}/"
    install -Dm644 "squashfs-root/navicat.desktop" \
        "${pkgdir}/usr/share/applications/navicat.desktop"
    # The AppImage bundles a libsystemd.so that conflicts with libmount.so's needs.
    # Preload the host system's libsystemd.so.0 so bundled libmount.so resolves correctly.
    sed -i "s#Exec=navicat#Exec=env LD_PRELOAD=\"/usr/lib/libsystemd.so.0\" navicat#" "${pkgdir}/usr/share/applications/navicat.desktop"
    if ! grep -q "LD_PRELOAD" "${pkgdir}/usr/share/applications/navicat.desktop"; then
        echo "ERROR: Failed to apply LD_PRELOAD patch to navicat.desktop" >&2
        return 1
    fi

    install -Dm644 "squashfs-root/usr/share/icons/hicolor/256x256/apps/navicat-icon.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/navicat-icon.png"

    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/${_pkgname}/AppRun" "${pkgdir}/usr/bin/navicat"
}

