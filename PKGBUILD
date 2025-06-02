# Maintainer: Ivan Vojtko <ivan.vojtko@gmail.com>
# Contributor: George Woodall <georgewoodall82@gmail.com>
# Contributor: goll <adrian.goll+aur[at]gmail>
pkgname=bambustudio-nvidia-bin
pkgver=02.00.03.54
pkgrel=2
pkgdesc="PC Software for BambuLab's 3D printers with a fix for nVidia cards"
arch=("x86_64")
url="https://github.com/bambulab/BambuStudio"
license=('AGPL3')
conflicts=('bambustudio' 'bambustudio-git' 'bambustudio-bin')
depends=('mesa' 'glu' 'cairo' 'gtk3' 'libsoup' 'webkit2gtk' 'gstreamer' 'openvdb' 'wayland' 'wayland-protocols' 'libxkbcommon' 'gst-libav')
makedepends=('fuse2')
source=("bambustudio-${pkgver}.AppImage::https://github.com/bambulab/BambuStudio/releases/download/V${pkgver}/Bambu_Studio_linux_fedora-v${pkgver}.AppImage"
	"BambuStudio.desktop"
	"bambu-studio"
    "mesa.tar.zst::https://archive.archlinux.org/packages/m/mesa/mesa-1%3A24.3.4-1-x86_64.pkg.tar.zst")
md5sums=('372b7c26568cb744b22a2253568598b3'
         'c2729c29cbd01844507e1f0562762191'
         '8d9d8d329aa1d46dc47b8978d7f3b480'
         'e2e9476b8e0924cfc752cce1501b3ea3')

package() {
    cd "$srcdir"
    chmod +x ./bambustudio-${pkgver}.AppImage
    ./bambustudio-${pkgver}.AppImage --appimage-extract
    cd squashfs-root
    mkdir $pkgdir/opt/
    mkdir $pkgdir/opt/bambustudio-bin
    cp -r ./usr "$pkgdir/"
    cp -r ./* "$pkgdir/opt/bambustudio-bin/"
    
    cd "$srcdir"
    
    mkdir "$pkgdir/usr/bin/"
    chmod +x ./bambu-studio
    cp ./bambu-studio "$pkgdir/usr/bin/"
    mkdir -p mesa
    tar -xvf mesa.tar.zst -C mesa
    cp mesa/usr/lib/libOSMesa.so.8 "$pkgdir/opt/bambustudio-bin/"
    cp mesa/usr/lib/libglapi.so.0 "$pkgdir/opt/bambustudio-bin/"
    
    mkdir "$pkgdir/usr/share/applications/"
    cp ./BambuStudio.desktop "$pkgdir/usr/share/applications/BambuStudio.desktop"
}

