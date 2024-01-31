# Based off of: https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html
# Maintainer: fengcheng <fengcheng@lidig.com>

_pkgname=linuxqq
_Pkgname=Linuxqq
_disname=qq

pkgname="${_pkgname}"-appimage-latest
pkgver=0.1.1
pkgrel=2
pkgdesc="New Linux QQ based on Electron"
arch=('x86_64' 'aarch64')
url="https://im.qq.com/linuxqq/"
license=('custom')
options=(!strip)
depends=('zlib' 'hicolor-icon-theme' 'fuse2')
makedepends=('nodejs' 'npm')
provides=('qq' 'linuxqq')
conflicts=('linuxqq' 'linuxqq-nt-bwrap')

source=("get_latest" "package.json")
sha256sums=('aca0128e6a5c9871b33c6773a7d6fa966a15c9b19323f7b2068bec5da0cad5c5'
            'f68a25e106dc496fbbb9a46c44c5624b3fc6ef436642b19d1023ecf53588cd90')

_appimage="${_Pkgname}-${CARCH}.AppImage"

prepare() {
    npm install
    export NODE_PATH=${srcdir}/node_modules
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
