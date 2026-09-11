# Maintainer: Slash <demodevil5 [at] yahoo [dot] com>

pkgname=etqw
pkgver=1.5
pkgrel=6
pkgdesc="Enemy Territory: Quake Wars is a commercial team and class-based multiplayer game. You need the retail DVD to play."
arch=('i686' 'x86_64')
url="https://www.splashdamage.com/games/enemy-territory-quake-wars/"
license=('custom')
depends=('lib32-alsa-lib' 'lib32-libgl' 'lib32-sdl' 'lib32-gcc-libs' 'lib32-zlib' 'lib32-libjpeg-turbo')
makedepends=('unzip')
conflicts=('bin32-etqw')
install='etqw.install'
source=('etqw.launcher' 'etqw-rthread.launcher' 'etqwded.launcher' 'etqw.desktop' \
"https://cdn.splashdamage.com/downloads/games/etqw/ETQW-client-${pkgver}-full.x86.run")
b2sums=('b7b90b109afed76ffefed720bd9785ff5d5813add95cdcbd0d65876240f7b05fe667b98ee8baa47ef5f5a725e9348f19ff34964b8f62f2c2f1d353e1157a6626'
        '1cdcc71bf92fb3300023ba3a1c64bc234a5f46eede5479f9818022c9e5a726303850014b958ebcff78129bbf510642b7aa8b3d76d109bc94e229c5aa9eb90a8a'
        '56159047689fbb29a10e5aecd30d311035fff12f65af58b380cde57d6db10396192afeadba04bd2c7772c89ee54c26786ad11af352f8dc45c255b72bb3c455a9'
        '0f4379ba79a5d11fc86369a9e7ae54d94328e4b4159d3fdb94dbbf67b6feca2ff5cd24965bcadf5e74cb9dcfd1c46bbc01f63f177c22250e2a85ac605b9d9cd7'
        '8fcaa8518c7c452a4fe593a00beea0f5a6d5849c72b03d4a443fffde8540ea53b7bf0376d90b2f2ed4e3a736628f8871e009a49b938344516b2db0495cf1e826')

package() {
    # Create Destination Directories
    install -d ${pkgdir}/opt/

    # Unzip Linux Client Data
    sh -c "unzip -o ${srcdir}/ETQW-client-${pkgver}-full.x86.run -d ${srcdir}/ data/*; true"

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

