# Maintainer: Slash <demodevil5 [at] yahoo [dot] com>

pkgname=etqw
pkgver=1.5
pkgrel=5
pkgdesc="Enemy Territory: Quake Wars is a commercial team and class-based multiplayer game. You need the retail DVD to play."
arch=('i686' 'x86_64')
url="https://zerowing.idsoftware.com/linux/etqw/ETQWFrontPage/index.html"
license=('custom')
if [ "$CARCH" = "x86_64" ]; then
    depends=('lib32-alsa-lib' 'lib32-libgl' 'lib32-sdl' 'lib32-gcc-libs' 'lib32-zlib' 'lib32-libjpeg')
else
    depends=('libgl' 'sdl' 'gcc-libs' 'zlib' 'libjpeg')
fi
makedepends=('unzip')
conflicts=('bin32-etqw')
install='etqw.install'
source=('etqw.launcher' 'etqw-rthread.launcher' 'etqwded.launcher' 'etqw.desktop' \
"https://slashbunny.com/aur/etqw/ETQW-client-${pkgver}-full.x86.run")
sha256sums=('79393825ab93bb9cecee69ad6ddafdaef3526bf9f757023325bfffc228ad920c'
            '38140d4465f7e337e4e079150576abaed9ed8cd51b4092b434a7d6ae619998b4'
            '74887f52f0a82fe241bd5a99a1287c26c3c52ef4314cf6720cf3f59c9ad3a62e'
            'ed85a82636aed87c54268d84f0f7e09a0a7a37b0def9415fd8791684c5e90288'
            '827395c5ad7bff36a8456f7f210ab43b8cc2b0d18e9f366d15ff4f11eacfc4c5')

package() {
    # Create Destination Directories
    install -d ${pkgdir}/opt/

    # Unzip Linux Client Data
    sh -c "unzip -o ${srcdir}/ETQW-client-${pkgver}-linux.x86.run -d ${srcdir}/ data/*; true"

    # Move Linux Client Data to Destination Directory
    mv ${srcdir}/data ${pkgdir}/opt/etqw

    # Make Binaries/Scripts Executable
    chmod +x ${pkgdir}/opt/etqw/{etqw,etqw-dedicated,etqw.x86,*.so,*.so.*,pb/*.so}

    # Fix Bots Directory Permissions
    chmod 755 ${pkgdir}/opt/etqw/base/bots

    # Install License (ETQW)
    install -D -m 644 ${pkgdir}/opt/etqw/EULA.txt \
        ${pkgdir}/usr/share/licenses/$pkgname/EULA.txt

    # Install License (PunkBuster)
    install -D -m 644 ${pkgdir}/opt/etqw/pb/PBEULA.txt \
        ${pkgdir}/usr/share/licenses/$pkgname/PBEULA.txt

    # Install Launcher (Client)
    install -D -m 755 ${srcdir}/etqw.launcher \
        ${pkgdir}/usr/bin/etqw

    # Install Launcher (Client)
    install -D -m 755 ${srcdir}/etqw-rthread.launcher \
        ${pkgdir}/usr/bin/etqw-rthread

    # Install Launcher (Server)
    install -D -m 755 ${srcdir}/etqwded.launcher \
        ${pkgdir}/usr/bin/etqw-dedicated

    # Install Desktop File
    install -D -m 644 ${srcdir}/etqw.desktop \
        ${pkgdir}/usr/share/applications/etqw.desktop

    # Install Icon File
    install -D -m 644 ${pkgdir}/opt/etqw/etqw_icon.png \
        ${pkgdir}/usr/share/pixmaps/etqw.png

    # Create Directories for Retail Files
    install -d ${pkgdir}/opt/etqw/base/{megatextures,video}

    # Remove breaking local libraries
    rm ${pkgdir}/opt/etqw/{libgcc_s.so.1,libstdc++.so.6}
}

