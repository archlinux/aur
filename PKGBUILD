# Maintainer: 4s3ti <4s3ti@4s3ti.net>

_pkgver=1.7.0
_appimage="Bazecor-${_pkgver}-x64.AppImage"

pkgname="bazecor"
pkgver=${_pkgver/-/.}
pkgrel=3
pkgdesc="Graphical configurator for Dygma keyboards"
url="https://github.com/Dygmalab/Bazecor"
license=("GPL-3.0-only")
provides=("${pkgname}")
conflicts=("${pkgname}-git")
arch=("x86_64")
depends=('zlib' 'fuse2')
options=(!strip)
noextract=("${_appimage}")

# https://github.com/Dygmalab/Bazecor/releases/download/v1.4.0-rc4/Bazecor-1.4.0-rc.4-x64.AppImage
source=("${url}/releases/download/v${_pkgver}/${_appimage}"
  "10-dygma.rules")
sha256sums=('8bee840604fc16fdc6376ab09ebf901fd99c0d3a1e42f8ade76a91b77d18f6c3'
            'aba17eabd0f8cbb5118d6d1013e40f3991e5e7c38f97e68f3053f8f5d098ff3c')

prepare() {
    chmod +x "${_appimage}"
    "./${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${pkgname/b/B}|"\
        "squashfs-root/${pkgname/b/B}.desktop"
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
    # Do not use Capital B for exec
    sed -i "s/Exec=Bazecor/Exec=bazecor/" "squashfs-root/${pkgname/b/B}.desktop"

}

package() {
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${_appimage}"

    # Desktop file for X
    install -Dm644 "${srcdir}/squashfs-root/${pkgname/b/B}.desktop"\
            "${pkgdir}/usr/share/applications/${pkgname}.desktop"

      # Desktop file for Wayland
    if [[ $XDG_SESSION_TYPE == "wayland" ]]; then
      electronFlags="--UseOzonePlatform --ozone-platform-hint=wayland %U"
      sed -i "s/%U/${electronFlags}/" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    fi

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${_appimage}" "${pkgdir}/usr/bin/${pkgname}"

    # Udev Rules
    # https://github.com/Dygmalab/Bazecor/blob/development/src/main/utils/udev.ts#L6C1-L6C284
    install -Dm644 "${srcdir}/10-dygma.rules" "${pkgdir}/etc/udev/rules.d/10-dygma.rules"
}
