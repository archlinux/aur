# Maintainer: Yukari0201 130890393+Yukari0201@users.noreply.github.com

_pkgname=carton

pkgname="${_pkgname}"-appimage
pkgver=0.1.8
pkgrel=2
pkgdesc="A Windows and Linux GUI client for sing-box.(主打高性能和易用性，非electron tauri等web套皮)"
arch=('x86_64' 'aarch64')
url="https://github.com/821869798/repo/"
license=('GPL-3.0')
depends=('zlib' 'fuse2')
options=('!strip')
_appimage_x86_64="${_pkgname}-${pkgver}-linux-x64.AppImage"
_appimage_aarch64="${_pkgname}-${pkgver}-linux-arm64.AppImage"
source_x86_64=("${_appimage_x86_64}::https://github.com/821869798/carton/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-x64.AppImage "
               "https://raw.githubusercontent.com/821869798/carton/refs/tags/v${pkgver}/LICENSE"
              )
source_aarch64=("${_appimage_aarch64}::https://github.com/821869798/carton/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-arm64.AppImage "
               "https://raw.githubusercontent.com/821869798/carton/refs/tags/v${pkgver}/LICENSE"
              )
noextract=("${_appimage_x86_64}" "${_appimage_aarch64}")
sha256sums_x86_64=('de43b80d6af4a145e8eb942883b5e659dfdd6896ec45e9bd9fed82a32f866160'
                   'd0f7cd798fd03274d6742245e320bbd2133dfdb7161c4470df4ea862b4fa57dd')
sha256sums_aarch64=('27822e5b445322ba2c91b6b541ec0b92877e95995aa3bd375d2c24f3e3de2994'
                   'd0f7cd798fd03274d6742245e320bbd2133dfdb7161c4470df4ea862b4fa57dd')

prepare() {
    if [[ ${CARCH} == "x86_64" ]]; then
        _appimage="${_appimage_x86_64}"
    else
        _appimage="${_appimage_aarch64}"
    fi
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
    if [[ ${CARCH} == "x86_64" ]]; then
        _appimage="${_appimage_x86_64}"
    else
        _appimage="${_appimage_aarch64}"
    fi

    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/opt/${pkgname}/LICENSE"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop"\
            "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    mkdir -p "${pkgdir}/usr/share/icons"
    cp "${srcdir}/squashfs-root/carton.png" "${pkgdir}/usr/share/icons"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"

    # Symlink license
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
    ln -s "/opt/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
