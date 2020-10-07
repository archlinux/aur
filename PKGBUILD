# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Mikalai Ramanovich < narod.ru: nikolay.romanovich >

pkgname=onlyoffice-bin
pkgver=5.6.4
pkgrel=2
pkgdesc='An office suite that combines text, spreadsheet and presentation editors'
arch=('x86_64')
url='https://www.onlyoffice.com/'
license=('AGPL3')
depends=('curl' 'gtk3' 'alsa-lib' 'libpulse' 'gstreamer' 'gst-plugins-base-libs'
         'libxss' 'nss' 'nspr' 'ttf-dejavu' 'ttf-liberation' 'ttf-carlito'
         'desktop-file-utils' 'hicolor-icon-theme')
optdepends=('libreoffice: for OpenSymbol fonts'
            'otf-takao: for japanese Takao fonts'
            'ttf-ms-fonts: for Microsoft fonts')
provides=('onlyoffice')
conflicts=('onlyoffice')
options=('!strip' '!emptydirs')
_srcfile='onlyoffice-desktopeditors_amd64.deb'
_srcurl="https://github.com/ONLYOFFICE/DesktopEditors/releases/download/ONLYOFFICE-DesktopEditors-${pkgver}/${_srcfile}"
source=("onlyoffice-desktopeditors-${pkgver}_amd64.deb"::"$_srcurl"
        '010-onlyoffice-bin-fix-shell-errors.patch')
noextract=("onlyoffice-desktopeditors-${pkgver}_amd64.deb")
sha256sums=('1e9d1ed44ca4b66b7a4c3c28419bc93ef79711787d91d137df3c8e6c09e587a2'
            '3246760bb97efe3e6a5b38e855f3d77821b609ec65a347e17d4d652795c93977')

prepare() {
    mkdir -p "onlyoffice-${pkgver}"
    bsdtar -xf "${srcdir}/onlyoffice-desktopeditors-${pkgver}_amd64.deb" -C "onlyoffice-${pkgver}"
    
    # fix shell errors like '[: !=: unary operator expected'
    bsdtar -xf "onlyoffice-${pkgver}/data.tar.xz" --include usr/bin/onlyoffice-desktopeditors \
        --strip-components='3' -C "onlyoffice-${pkgver}"
    patch -d "onlyoffice-${pkgver}" -Np1 -i "${srcdir}/010-onlyoffice-bin-fix-shell-errors.patch"
}

package() {
    # install bundled files
    bsdtar -xf "onlyoffice-${pkgver}/data.tar.xz" -C "$pkgdir"
    install -D -m755 "onlyoffice-${pkgver}/onlyoffice-desktopeditors" "${pkgdir}/usr/bin"
    
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
