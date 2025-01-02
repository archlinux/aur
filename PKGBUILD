# Maintainer: czyt<czytcn@gmail.com>

pkgname=readest-bin
pkgver=0.8.8
pkgrel=1
pkgdesc="A reader application for EPUB files (AppImage version)"
arch=('x86_64')
url="https://github.com/chrox/readest"
license=('unknown')
depends=(
    'fuse2'
    'appmenu-gtk-module'
    'gtk3'
    'libappindicator-gtk3'
)
optdepends=(
    'libappindicator-gtk2: GTK2 support'
    'libappindicator-gtk3: GTK3 support'
)
provides=('readest')
conflicts=('readest')
options=('!strip')
source=("https://github.com/chrox/readest/releases/download/v${pkgver}/Readest_${pkgver}_amd64.AppImage")
sha256sums=('8b125e02ae90ef2f65edffc7a73c25f021f47ee6cf1fcc1730c7f044bd6afb55')  

prepare() {
    cd "${srcdir}"
    chmod +x "Readest_${pkgver}_amd64.AppImage"
    
    # extract
    ./Readest_${pkgver}_amd64.AppImage --appimage-extract
}

package() {
    cd "${srcdir}"
    
    install -dm755 "${pkgdir}/usr/bin"
    install -dm755 "${pkgdir}/usr/share/applications"
    install -dm755 "${pkgdir}/usr/share/pixmaps"
    
    # install AppImage
    install -Dm755 "Readest_${pkgver}_amd64.AppImage" "${pkgdir}/opt/${pkgname}/readest.AppImage"
    
    # create launcher
    cat > "${pkgdir}/usr/bin/readest" << EOF
#!/bin/bash
exec "/opt/${pkgname}/readest.AppImage" "\$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/readest"
    
    # install icon
    if [ -f squashfs-root/readest.png ]; then
        install -Dm644 squashfs-root/readest.png "${pkgdir}/usr/share/pixmaps/readest.png"
    elif [ -f squashfs-root/usr/share/icons/hicolor/256x256/apps/readest.png ]; then
        install -Dm644 squashfs-root/usr/share/icons/hicolor/256x256/apps/readest.png "${pkgdir}/usr/share/pixmaps/readest.png"
    elif [ -f squashfs-root/.DirIcon ]; then
        install -Dm644 squashfs-root/.DirIcon "${pkgdir}/usr/share/pixmaps/readest.png"
    fi
    
    # create desktop entry
    cat > "${pkgdir}/usr/share/applications/readest.desktop" << EOF
[Desktop Entry]
Name=Readest
Comment=EPUB Reader
Exec=readest %F
Icon=readest
Type=Application
Categories=Office;Viewer;
Terminal=false
MimeType=application/epub+zip;
EOF

rm -rf "${srcdir}/squashfs-root"
}
