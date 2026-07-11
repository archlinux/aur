# Maintainer: Jan-Niklas Tomski <jan-niklas at tomski dot me>
_pkgname='wootility'
pkgname="${_pkgname}5-beta"
pkgver='5.4.0_beta.4'
_appimage="${_pkgname^}-${pkgver//_/-}.AppImage"
pkgrel=1
pkgdesc="Utility for configuring Wooting keyboards (AppImage beta release)"
arch=(any)
url='https://wooting.io/wootility'
license=('unknown')
depends=('fuse2')
makedepends=('util-linux' 'findutils')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=(!strip)
source=("${_appimage}::https://api.wooting.io/public/wootility/download?os=linux&version=${pkgver//_/-}"
        '70-wooting.rules')
noextract=("${_appimage}")
b2sums=('056e1bbef10ac2342248f5f2a78791ed4fe01945fff36ec95bbc0aa5519f43e32affa51ab5eb80b4a697e8aeb6a9548b767c0d7b45e293ca7e18c5e93f08b2c1'
        '80b4a516f8aafb6eada36cdde59295f2358b22e6cc28b1a21b0b5f22a59bcfabc63bba956d23544faca5fd76a1c4b4c1ff98ada41e7c9ad015d48c7c436dbac1')

prepare() {
    # Copying AppImage in case $SRCDEST is mounted with noexec
    cp "${_appimage}" "${_appimage}.copy"
    chmod +x "${_appimage}.copy"
    "./${_appimage}.copy" --appimage-extract "${_pkgname}.desktop"
    "./${_appimage}.copy" --appimage-extract usr/share/icons
    rm "${_appimage}.copy"
}

build() {
    sed -i -E "s|Exec=AppRun|Exec=${_pkgname}|" "squashfs-root/${_pkgname}.desktop"

    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX "${srcdir}/squashfs-root/usr"
}

package() {
    install -Dpm755 "${_appimage}" "${pkgdir}/opt/${_pkgname}/${_appimage}"
    install -d "${pkgdir}/usr/bin"
    ln -s "../../opt/${_pkgname}/${_appimage}" "${pkgdir}/usr/bin/${_pkgname}"

    # Install desktop entry and icon
    install -Dpm644 "squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -d "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

    # Install udev rules
    install -Dpm644 "70-wooting.rules" "${pkgdir}/usr/lib/udev/rules.d/70-wooting.rules"
}
