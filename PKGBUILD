_pkgname=visionaire-studio

pkgname="${_pkgname}"-appimage

# The version can not yet be optained through the AppImage
pkgver=5.3.5

pkgrel=1
pkgdesc="Development for P&C games"
arch=('x86_64')
url="https://www.visionaire-studio.net/"
license=('custom')
makedepends=('7zip')
depends=('zlib' 'fuse2' 'sdl2')
options=(!strip)

# The path to your libSDL2-2.0.so
_sdl2_lib_path="/usr/lib/libSDL2-2.0.so"

_appimage="Visionaire-Studio-x86_64.AppImage"

source_x86_64=("https://www.visionaire-studio.net/downloads/out/visionaire-studio-5-linux/${_appimage}" "https://github.com/AppImage/appimagetool/releases/download/continuous/appimagetool-x86_64.AppImage")
#noextract=("${_appimage}")
sha256sums_x86_64=('62a78ce9a1676949acd40fcb9600a92b5f4bae5be0867bcfb8b61089edd1c446'
                   '29348a20b80827cd261c28e95172ff828b69d43d4e4e18e3fd069e2c8693c94e')

prepare() {
    # Making the AppImage files executable
    chmod +x "${_appimage}"
    chmod +x "appimagetool-x86_64.AppImage"
    
    # extracting contents of AppImage
    7z x "${_appimage}"
}

build() {
    # Setting the sdl2 library path for the AppRun
    sed -i -E "s|#export SDL_DYNAMIC=/my/actual/libSDL-2.0.so.0|export SDL_DYNAMIC=${_sdl2_lib_path}|" \
        "AppRun"

    # setting the wm class so the icon would work properly 
    echo StartupWMClass=viseditor >> "${_pkgname}.desktop"
    
    # Adjusting .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=./AppRun.sh|Exec=env DESKTOPINTEGRATION=false ${_pkgname}|" \
        "${_pkgname}.desktop"
}


package() {
    # recompressing AppImage
   ./appimagetool-x86_64.AppImage -v "${srcdir}"

    # Installing AppImage
    install -Dm755 "${srcdir}/Visionaire-Studio-x86_64.AppImage" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
    
    # Installing Licenses
    install -dm755 "${pkgdir}/opt/${pkgname}/Licenses/"
    install -Dm644 "${srcdir}/BSD_3_Clause.txt" "${pkgdir}/opt/${pkgname}/Licenses/BSD_3_Clause.txt"
    install -Dm644 "${srcdir}/LGPL2_1.txt" "${pkgdir}/opt/${pkgname}/Licenses/LGPL2_1.txt"
    install -Dm644 "${srcdir}/libpng-LICENSE.txt" "${pkgdir}/opt/${pkgname}/Licenses/libpng-LICENSE.txt"
    install -Dm644 "${srcdir}/MIT.txt" "${pkgdir}/opt/${pkgname}/Licenses/MIT.txt"
    install -Dm644 "${srcdir}/webm.txt" "${pkgdir}/opt/${pkgname}/Licenses/webm.txt"
    install -Dm644 "${srcdir}/ZLIB.txt" "${pkgdir}/opt/${pkgname}/Licenses/ZLIB.txt"

    # Installing Desktop file
    install -Dm644 "${srcdir}/${_pkgname}.desktop" \
            "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # Installing Icon images
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/scalable/apps/"
    cp "${srcdir}/viseditor.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"

    # Symlink licenses
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
    ln -s "/opt/$pkgname/Licenses/BSD_3_Clause.txt" "$pkgdir/usr/share/licenses/$pkgname"
    ln -s "/opt/$pkgname/Licenses/LGPL2_1.txt" "$pkgdir/usr/share/licenses/$pkgname"
    ln -s "/opt/$pkgname/Licenses/libpng-LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname"
    ln -s "/opt/$pkgname/Licenses/MIT.txt" "$pkgdir/usr/share/licenses/$pkgname"
    ln -s "/opt/$pkgname/Licenses/webm.txt" "$pkgdir/usr/share/licenses/$pkgname"
    ln -s "/opt/$pkgname/Licenses/ZLIB.txt" "$pkgdir/usr/share/licenses/$pkgname"
}
