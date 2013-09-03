# Maintainer: Slash <demodevil5[at]yahoo[dot]com>
# Contributor: Stanislav GE <ginermail@gmail.com>
# Contributor: Baptiste Jonglez <zerstorer@free.fr>

pkgname=savage-xr
pkgver=1.0
pkgrel=1
pkgdesc="Savage: The Battle for Newerth is an online multiplayer team-based FPS/RTS hybrid. Completely free as of September 2006. (Includes XR Patches)"
arch=('i686' 'x86_64')
url='http://www.newerth.com/'
license=('custom: "Unknown"')
install=savage-xr.install
if [ "$CARCH" = "x86_64" ]; then
    depends=('lib32-alsa-lib' 'lib32-glu' 'lib32-libxft' 'lib32-libxinerama' 'lib32-mesa' 'lib32-sdl')
else
    depends=('sdl' 'mesa' 'pcre')
fi
source=('savage-xr.desktop' 'savage-xr-editor.desktop' \
    "xr_setup-${pkgver}-cl_lin_prod.bin::http://www.newerth.com/?id=downloads&op=downloadFile&file=xr_setup-${pkgver}-cl_lin_prod.bin&mirrorid=3" )
sha256sums=('8955d76ce899af3d8892a470c169bc9a220010d57f610a655d734ca8d10349ad'
            'da527fc99a755538fa0d5370e0499fd4e0c75d35e8611cfda092811b84d843b2'
            'f9ee596b0a02af69bdca1c51b1a2984edd012f34fb217a20378156ad3f55e380')
PKGEXT='.pkg.tar'

package () {
    # Create destination directories
    install -d ${pkgdir}/{usr/bin,opt/savage-xr}

    # Make Installer Executable
    chmod +x ${srcdir}/xr_setup-${pkgver}-cl_lin_prod.bin

    # Extract game from the installer
    ${srcdir}/xr_setup-${pkgver}-cl_lin_prod.bin --mode silent --prefix ${pkgdir}/opt/savage-xr

    # Install the game launcher
    ln -s /opt/savage-xr/savage.sh \
        ${pkgdir}/usr/bin/savage-xr

    # Install desktop file (Game Client)
    install -D -m 644 ${srcdir}/savage-xr.desktop \
        ${pkgdir}/usr/share/applications/savage-xr.desktop

    # Install desktop file (Map Editor)
    install -D -m 644 ${srcdir}/savage-xr-editor.desktop \
        ${pkgdir}/usr/share/applications/savage-xr-editor.desktop

    # Install Icon
    install -D -m 644 ${pkgdir}/opt/savage-xr/icon.xpm \
        ${pkgdir}/usr/share/pixmaps/savage-xr.xpm

    # Change group of the game folder to 'games'
    chown -R :games ${pkgdir}/opt/savage-xr
    chmod -R g+rwX ${pkgdir}/opt/savage-xr
}
