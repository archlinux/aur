# Maintainer: Ivan Vojtko <ivan.vojtko@gmail.com>
# Contributor: George Woodall <georgewoodall82@gmail.com>
# Contributor: goll <adrian.goll+aur[at]gmail>
pkgname=bambustudio-nvidia-bin
pkgver=02.02.02.56
pkgrel=1
pkgdesc="PC Software for BambuLab's 3D printers with a fix for nVidia cards"
arch=("x86_64")
url="https://github.com/bambulab/BambuStudio"
license=('AGPL3')
conflicts=('bambustudio' 'bambustudio-git' 'bambustudio-bin')
depends=('mesa' 'glu' 'cairo' 'gtk3' 'libsoup' 'webkit2gtk' 'gstreamer' 'openvdb' 'wayland' 'wayland-protocols' 'libxkbcommon' 'gst-libav' 'webkit2gtk-4.1')
makedepends=('fuse2')
source=("bambustudio-${pkgver}.AppImage::https://github.com/bambulab/BambuStudio/releases/download/v${pkgver}/Bambu_Studio_ubuntu-24.04_PR-8184.AppImage"
	"BambuStudio.desktop"
	"bambu-studio"
    "mesa.tar.zst::https://archive.archlinux.org/packages/m/mesa/mesa-1%3A24.3.4-1-x86_64.pkg.tar.zst"
    "llvm.tar.zst::https://archive.archlinux.org/packages/l/llvm-libs/llvm-libs-19.1.7-2-x86_64.pkg.tar.zst")
md5sums=('0fb5c0b222e24b12284b177916763fb0'
         'c2729c29cbd01844507e1f0562762191'
         '7870efc1c2644441705f8a4316455c5a'
         'e2e9476b8e0924cfc752cce1501b3ea3'
         'be02d411850271b80c65d2971952dbd3')

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
    mkdir -p llvm
    tar -xvf mesa.tar.zst -C mesa
    tar -xvf llvm.tar.zst -C llvm
    cp -R mesa/usr/lib/* "$pkgdir/opt/bambustudio-bin/bin/"
    cp -R llvm/usr/lib/* "$pkgdir/opt/bambustudio-bin/bin/"
    
    mkdir "$pkgdir/usr/share/applications/"
    cp ./BambuStudio.desktop "$pkgdir/usr/share/applications/BambuStudio.desktop"
}

