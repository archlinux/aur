# Maintainer: Libor Wagner <liborwagner@gmail.com>

_pkgname=PlotJuggler

pkgname=plotjuggler-appimage
pkgver=3.17.2
pkgrel=1
pkgdesc="PlotJuggler is a tool to visualize time series that is fast, powerful and intuitive."
arch=('x86_64')
url="https://github.com/PlotJuggler/PlotJuggler"
license=('MPL-2.0')
depends=('zlib' 'fuse2')
options=(!strip)
_appimage="${pkgname}-${pkgver}.AppImage"
source_x86_64=("${_appimage}::https://github.com/PlotJuggler/PlotJuggler/releases/download/${pkgver}/${_pkgname}-${pkgver}-${arch}.AppImage"
               "https://raw.githubusercontent.com/PlotJuggler/PlotJuggler/${pkgver}/LICENSE.md"
              )
noextract=("${_appimage}")
sha256sums_x86_64=('6d427ca15f2d937699587eec668d1583e2468bc27bab8aaaee81276ad85941df'
                   '1f256ecad192880510e84ad60474eab7589218784b9a50bc7ceee34c2b91f1d5')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|"\
        "squashfs-root/usr/share/applications/io.plotjuggler.PlotJuggler.desktop"
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
    install -Dm644 "${srcdir}/LICENSE.md" "${pkgdir}/opt/${pkgname}/LICENSE.md"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/usr/share/applications/io.plotjuggler.PlotJuggler.desktop" \
            "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"

    # Symlink license
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
    ln -s "/opt/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
