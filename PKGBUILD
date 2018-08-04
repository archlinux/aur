# Maintainer : Daniel Bermond < yahoo-com: danielbermond >
# Contributor: Mikalai Ramanovich < narod.ru: nikolay.romanovich >

pkgname=onlyoffice-bin
pkgver=4.8.7.392
pkgrel=2
pkgdesc='An office suite that combines text, spreadsheet and presentation editors'
arch=('x86_64')
url='https://www.onlyoffice.com/'
license=('AGPL3.0')
depends=('alsa-lib' 'nss' 'libxtst' 'qt5-x11extras' 'qt5-svg' 'gconf' 'libx11'
         'libxss' 'curl' 'gtkglext' 'cairo' 'libstdc++5' 'ttf-dejavu'
         'ttf-liberation' 'libcurl-gnutls' 'libcurl-compat')
makedepends=('w3m')
provides=('onlyoffice' 'onlyoffice-desktopeditors')
conflicts=('onlyoffice')
source=('http://download.onlyoffice.com/install/desktop/editors/linux/onlyoffice-desktopeditors_amd64.deb')
noextract=('onlyoffice-desktopeditors_amd64.deb')
sha256sums=('SKIP')

package() {
    mkdir -p "onlyoffice-${pkgver}"
    cd "onlyoffice-${pkgver}"
    
    # install bundled files
    msg2 'Installing bundled files...'
    bsdtar -xf "${srcdir}/onlyoffice-desktopeditors_amd64.deb"
    bsdtar -xf data.tar.xz -C "$pkgdir"
    
    # fix permissions
    msg2 'Fixing permissions...'
    chmod 755 "$pkgdir"{/opt/,/usr/{,bin/,share/{,applications/}}}
    chmod 755 "${pkgdir}/usr/bin/onlyoffice-desktopeditors"
    
    # fix wrong depedency
    msg2 'Fixing wrong dependency...'
    ln -sf $(find /usr/lib -maxdepth 1 -type f -name 'libcurl-compat.so.*' | head -n1) \
        "${pkgdir}/opt/onlyoffice/desktopeditors/converter/libcurl.so.4"
    
    # install icons
    msg2 'Installing icons...'
    for _res in 16 24 32 48 64 128 256
    do
        install -D -m644 "${pkgdir}/opt/onlyoffice/desktopeditors/asc-de-${_res}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_res}x${_res}/apps/asc-de.png"
    done
    
    # license
    msg2 'Installing license...'
    cd "${pkgdir}/opt/onlyoffice/desktopeditors"
    w3m -I 'utf-8' -T 'text/html' LICENSE.htm > "${srcdir}/onlyoffice-${pkgver}/LICENSE"
    install -D -m644 3DPARTYLICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    cd "${srcdir}/onlyoffice-${pkgver}"
    install -D -m644 LICENSE        -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
