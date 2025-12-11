# Maintainer: Your Name <your.email@example.com>
pkgname=backmey-bin
pkgver=0.1.3
pkgrel=1
pkgdesc="Universal Linux Desktop Backup & Restore (CLI + GUI)"
arch=('x86_64')
url="https://github.com/MorganLosto/backmey"
license=('MIT')
depends=('python' 'gtk3' 'nss' 'libxss' 'alsa-lib')
provides=('backmey')
conflicts=('backmey')
source=("https://github.com/MorganLosto/backmey/releases/download/v${pkgver}/Backmey-${pkgver}.AppImage"
        "backmey.desktop"
        "backmey.png")
sha256sums=('ec6092f10046a6b54657c0fd03d8eabda8bc67b65bd6f0543092be89ff0d06fa'
            'a6bcf7b294d888be131ca59f36494a153780fe5a8e5beb0534b859e561497591'
            'cd7fa1de65a353a8e625889319fb3a6a572e533a43c525033bd39b64eae9b9d9')

prepare() {
    chmod +x "Backmey-${pkgver}.AppImage"
    ./"Backmey-${pkgver}.AppImage" --appimage-extract
}

package() {
    # 1. Install AppImage contents to /opt/backmey
    install -dm755 "${pkgdir}/opt/backmey"
    cp -r --no-preserve=mode,ownership squashfs-root/* "${pkgdir}/opt/backmey/"
    
    # PERMISSIONS FIX:
    chmod 755 "${pkgdir}/opt/backmey/AppRun"
    chmod 755 "${pkgdir}/opt/backmey/backmey" 
    chmod 4755 "${pkgdir}/opt/backmey/chrome-sandbox" || chmod 755 "${pkgdir}/opt/backmey/chrome-sandbox"
    
    # 2. Link GUI binary
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/backmey/AppRun" "${pkgdir}/usr/bin/backmey-gui"

    # 3. Install CLI (Extract python script from resources)
    install -dm755 "${pkgdir}/usr/lib/backmey"
    install -m644 "${pkgdir}/opt/backmey/resources/backmey.py" "${pkgdir}/usr/lib/backmey/backmey.py"
    
    # CLI wrapper
    echo '#!/bin/bash' > "${pkgdir}/usr/bin/backmey"
    echo 'exec python3 /usr/lib/backmey/backmey.py "$@"' >> "${pkgdir}/usr/bin/backmey"
    chmod 755 "${pkgdir}/usr/bin/backmey"

    # 4. Install Desktop File and Icon
    install -dm755 "${pkgdir}/usr/share/applications"
    install -m644 backmey.desktop "${pkgdir}/usr/share/applications/"

    install -dm755 "${pkgdir}/usr/share/pixmaps"
    install -m644 backmey.png "${pkgdir}/usr/share/pixmaps/"
}
