# Maintainer: Katelyn Schiesser <katelyn.schiesser@gmail.com>

_pkgname=djcheck
_appimagename=DJCheck
_appimagever="1.0.0-beta.6"

pkgname="${_pkgname}"-appimage
pkgver=`echo ${_appimagever} | sed 's/^v//;s/-/_/'`
pkgrel=2
pkgdesc="Scan your music library for Pioneer CDJ compatibility issues — and fix them automatically."
arch=('x86_64')
url="https://github.com/finengines/djcheck"
license=('MIT')
depends=('zlib' 'ffmpeg')
options=(!strip)
_appimage="${_appimagename}-${_appimagever}.AppImage"
source_x86_64=("${_appimage}::${url}/releases/download/v${_appimagever}/${_appimage}"
               "https://raw.githubusercontent.com/finengines/djcheck/v${_appimagever}/LICENSE"
              )
noextract=("${_appimage}")
sha256sums_x86_64=('37a369ab058a2483809fb1125dd2f422ede87756cdb6ad97a58515fa5038b4b0'
                   'adbc0332dd8730c2ba1615be97df78e73dd14a418fbdbf7ebbb0135ca87141aa')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|"\
        "squashfs-root/${_pkgname}.desktop"
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/opt/${pkgname}/LICENSE"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop"\
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
