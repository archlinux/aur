# Maintainer: goll <adrian.goll+aur[at]gmail>
# Contributor: George Woodall <georgewoodall82@gmail.com>
pkgname=bambustudio-bin
pkgver=02.06.00.51
pkgrel=1
pkgdesc="PC Software for BambuLab's 3D printers"
arch=("x86_64")
url="https://github.com/bambulab/BambuStudio"
license=('AGPL3')
conflicts=('bambustudio' 'bambustudio-git' 'squashfuse')
depends=('mesa' 'glu' 'cairo' 'gtk3' 'libsoup' 'gstreamer' 'openvdb' 'wayland' 'wayland-protocols' 'libxkbcommon' 'gst-libav' 'webkit2gtk')
makedepends=('fuse2' 'patchelf')
# Thanks so much for generating random image names Bambu, much appreciated, keeps you on your toes or something I guess...
source=("bambustudio-${pkgver}.AppImage::https://github.com/bambulab/BambuStudio/releases/download/v${pkgver}/Bambu_Studio_linux_fedora-v${pkgver}.AppImage"
	"BambuStudio.desktop"
	"bambu-studio")
sha256sums=('eeb0f1f00eb9bdec7218009ffeb64c6809ca72c528e7e1dd585ab4321259f8df'
            'SKIP'
            'SKIP')

package() {
    cd "$srcdir"
    chmod +x ./bambustudio-${pkgver}.AppImage
    ./bambustudio-${pkgver}.AppImage --appimage-extract
    cd squashfs-root
    mkdir $pkgdir/opt/
    mkdir $pkgdir/opt/bambustudio-bin
    cp -r ./usr "$pkgdir/"
    cp -r ./* "$pkgdir/opt/bambustudio-bin/"
    patchelf --remove-needed libOSMesa.so.8 "$pkgdir/opt/bambustudio-bin/bin/bambu-studio"

    cd "$srcdir"

    mkdir "$pkgdir/usr/bin/"
    chmod +x ./bambu-studio
    cp ./bambu-studio "$pkgdir/usr/bin/"

    mkdir "$pkgdir/usr/share/applications/"
    cp ./BambuStudio.desktop "$pkgdir/usr/share/applications/BambuStudio.desktop"
}
