# Maintainer: goll <adrian.goll+aur[at]gmail>
# Contributor: George Woodall <georgewoodall82@gmail.com>
pkgname=bambustudio-bin
pkgver=02.08.02.60
pkgrel=1
pkgdesc="PC Software for BambuLab's 3D printers"
arch=("x86_64")
url="https://github.com/bambulab/BambuStudio"
license=('AGPL3')
conflicts=('bambustudio' 'bambustudio-git' 'squashfuse')
depends=('mesa' 'glu' 'cairo' 'gtk3' 'libsoup3' 'gstreamer' 'openvdb' 'wayland' 'wayland-protocols' 'libxkbcommon' 'gst-libav' 'webkit2gtk-4.1')
makedepends=('fuse2' 'patchelf')
# Thanks so much for generating random image names Bambu, much appreciated, keeps you on your toes or something I guess...
source=("bambustudio-${pkgver}.AppImage::https://github.com/bambulab/BambuStudio/releases/download/v${pkgver}/BambuStudio_ubuntu24.04-v${pkgver/%/-20260814171356}.AppImage"
        "BambuStudio.desktop"
        "bambu-studio")
sha256sums=('b78d2527a20ee9fbcf70ee82138c3b3ca707aa9c6625881629db29627252acc3'
            'SKIP'
            'SKIP')

package() {
    cd "$srcdir"
    chmod +x ./bambustudio-${pkgver}.AppImage
    ./bambustudio-${pkgver}.AppImage --appimage-extract

    cd squashfs-root
    mkdir -p $pkgdir/opt/bambustudio-bin
    cp -r ./usr "$pkgdir/"
    cp -r ./* "$pkgdir/opt/bambustudio-bin/"
    patchelf --remove-needed libOSMesa.so.8 "$pkgdir/opt/bambustudio-bin/bin/bambu-studio"
    patchelf --replace-needed libwebkit2gtk-4.0.so.37 libwebkit2gtk-4.1.so.0 "$pkgdir/opt/bambustudio-bin/bin/bambu-studio"
    patchelf --replace-needed libjavascriptcoregtk-4.0.so.18 libjavascriptcoregtk-4.1.so.0 "$pkgdir/opt/bambustudio-bin/bin/bambu-studio"
    patchelf --replace-needed libsoup-2.4.so.1 libsoup-3.0.so.0 "$pkgdir/opt/bambustudio-bin/bin/bambu-studio"

    cd "$srcdir"
    mkdir "$pkgdir/usr/bin/"
    chmod +x ./bambu-studio
    cp ./bambu-studio "$pkgdir/usr/bin/"

    mkdir "$pkgdir/usr/share/applications/"
    cp ./BambuStudio.desktop "$pkgdir/usr/share/applications/BambuStudio.desktop"
}
