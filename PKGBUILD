# Maintainer: fozid
pkgname=go-notes
pkgver=1.0.0
pkgrel=1
pkgdesc="Desktop client for go-notes collaborative note-taking application"
arch=('x86_64')
url="https://github.com/TheFozid/go-notes"
license=('MIT')
depends=('gtk3' 'nss' 'alsa-lib')
makedepends=('npm' 'nodejs')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('03408252cfe0febd7eb634c21df98675ca6a0ba5b7c573e9d687dd29f0045abf')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}/electron"
    
    # Install dependencies
    npm install --cache "${srcdir}/npm-cache"
    
    # Build only the unpacked linux directory
    npm exec -- electron-builder --linux dir
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/electron"
    
    # Install to /opt
    install -dm755 "${pkgdir}/opt/${pkgname}"
    cp -r dist/linux-unpacked/* "${pkgdir}/opt/${pkgname}/"
    
    # Create wrapper script
    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/${pkgname}" << EOF
#!/bin/sh
exec /opt/${pkgname}/${pkgname} "\$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/${pkgname}"
    
    # Install icon
    install -Dm644 icon.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    
    # Install desktop file
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname}.desktop" << EOF
[Desktop Entry]
Type=Application
Name=go-notes
Comment=Collaborative note-taking application
Exec=${pkgname}
Icon=${pkgname}
Categories=Office;TextEditor;
Terminal=false
EOF
    
    # Install license
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
