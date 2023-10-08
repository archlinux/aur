# Based off of: https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html
# Maintainer: fengcheng <fengcheng@lidig.com>

_pkgname=linuxqq
_Pkgname=Linuxqq
_disname=qq

pkgname="${_pkgname}"-appimage-latest
pkgver=0.1.0
pkgrel=1
pkgdesc="New Linux QQ based on Electron"
arch=('x86_64' 'aarch64')
url="https://im.qq.com/linuxqq/"
license=('custom')
options=(!strip)
depends=('zlib' 'hicolor-icon-theme' 'fuse2')
makedepends=('nodejs')
provides=('qq' 'linuxqq')
conflicts=('linuxqq' 'linuxqq-nt-bwrap')

source=("get_latest" "package.json" "package-lock.json")
sha256sums=('212d7493d21e7f1cd208f2183fde3ab971f0196b2f8af7a1629ca880f2d97081'
            '5e0cd25fab289fe73b89e034c803e7c1dc45b1880bd3bc1f4f6f31f084d16981'
            '0b44039655560b55f13fb228758901b699ba63c6999f619d81fa3f3284f57f47')

_appimage="${_Pkgname}-${arch}.AppImage"

prepare() {
    npm install
    local url=$(
        case $CARCH in
            "x86_64")
                ./get_latest x64
                ;;
            "aarch64")
                ./get_latest arm
                ;;
            *)
                exit 1;
                ;;
        esac
    )
    curl -o ${_appimage} ${url}

    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i \
        -e "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|" \
        -e "s|Icon=.*|Icon=/usr/share/icons/${_pkgname}.png|" \
        "squashfs-root/${_disname}.desktop"

    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/LICENSE.electron.txt" "${pkgdir}/opt/${pkgname}/LICENSE"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${_disname}.desktop"\
            "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"
    ln -s "$(realpath ${srcdir}/squashfs-root/${_disname}.png  --relative-to ${srcdir}/squashfs-root/usr/share/icons)"\
        "${pkgdir}/usr/share/icons/${_pkgname}.png"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"

    # Symlink license
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
    ln -s "/opt/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
