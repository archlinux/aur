# Maintainer: Yakov Potapov <potapovj(at)gmail(dot)com>
# Contributor : Mikhail Velichko  <efklid@gmail.com>

pkgname=r7-office
pkgver=2025.3.1
pkgrel=12
pkgdesc='An enterprise office suite that combines text, spreadsheet and presentation editors'
arch=('x86_64')
url='https://r7-office.ru/'
license=('custom:JSC R7')

makedepends=('icoutils')

depends=('curl' 'gtk3' 'gtk2' 'alsa-lib' 'libpulse' 'gstreamer' 'gst-plugins-base-libs'
         'gst-plugins-ugly' 'libxss' 'nss' 'nspr' 'ttf-dejavu' 'ttf-liberation'
         'ttf-carlito' 'desktop-file-utils' 'hicolor-icon-theme')

optdepends=('libreoffice: for OpenSymbol fonts'
            'otf-takao: for japanese Takao fonts'
            'ttf-ms-fonts: for Microsoft fonts')
provides=('r7-office')

conflicts=('r7-office')

options=('!strip' '!emptydirs')

source=("r7-office_2025.3.1-923~stretch_amd64.deb"::"https://download.r7-office.ru/debian/r7-office_2025.3.1-923~stretch_amd64.deb")

noextract=("https://download.r7-office.ru/debian/r7-office_2025.3.1-923~stretch_amd64.deb")

sha256sums=('403b00fed685c8d59aa773cee9177993cdb9133b7ee62c3e1d4ed64a71f0d587')

prepare() {
    mkdir -p "r7-office-${pkgver}"
    bsdtar -xf "${srcdir}/r7-office_2025.3.1-923~stretch_amd64.deb" -C "r7-office-${pkgver}"
}

package() {
    # install bundled files
    bsdtar -xf "r7-office-${pkgver}/data.tar.xz" -C "$pkgdir"
    
    # icons
    icotool -x ${pkgdir}/opt/r7-office/mediaviewer/mvapp.ico
    icotool -x ${pkgdir}/opt/r7-office/mediaviewer/ivapp.ico
    
    local _file
    local _res
    while read -r -d '' _file
    do
        _res="$(sed 's/\.png$//;s/^.*-//' <<< "$_file")"
        install -d -m755 "${pkgdir}/usr/share/icons/hicolor/${_res}x${_res}/apps"
        ln -s "../../../../../../opt/r7-office/desktopeditors/asc-de-${_res}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_res}x${_res}/apps/r7-office.png"
    done < <(find "${pkgdir}/opt/r7-office/desktopeditors" -maxdepth 1 -type f -name 'asc-de-*.png' -print0)
    
     while read -r -d '' _file
    do
        _res="$(sed 's/\.png$//;s/^.*_//;s/x32$//' <<< "$_file")"
        install -d -m755 "${pkgdir}/usr/share/icons/hicolor/${_res}/apps"
        install -Dm644 "$_file" \
            "${pkgdir}/usr/share/icons/hicolor/${_res}/apps/r7-mvapp.png"
    done < <(find "${srcdir}" -maxdepth 1 -type f -name 'mvapp_*.png' -print0)
        
    while read -r -d '' _file
    do
        _res="$(sed 's/\.png$//;s/^.*_//;s/x32$//' <<< "$_file")"
        install -d -m755 "${pkgdir}/usr/share/icons/hicolor/${_res}/apps"
        install -Dm644 "$_file" \
            "${pkgdir}/usr/share/icons/hicolor/${_res}/apps/r7-ivapp.png"
    done < <(find "${srcdir}" -maxdepth 1 -type f -name 'ivapp_*.png' -print0)
    #desktop files fix
    sed -i 's/Icon=r7-office/Icon=r7-ivapp/' ${pkgdir}/usr/share/applications/r7-office-imageviewer.desktop 
    sed -i 's/Icon=r7-office/Icon=r7-mvapp/' ${pkgdir}/usr/share/applications/r7-office-videoplayer.desktop 
    # 3rd party licenses
    install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s ../../../../opt/r7-office/desktopeditors/3DPARTYLICENSE "${pkgdir}/usr/share/licenses/${pkgname}/3DPARTYLICENSE"
}
