# Maintainer: Daniel Brodsky <danbrodsky@pm.me>
pkgname=bonsai-browser
pkgver=1.0.9
pkgrel=1
pkgdesc="Web browser to help programmers think clearly"
_appimage="${pkgname}-${pkgver}.AppImage"
arch=('x86_64')
url="https://github.com/hyferg/bonsai-browser-public"
    license=('unknown')
    depends=()
options=(!strip)
    provides=('bonsai-browser')
    source=("${_appimage}::${url}/releases/download/v${pkgver}/Bonsai-${pkgver}.AppImage")
    md5sums=("1b3dc61243012afa58612014f46021f1")
    noextract=("${_appimage}")

    prepare() {
        echo Making AppImage executable...
            cd "${srcdir}"
            chmod +x ${_appimage}
        echo Extracting AppImage...
            ./$_appimage --appimage-extract
            sed -i "s+Exec=AppRun --no-sandbox.*+Exec=/usr/bin/bonsai-browser+" "squashfs-root/${pkgname}.desktop"
    }

package() {
    echo Installing AppImage...
        cd "${srcdir}"
        install -dm755 "${pkgdir}/opt/${pkgname}"
        cp -L "./${_appimage}" "${pkgdir}/opt/${pkgname}/${_appimage}"
        install -dm755 "${pkgdir}/usr/bin/"
        ln -s "/opt/${pkgname}/${_appimage}" "${pkgdir}/usr/bin/${pkgname}"

        echo Installing desktop file...
        install -dm755 "${pkgdir}/usr/share/applications/"
        cp -L "squashfs-root/${pkgname}.desktop" "${pkgdir}/usr/share/applications/"

        echo Installing desktop icon...
        install -dm755 "${pkgdir}/usr/share/pixmaps/"
        cp -L "squashfs-root/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/"

}
