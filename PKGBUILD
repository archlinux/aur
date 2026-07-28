# Maintainer: ProphetPX <prophetpx@gmail.com>
pkgname=kindle-for-arch
pkgver=1.0.0
pkgrel=3
pkgdesc="A simple Kindle desktop app for Arch Linux based on Electron"
arch=('any')
url="https://github.com/ProphetPX/Kindle-for-Arch"
license=('MIT')
depends=('electron' 'nodejs' 'npm')
source=('Kindle.png' 'main.js' 'package.json')
sha256sums=('SKIP' 'SKIP' 'SKIP')

build() {
    echo "[Desktop Entry]" > "${srcdir}/kindle.desktop"
    echo "Version=1.0" >> "${srcdir}/kindle.desktop"
    echo "Type=Application" >> "${srcdir}/kindle.desktop"
    echo "Name=Kindle for Arch" >> "${srcdir}/kindle.desktop"
    echo "Comment=A simple Kindle desktop app for Arch Linux based on Electron" >> "${srcdir}/kindle.desktop"
    echo "Exec=/usr/bin/kindle" >> "${srcdir}/kindle.desktop"
    echo "Icon=Kindle" >> "${srcdir}/kindle.desktop"
    echo "Terminal=false" >> "${srcdir}/kindle.desktop"
    echo "StartupWMClass=kindle-for-arch" >> "${srcdir}/kindle.desktop"
    echo "Categories=Office;Book;Viewer;" >> "${srcdir}/kindle.desktop"
    echo "MimeType=text/html;" >> "${srcdir}/kindle.desktop"
}

package() {
    # 1. Create the system directory for the app
    install -d "${pkgdir}/usr/lib/${pkgname}"

    # 2. Copy your local files directly into that directory from srcdir
    cp "${srcdir}/main.js" "${pkgdir}/usr/lib/${pkgname}/"
    cp "${srcdir}/package.json" "${pkgdir}/usr/lib/${pkgname}/"

    # 3. Install the dynamically generated desktop shortcut
    install -Dm644 "${srcdir}/kindle.desktop" "${pkgdir}/usr/share/applications/kindle.desktop"

    # 4. Install the application icon
    install -Dm644 "${srcdir}/Kindle.png" "${pkgdir}/usr/share/pixmaps/Kindle.png"

    # 5. Create a system shortcut that bypasses kindle.sh and runs Electron directly
    install -d "${pkgdir}/usr/bin"
    echo -e "#!/bin/sh\nelectron /usr/lib/${pkgname}/main.js \"\$@\"" > "${pkgdir}/usr/bin/kindle"
    chmod +x "${pkgdir}/usr/bin/kindle"
}
