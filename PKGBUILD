# Maintainer: Slash <demodevil5[at]yahoo[dot]com>

pkgname=savage
pkgver=2.00e
pkgrel=9
pkgdesc="Savage: The Battle for Newerth is an online multiplayer team-based FPS/RTS hybrid. Completely free as of September 2006. (Includes SFE Patches)"
url="http://s2games.com/savage"
arch=('i686' 'x86_64')
license=('custom')
if [ "${CARCH}" = "x86_64" ]; then
    depends=('lib32-sdl' 'lib32-mesa' 'lib32-libjpeg6' 'lib32-e2fsprogs'
             'lib32-glib2' 'lib32-pcre' 'lib32-zlib' 'lib32-freetype2'
             'lib32-libxdamage')
else
    depends=('libgl' 'sdl' 'glib2' 'mesa' 'libjpeg6' 'libpng' 'libidn'
             'e2fsprogs' 'curl' 'openssl')
fi
install=savage.install
source=('savage.i686.launcher' 'savage.x86_64.launcher' 'savage.desktop' 'icon.xpm' \
'lin-client-auth-patch.zip::http://www.newerth.com/?id=downloads&op=downloadFile&file=lin-client-auth-patch.zip&mirrorid=3' \
'SFE-Standalone.tar.gz::http://www.newerth.com/?id=downloads&op=downloadFile&file=SFE-Standalone.tar.gz&mirrorid=3')
sha256sums=('401f458a9ff66473e329ce7f5363459877455300e5c6ba77e934e9423d7436e8'
            '2990284957c354d1f7bed8a39ffa5b0c3c76e59c366ceb976845419912940b23'
            '837a9df33bd539b3ac27549be4773b4e6bc5576247ce5fea9bb40bec5fadfdfe'
            'a5f19aa5ea77635362a79553e6571c534d442de6b34761941e0d4f5a2358f41e'
            'f5e714b012270e75fa4e8a188e3b072741889590c8740a74748e0c19acbe42e2'
            'a6b12837b6d0c643aaa1aa58dcb1b2711b17547e355ba187308472f6e1f52c13')
PKGEXT='.pkg.tar'

package() {
    cd ${srcdir}

    # Make Destination Game Directory
    install -d ${pkgdir}/opt/savage

    # Install Game
    tar zxf ${srcdir}/SFE-Standalone.tar.gz -C ${pkgdir}/opt/savage/

    # Install Client Auth Patch
    install -m 755 ${srcdir}/lin-client-auth-patch/silverback.bin \
        ${pkgdir}/opt/savage/silverback.bin

    install -m 755 ${srcdir}/lin-client-auth-patch/game/game.so \
        ${pkgdir}/opt/savage/game/game.so

    install -m 755 ${srcdir}/lin-client-auth-patch/libs/libpng12.so.0 \
        ${pkgdir}/opt/savage/libs/libpng12.so.0

    # Install Launcher Script
    install -D -m 755 ${srcdir}/savage.${CARCH}.launcher \
        ${pkgdir}/usr/bin/savage

    # Install License
    install -D -m 644 ${srcdir}/licenses.txt \
        ${pkgdir}/usr/share/licenses/${pkgname}/licenses.txt

    # Install Icon
    install -D -m 644 ${srcdir}/icon.xpm \
        ${pkgdir}/usr/share/pixmaps/savage.xpm

    # Install Desktop File
    install -D -m 644 ${srcdir}/savage.desktop \
        ${pkgdir}/usr/share/applications/savage.desktop

    # Create Log File
    touch ${pkgdir}/opt/savage/scripts.log

    # Set Ownership to root:games
    chown -R root:games ${pkgdir}/opt/savage
    chmod -R g+w ${pkgdir}/opt/savage
}
