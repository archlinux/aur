# Maintainer : Mikhail Velichko  <efklid@gmail.com>

pkgname=r7-office
pkgver=7.0.2
pkgrel=1
pkgdesc='An enterprise office suite that combines text, spreadsheet and presentation editors'
arch=('x86_64')
url='https://r7-office.ru/'
license=('custom:JSC R7')
depends=('curl' 'gtk3' 'gtk2' 'alsa-lib' 'libpulse' 'gstreamer' 'gst-plugins-base-libs'
         'gst-plugins-ugly' 'libxss' 'nss' 'nspr' 'ttf-dejavu' 'ttf-liberation'
         'ttf-carlito' 'desktop-file-utils' 'hicolor-icon-theme')
optdepends=('libreoffice: for OpenSymbol fonts'
            'otf-takao: for japanese Takao fonts'
            'ttf-ms-fonts: for Microsoft fonts')
provides=('r7-office')
conflicts=('r7-office')
options=('!strip' '!emptydirs')
source=("r7-office.deb"::"https://download.r7-office.ru/ubuntu/r7-office.deb")
noextract=("r7-office.deb")
sha256sums=('b4b6262d78b5a548b78c0636117038c491dc21945bc909da830ff351185c3269')

prepare() {
    mkdir -p "r7-office-${pkgver}"
    bsdtar -xf "${srcdir}/r7-office.deb" -C "r7-office-${pkgver}"
}

package() {
    # install bundled files
    bsdtar -xf "r7-office-${pkgver}/data.tar.xz" -C "$pkgdir"
    
    # icons
    local _file
    local _res
    while read -r -d '' _file
    do
        _res="$(sed 's/\.png$//;s/^.*-//' <<< "$_file")"
        install -d -m755 "${pkgdir}/usr/share/icons/hicolor/${_res}x${_res}/apps"
        ln -s "../../../../../../opt/r7-office/desktopeditors/asc-de-${_res}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_res}x${_res}/apps/r7-office.png"
    done < <(find "${pkgdir}/opt/r7-office/desktopeditors" -maxdepth 1 -type f -name 'asc-de-*.png' -print0)
    
    # 3rd party licenses
    install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s ../../../../opt/r7-office/desktopeditors/3DPARTYLICENSE "${pkgdir}/usr/share/licenses/${pkgname}/3DPARTYLICENSE"
}
