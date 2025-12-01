# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Maintainer : Robin Candau <antiz@archlinux.org>
# Contributor: Mikalai Ramanovich < narod.ru: nikolay.romanovich >

pkgname=onlyoffice-bin
pkgver=9.2.0
pkgrel=1
pkgdesc='An office suite that combines text, spreadsheet and presentation editors'
arch=('x86_64')
url='https://www.onlyoffice.com/'
license=('AGPL-3.0-only')
depends=('curl' 'gtk3' 'alsa-lib' 'libpulse' 'gstreamer' 'gst-plugins-base-libs'
         'gst-plugins-ugly' 'libxss' 'nss' 'nspr' 'ttf-dejavu' 'ttf-liberation'
         'ttf-carlito' 'desktop-file-utils' 'hicolor-icon-theme')
optdepends=('libreoffice: for OpenSymbol fonts'
            'otf-takao: for japanese Takao fonts'
            'ttf-ms-fonts: for Microsoft fonts'
            'gst-plugins-good: for playing embedded video files'
            'gst-libav: for playing embedded video files')
provides=("onlyoffice=${pkgver}")
conflicts=('onlyoffice')
options=('!strip' '!emptydirs')
source=("onlyoffice-desktopeditors-${CARCH}-${pkgver}.deb"::"https://github.com/ONLYOFFICE/DesktopEditors/releases/download/v${pkgver}/onlyoffice-desktopeditors_amd64.deb"
        '010-onlyoffice-bin-fix-document-opening.patch')
noextract=("onlyoffice-desktopeditors-${CARCH}-${pkgver}.deb")
sha256sums=('1dbda5db273673c19803609ff738dbe3afc086c680097c76f611771ad377f2c7'
            '670de5f8b72679a54ff41a96ba1bdba9231a93260d1a8eaf304f66c8e40efdb7')

prepare() {
    mkdir -p "onlyoffice-${pkgver}/pkg"
    bsdtar -xf "${srcdir}/onlyoffice-desktopeditors-${CARCH}-${pkgver}.deb" -C "onlyoffice-${pkgver}"
    bsdtar -xf "onlyoffice-${pkgver}/data.tar.xz" -C "onlyoffice-${pkgver}/pkg"
    patch -d "onlyoffice-${pkgver}/pkg" -Np1 -i "${srcdir}/010-onlyoffice-bin-fix-document-opening.patch"
}

package() {
    cp -dr --no-preserve='ownership' "onlyoffice-${pkgver}"/pkg/* "$pkgdir"
    
    # icons
    local _file
    local _res
    while read -r -d '' _file
    do
        _res="$(sed 's/\.png$//;s/^.*-//' <<< "$_file")"
        install -d -m755 "${pkgdir}/usr/share/icons/hicolor/${_res}x${_res}/apps"
        ln -s "../../../../../../opt/onlyoffice/desktopeditors/asc-de-${_res}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_res}x${_res}/apps/onlyoffice-desktopeditors.png"
    done < <(find "${pkgdir}/opt/onlyoffice/desktopeditors" -maxdepth 1 -type f -name 'asc-de-*.png' -print0)
    
    # 3rd party licenses
    install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s ../../../../opt/onlyoffice/desktopeditors/3DPARTYLICENSE "${pkgdir}/usr/share/licenses/${pkgname}/3DPARTYLICENSE"
}
