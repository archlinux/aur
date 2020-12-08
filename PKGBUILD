# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Mikalai Ramanovich < narod.ru: nikolay.romanovich >

pkgname=onlyoffice-bin
pkgver=6.1.0
pkgrel=1
_build=90
pkgdesc='An office suite that combines text, spreadsheet and presentation editors'
arch=('x86_64')
url='https://www.onlyoffice.com/'
license=('AGPL3')
depends=('curl' 'gtk3' 'alsa-lib' 'libpulse' 'gstreamer' 'gst-plugins-base-libs'
         'gst-plugins-ugly' 'libxss' 'nss' 'nspr' 'ttf-dejavu' 'ttf-liberation'
         'ttf-carlito' 'desktop-file-utils' 'hicolor-icon-theme')
optdepends=('libreoffice: for OpenSymbol fonts'
            'otf-takao: for japanese Takao fonts'
            'ttf-ms-fonts: for Microsoft fonts')
provides=('onlyoffice')
conflicts=('onlyoffice')
options=('!strip' '!emptydirs')
source=("https://github.com/ONLYOFFICE/DesktopEditors/releases/download/v${pkgver}/onlyoffice-desktopeditors_${pkgver}-${_build}_amd64.deb")
noextract=("onlyoffice-desktopeditors-${pkgver}_amd64.deb")
sha256sums=('4d468408284cdc6c6d079e3fccd20a8d1228727031a4154aed7b17df3edaabca')

prepare() {
    mkdir -p "onlyoffice-${pkgver}"
    bsdtar -xf "${srcdir}/onlyoffice-desktopeditors_${pkgver}-${_build}_amd64.deb" -C "onlyoffice-${pkgver}"
}

package() {
    # install bundled files
    bsdtar -xf "onlyoffice-${pkgver}/data.tar.xz" -C "$pkgdir"
    
    # icons
    local _file
    local _res
    while read -r -d '' _file
    do
        _res="$(sed 's/\.png$//;s/^.*-//' <<< "$_file")"
        mkdir -p "${pkgdir}/usr/share/icons/hicolor/${_res}x${_res}/apps"
        ln -s "../../../../../../opt/onlyoffice/desktopeditors/asc-de-${_res}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_res}x${_res}/apps/onlyoffice-desktopeditors.png"
    done < <(find "${pkgdir}/opt/onlyoffice/desktopeditors" -maxdepth 1 -type f -name 'asc-de-*.png' -print0)
    
    # 3rd party licenses
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s ../../../../opt/onlyoffice/desktopeditors/3DPARTYLICENSE "${pkgdir}/usr/share/licenses/${pkgname}/3DPARTYLICENSE"
}
