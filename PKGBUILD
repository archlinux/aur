# Maintainer: sem.z <sem.z at protonmail dot com>

pkgname="orca-slicer-bin"
pkgver=1.6.3
pkgrel=1
pkgdesc="Orca Slicer is a fork of Bambu Studio. It was previously known as BambuStudio-SoftFever"
arch=('x86_64')
url="https://github.com/SoftFever/OrcaSlicer"
license=('AGPLv3')
depends=('mesa' 'glu' 'cairo' 'gtk3' 'libsoup' 'webkit2gtk' 'gstreamer' 'openvdb' 'wayland' 'wayland-protocols' 'libxkbcommon' 'harmonyos-sans-git')
provides=("OrcaSlicer")
conflicts=("OrcaSlicer")
source=("https://github.com/SoftFever/OrcaSlicer/releases/download/v${pkgver}/OrcaSlicer_V${pkgver}_Linux.zip")
sha512sums=('c8a0b5ce1a2c12762b117fade95358583a0685bcb49088d311cd77eb976338114870ff53e5cd1ecd1e94c96b5031c31b8e9f1a817259e138c729881d5b96fbc4')

prepare() {
    chmod +x OrcaSlicer_ubu64.AppImage
    ./OrcaSlicer_ubu64.AppImage --appimage-extract

    sed -i 's|Exec=AppRun|Exec=/opt/orca-slicer/bin/orca-slicer|g' \
    "squashfs-root/OrcaSlicer.desktop"
}


package() {
    find squashfs-root/{resources,usr/share/icons}/ -type d -exec chmod 755 {} +
   
    install -d "$pkgdir/opt/${pkgname%-bin}/"
    cp -av squashfs-root/* "$pkgdir/opt/${pkgname%-bin}/"
    rm -rf "$pkgdir/opt/${pkgname%-bin}/usr/"
    rm "$pkgdir/opt/${pkgname%-bin}"/{OrcaSlicer.desktop,AppRun,OrcaSlicer.png,OrcaSlicer-x86_64.AppImage}

    install -d "$pkgdir/usr/bin"
    ln -s "/opt/${pkgname%-bin}/bin/orca-slicer" "$pkgdir/usr/bin/"

    install -Dm644 "squashfs-root/OrcaSlicer.desktop" -t \
    "$pkgdir/usr/share/applications/"

    install -d "$pkgdir/usr/share/icons/"
    cp -r squashfs-root/usr/share/icons/hicolor/ "$pkgdir/usr/share/icons/"
}
