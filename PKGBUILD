# Maintainer: detiam <dehe_tian at outlook dot com>
# Contributor: zoorat <zoorat [at] protonmail [dot] com>
# Contributor: zhullyb <zhullyb at outlook dot com>
# Contributor: Nico <d3sox at protonmail dot com>

_pkgname=fluent-reader
pkgname=$_pkgname-electron-bin
pkgver=1.2.2
pkgrel=1
pkgdesc='Modern desktop RSS reader built with Electron, React, and Fluent UI. (with system electron)'
arch=('x86_64')
url='https://hyliu.me/fluent-reader'
_url='https://github.com/yang991178/fluent-reader'
license=('custom:BSD3')
depends=('hicolor-icon-theme' 'electron>=25')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=(strip emptydirs zipman)
_appimage=${_pkgname}-${pkgver}.AppImage
source=("$_appimage::${_url}/releases/download/v${pkgver}/Fluent.Reader.${pkgver}.AppImage"
        "$_pkgname.sh")
sha256sums=('009c44d57e97fca260ffac56650272be01e3f5369b1419364d0768b43b388964'
            '9887decd3a128b84f10ffdd1cda7a201d4e156f56928d2a8f31685d713829b92')

prepare() {
    # making .AppImage file executable
    chmod +x "$_appimage"

    # extract .AppImage file
    "./$_appimage" --appimage-extract
}

build() {
    # modifying .desktop file
    sed -i -E "s|^Exec=AppRun --no-sandbox|Exec=/usr/bin/${_pkgname}|" "squashfs-root/${_pkgname}.desktop"
    # modifying .sh file
    sed -i -E "s|ASAR|/usr/lib/$_pkgname/app.asar|" "$srcdir/$_pkgname.sh"
}

package() {
    # Link entry point
    install -dm 755 "${pkgdir}/usr/bin"
    install "$_pkgname.sh" "${pkgdir}/usr/bin/${_pkgname}"

    cd squashfs-root || exit 1

    # Copy app file
    install -Dm 644 resources/app.asar "${pkgdir}/usr/lib/${_pkgname}/app.asar"

    # Copy icons files
    install -dm 755 "${pkgdir}/usr/share/icons"
    find usr/share/icons -type d -exec chmod 755 {} +
    cp -a usr/share/icons/* "${pkgdir}/usr/share/icons"

    # Copy desktop file
    install -Dm 755 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
 
