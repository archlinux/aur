# Maintainer : Daniel Bermond < gmail-com: danielbermond >
# Contributor: Mikalai Ramanovich < narod.ru: nikolay.romanovich >

pkgname=onlyoffice-bin
pkgver=5.1.27
pkgrel=2
pkgdesc='An office suite that combines text, spreadsheet and presentation editors'
arch=('x86_64')
url='https://www.onlyoffice.com/'
license=('AGPL3.0')
depends=('gcc-libs' 'xorg-server' 'libx11' 'libxss' 'gtkglext' 'cairo' 'gconf'
         'ttf-dejavu' 'ttf-liberation' 'libcurl-gnutls' 'libglvnd' 'gtk2'
         'gdk-pixbuf2' 'glib2' 'libxml2' 'gtk3' 'qt5-declarative' 'qt5-svg'
         'qt5-x11extras' 'nss')
makedepends=('w3m')
optdepends=('libreoffice: for OpenSymbol fonts'
            'ttf-carlito: for Carlito fonts'
            'ttf-ms-fonts: for Microsoft fonts'
            'otf-takao: for japanese Takao fonts')
provides=('onlyoffice')
conflicts=('onlyoffice')
options=('!strip')
_srcfile='onlyoffice-desktopeditors_amd64.deb'
_srcurl="https://github.com/ONLYOFFICE/DesktopEditors/releases/download/ONLYOFFICE-DesktopEditors-${pkgver}/${_srcfile}"
source=("onlyoffice-desktopeditors-${pkgver}_amd64.deb"::"$_srcurl")
noextract=("onlyoffice-desktopeditors-${pkgver}_amd64.deb")
sha256sums=('34af31acaa4b55fc6f2f148d60b494e07235409dc9bbe7a24f1e730eb5196e55')

prepare() {
    mkdir -p "onlyoffice-${pkgver}"
    
    cd "onlyoffice-${pkgver}"
    
    bsdtar -xf "${srcdir}/onlyoffice-desktopeditors-${pkgver}_amd64.deb"
}

package() {
    cd "onlyoffice-${pkgver}"
    
    # install bundled files
    printf '%s\n' '  -> Installing bundled files...'
    bsdtar -xf data.tar.xz -C "$pkgdir"
    
    # fix permissions
    printf '%s\n' '  -> Fixing permissions...'
    chmod 755 "$pkgdir"{/opt/,/usr/{,bin/,share/{,applications/}}}
    chmod 755 "${pkgdir}/usr/bin/onlyoffice-desktopeditors"
    
    # install icons
    printf '%s\n' '  -> Installing icons...'
    for _res in 16 24 32 48 64 128 256
    do
        install -D -m644 "${pkgdir}/opt/onlyoffice/desktopeditors/asc-de-${_res}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_res}x${_res}/apps/asc-de.png"
    done
    
    # license
    printf '%s\n' '  -> Installing license...'
    cd "${pkgdir}/opt/onlyoffice/desktopeditors"
    w3m -I 'utf-8' -T 'text/html' LICENSE.htm > "${srcdir}/onlyoffice-${pkgver}/LICENSE"
    install -D -m644 3DPARTYLICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    cd "${srcdir}/onlyoffice-${pkgver}"
    install -D -m644 LICENSE        -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
