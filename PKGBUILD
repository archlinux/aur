# Maintainer: Jouni Rinne <l33tmmx swirlything gmail dot com>
# Contributor: Deon Spengler <deon at spengler dot co dot za>
pkgname=labrador
pkgdesc="Transforms your PC into a fully-featured electronics lab (with an EspoTek USB device)"
pkgver=1.2_65ca876
pkgrel=1
arch=('x86_64' 'armv6h' 'armv7h')
url="https://espotek.com"
license=('GPL3')
depends=('qt5-base' 'hicolor-icon-theme')
optdepends=('dfu-programmer: USB programmer for Atmel chips'
            'dfu-util: USB firmware down/uploader')
conflicts=('libdfuprog')
source=("https://github.com/EspoTek/Labrador/archive/continuous-Linux.tar.gz"
        "labrador-install.patch"
        "Labrador_pinout.png")
sha256sums=('4a45a3069317d294ab2b75d7a428c969237945f02d8ad6025defe32ce8f56088'
            '6584acad931a8dc281ac75e92234d10af0194ff6e3d40a9a67509763a29b92f4'
            '0879b78874b86b648b067d69c21500717df518874cb3f87ed40ea3d6e44979bd')

prepare() {
    cd Labrador-continuous-Linux/Desktop_Interface
    patch -p0 -i ../../labrador-install.patch
}

build() {
    cd Labrador-continuous-Linux/Desktop_Interface
    qmake -makefile Labrador.pro
    make
}

package() {
    cd Labrador-continuous-Linux/Desktop_Interface
    make INSTALL_ROOT=${pkgdir} install
    mkdir -p ${pkgdir}/usr/share/doc/EspoTek-Labrador
    cp ../../Labrador_pinout.png ${pkgdir}/usr/share/doc/EspoTek-Labrador/
    cp ../{pinout.svg,README.md} ${pkgdir}/usr/share/doc/EspoTek-Labrador/
    ln -s /usr/bin/EspoTek-Labrador/Labrador ${pkgdir}/usr/bin/labrador
    rm ${pkgdir}/usr/bin/EspoTek-Labrador/firmware/{dfu-programmer.exe,flash.bat,wipe.bat}
}
