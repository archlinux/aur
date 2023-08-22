# Maintainer: sem.z <sem.z at protonmail dot com>

pkgname="orca-slicer-bin"
pkgver=1.6.4
pkgrel=1
pkgdesc="G-code generator for 3D printers"
arch=('x86_64')
url="https://github.com/SoftFever/OrcaSlicer"
license=('AGPL3')
depends=('mesa' 'glu' 'cairo' 'gtk3' 'libsoup' 'webkit2gtk' 'gstreamer' 'openvdb' 'wayland' 'wayland-protocols' 'libxkbcommon' 'harmonyos-sans-git')
provides=("orca-slicer")
conflicts=("orca-slicer")
source=("https://github.com/SoftFever/OrcaSlicer/releases/download/v${pkgver}/OrcaSlicer_Linux_V${pkgver}.zip")
sha512sums=('0f5ed401a30d013e381a14f50268c2a8ba24523fda78a337b33692cf10b5eb4407197aeb5217ab40c78273eae0ade92e34176b717e50d1937742e7a3280e235d')

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
