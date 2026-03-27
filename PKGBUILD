# Maintainer: delta-whiplash <delta@delta-net.ovh>

pkgname=pake-lizhi
_appname=LiZhi
pkgver=3.10.0
pkgrel=3
pkgdesc="LiZhi wrapped as an AppImage using Pake"
arch=('x86_64')
url="https://github.com/tw93/Pake"
license=('MIT')
depends=('fuse2' 'webkit2gtk')
provides=('pake-lizhi')
conflicts=('pake-lizhi')
options=('!strip')

source=("${_appname}.AppImage::https://github.com/tw93/Pake/releases/download/V${pkgver}/${_appname}_x86_64.AppImage")
sha256sums=('SKIP')

package() {
    install -Dm755 "${_appname}.AppImage" \
        "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/${pkgname}" <<'SCRIPT'
#!/bin/sh
# Workaround for WebKitWebProcess crash in sandboxed environments
export WEBKIT_DISABLE_COMPOSITING_MODE=1
export WEBKIT_DISABLE_GPU=1
exec /opt/pake-lizhi/pake-lizhi.AppImage --no-sandbox "$@"
SCRIPT
    chmod 755 "${pkgdir}/usr/bin/${pkgname}"

    install -dm755 "${pkgdir}/usr/share/applications"
    echo "[Desktop Entry]" > "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    echo "Name=${_appname} (Pake)" >> "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    echo "Exec=/usr/bin/pake-lizhi %U" >> "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    echo "Type=Application" >> "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    echo "Icon=pake-lizhi" >> "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    echo "Comment=${_appname} wrapped as an AppImage using Pake" >> "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    echo "Categories=Network;WebBrowser;" >> "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    echo "Terminal=false" >> "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
