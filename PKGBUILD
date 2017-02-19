# Maintainer: Guillaume Hayot <postblue@postblue.info>
pkgname=ghost-desktop
pkgver=1.2.1
pkgrel=1
pkgdesc="Ghost Desktop is a beautiful desktop application that allows you to easily manage multiple Ghost blogs and work without distractions."
arch=('x86_64' 'i686') 
url="https://github.com/TryGhost/Ghost-Desktop"
license=('MIT')
depends=('gtk2' 'libgnome-keyring' 'gnome-keyring' 'desktop-file-utils' 'python2' 'gconf' 'nodejs' 'libnotify' 'libxtst' 'nss' 'alsa-lib' 'libxss')
source=(https://github.com/TryGhost/Ghost-Desktop/releases/download/v${pkgver}/${pkgname}-${pkgver}-debian.deb)
install=${pkgname}.install
md5sums=('88c69b144d9a7533a58c6832dcb23a2c')
package() {
    msg2 "Extracting data.tar.xz..."
    bsdtar -xf data.tar.xz -C "${pkgdir}/"

    cd "${pkgdir}"
    find -name '*.py' -exec sed -i 's|^#!/usr/bin/env python\s*$|#!/usr/bin/env python2|' {} \;
    find -name '*.py' -exec sed -i 's|^#!/usr/bin/python\s*$|#!/usr/bin/python2|' {} \;
    
    find "${pkgdir}"/usr -type f -exec chmod 644 {} \;
    find "${pkgdir}"/usr/bin -type f -exec chmod 755 {} \;
    find "${pkgdir}"/usr -type d -exec chmod 755 {} \;

    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    
    # Cleaning up package
    rm -rf "${pkgdir}/usr/bin/Ghost"
    rm -rf "${pkgdir}/usr/shar/lintian"
    
    # Change paths to match pkgname
    mv "${pkgdir}/usr/share/Ghost" "${pkgdir}/usr/share/${pkgname}"
    mv "${pkgdir}/usr/share/applications/Ghost.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    sed -i "s/=Ghost/=${pkgname}/" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    sed -i "s/Name=ghost-desktop/Name=Ghost Desktop/" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    mv "${pkgdir}/usr/share/doc/Ghost" "${pkgdir}/usr/share/doc/${pkgname}"
    mv "${pkgdir}/usr/share/pixmaps/Ghost.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    
    # Fix bin
    chmod +x ${pkgdir}/usr/share/${pkgname}/Ghost
    ln -s /usr/share/${pkgname}/Ghost "${pkgdir}/usr/bin/${pkgname}"
    ln -s /usr/share/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
