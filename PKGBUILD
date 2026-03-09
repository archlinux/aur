# Maintainer: Alex <alex@littlemarket.org>
#
# AUR binary package — downloads pre-built AppImage from GitHub Releases.
# Submit this file to AUR as the package named "ahoy".
#
# After submission, anyone on Garuda/Arch installs with:
#   yay ahoy
#   paru -S ahoy

pkgname=ahoy
pkgver=0.2.1
pkgrel=1
pkgdesc="Ahoy — discover and play independent music and shows"
arch=('x86_64' 'aarch64')
url="https://ahoy.ooo"
license=('ISC')
depends=('glib2' 'nss' 'alsa-lib' 'libxss' 'libxtst' 'libnotify' 'libappindicator-gtk3')
options=('!strip')

_base_url="https://github.com/oooAHOYooo/ahoy-little-platform/releases/download/v${pkgver}"
_appname="ahoy-indie-media"

source_x86_64=("${_appname}-${pkgver}-x86_64.AppImage::${_base_url}/${_appname}-${pkgver}-x86_64.AppImage")
source_aarch64=("${_appname}-${pkgver}-arm64.AppImage::${_base_url}/${_appname}-${pkgver}-arm64.AppImage")

sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
    if [ "$CARCH" = "x86_64" ]; then
        _src="${_appname}-${pkgver}-x86_64.AppImage"
    else
        _src="${_appname}-${pkgver}-arm64.AppImage"
    fi

    # Install AppImage to /opt/ahoy/
    install -Dm755 "${srcdir}/${_src}" "${pkgdir}/opt/ahoy/ahoy.AppImage"

    # `ahoy` command available in any terminal
    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/ahoy" << 'WRAPPER'
#!/bin/bash
exec /opt/ahoy/ahoy.AppImage "$@"
WRAPPER
    chmod 755 "${pkgdir}/usr/bin/ahoy"

    # Desktop launcher (Applications menu)
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/ahoy.desktop" << 'DESKTOP'
[Desktop Entry]
Type=Application
Name=Ahoy
GenericName=Media Player
Comment=Discover and play independent music and shows
Exec=ahoy %U
Icon=ahoy
Categories=AudioVideo;Music;
Terminal=false
Keywords=music;indie;media;podcast;ahoy;
DESKTOP
}
