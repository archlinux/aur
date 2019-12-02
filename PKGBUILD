# Maintainer : Daniel Bermond < gmail-com: danielbermond >
# Contributor: Mikalai Ramanovich < narod.ru: nikolay.romanovich >

pkgname=onlyoffice-bin
pkgver=5.4.2
pkgrel=1
pkgdesc='An office suite that combines text, spreadsheet and presentation editors'
arch=('x86_64')
url='https://www.onlyoffice.com/'
license=('AGPL3')
depends=('alsa-lib' 'curl' 'wget' 'libxss' 'gtkglext' 'cairo' 'gconf' 'gcc-libs'
         'ttf-dejavu' 'ttf-liberation' 'ttf-carlito' 'xdg-utils' 'libx11' 'fontconfig'
         'freetype2' 'libsm' 'libxtst' 'gstreamer' 'gst-plugins-base-libs' 'libdrm'
         'pango' 'libice' 'libpulse' 'libxext' 'libxdamage' 'nss' 'nspr'
         'libcurl-gnutls' 'libxcursor' 'gtk2' 'libglvnd' 'libxrender' 'libcups'
         'libxrandr' 'libxcomposite' 'libxfixes' 'libxi' 'atk' 'libxcb' 'gdk-pixbuf2'
         'qt5-svg' 'gtk3' 'qt5-declarative' 'qt5-x11extras' 'qt5-multimedia'
         'desktop-file-utils' 'hicolor-icon-theme')
optdepends=('libreoffice: for OpenSymbol fonts'
            'otf-takao: for japanese Takao fonts'
            'ttf-ms-fonts: for Microsoft fonts')
provides=('onlyoffice')
conflicts=('onlyoffice')
options=('!strip' '!emptydirs')
_srcfile='onlyoffice-desktopeditors_amd64.deb'
_srcurl="https://github.com/ONLYOFFICE/DesktopEditors/releases/download/ONLYOFFICE-DesktopEditors-${pkgver}/${_srcfile}"
source=("onlyoffice-desktopeditors-${pkgver}_amd64.deb"::"$_srcurl")
noextract=("onlyoffice-desktopeditors-${pkgver}_amd64.deb")
sha256sums=('32959ba8369468868ad0c416c3107b64e570ba3c159572f441609e68fc6dbbfa')

prepare() {
    mkdir -p "onlyoffice-${pkgver}"
    bsdtar -xf "${srcdir}/onlyoffice-desktopeditors-${pkgver}_amd64.deb" -C "onlyoffice-${pkgver}"
}

package() {
    cd "onlyoffice-${pkgver}"
    
    # install bundled files
    bsdtar -xf data.tar.xz -C "$pkgdir"
    
    # icons
    local _res
    for _res in 16 24 32 48 64 128 256
    do
        mkdir -p "${pkgdir}/usr/share/icons/hicolor/${_res}x${_res}/apps"
        ln -s "../../../../../../opt/onlyoffice/desktopeditors/asc-de-${_res}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_res}x${_res}/apps/asc-de.png"
    done
    
    # fix directory permissions
    local _dir
    while read -r -d '' _dir
    do
        chmod 755 "$_dir"
    done < <(find "$pkgdir" -type d -print0)
    
    # 3rd party licenses
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s ../../../../opt/onlyoffice/desktopeditors/3DPARTYLICENSE "${pkgdir}/usr/share/licenses/${pkgname}/3DPARTYLICENSE"
}
