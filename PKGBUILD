# Maintainer: Guillaume Hayot <ghayot@postblue.info>
pkgname=ghost-desktop
pkgver=1.5.1
pkgrel=1
pkgdesc="Ghost Desktop is a beautiful desktop application that allows you to easily manage multiple Ghost blogs and work without distractions."
arch=('x86_64' 'i686') 
url="https://github.com/TryGhost/Ghost-Desktop"
license=('MIT')
depends=('gtk2' 'libgnome-keyring' 'gnome-keyring' 'desktop-file-utils' 'python2' 'gconf' 'nodejs' 'libnotify' 'libxtst' 'nss' 'alsa-lib' 'libxss')
source=(https://github.com/TryGhost/Ghost-Desktop/releases/download/v${pkgver}/${pkgname}-${pkgver}-debian.deb)
install=${pkgname}.install
md5sums=('4181973236f7a73978078ab602e06bde')
package() {
    msg2 "Extracting data.tar.xz..."
    bsdtar -xf data.tar.xz -C "${pkgdir}/"

    msg2 "Fixing file permissions..."
    find "${pkgdir}"/usr -type f -exec chmod 644 {} \;
    find "${pkgdir}"/usr/bin -type f -exec chmod 755 {} \;
    find "${pkgdir}"/usr -type d -exec chmod 755 {} \;
    
    msg2 "Cleaning up package..."
    rm -rf "${pkgdir}/usr/bin/Ghost"
    rm -rf "${pkgdir}/usr/share/lintian"
    
    msg2 "Changing paths and names to match package name..."
    mv "${pkgdir}/usr/share/applications/Ghost.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    sed -i "s/=Ghost/=${pkgname}/" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    sed -i "s/Name=ghost-desktop/Name=Ghost Desktop/" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    mv "${pkgdir}/usr/share/doc/Ghost" "${pkgdir}/usr/share/doc/${pkgname}"
    mv "${pkgdir}/usr/share/pixmaps/Ghost.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    mv "${pkgdir}/usr/lib/Ghost" "${pkgdir}/usr/lib/${pkgname}"
    mv "${pkgdir}/usr/lib/${pkgname}/Ghost" "${pkgdir}/usr/lib/${pkgname}/${pkgname}"
    
    msg2 "Fixing exectuable..."
    chmod +x "${pkgdir}/usr/lib/${pkgname}/${pkgname}"
    ln -s "/usr/lib/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s "/usr/lib/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
