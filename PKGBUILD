# Maintainer: Jouni Rinne <l33tmmx swirlything gmail dot com>
# Contributor: Deon Spengler <deon at spengler dot co dot za>
pkgname=labrador-git
pkgdesc="Qt5 GUI for EspoTek all-in-one USB oscilloscope/ signal generator/ PSU/ logic analyzer/ multimeter"
pkgver=1.0.r502.ac5052cd
pkgrel=1
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://espotek.com/labrador/"
license=('GPL3')
depends=('qt5-base' 'hicolor-icon-theme')
makedepends=('git')
optdepends=('dfu-programmer: USB programmer for Atmel chips'
            'dfu-util: USB firmware down/uploader')
conflicts=('labrador' 'libdfuprog')
source=("git+https://github.com/EspoTek/Labrador.git"
        "labrador-install.patch"
        "Labrador_pinout.png")
sha256sums=('SKIP'
            '6584acad931a8dc281ac75e92234d10af0194ff6e3d40a9a67509763a29b92f4'
            '0879b78874b86b648b067d69c21500717df518874cb3f87ed40ea3d6e44979bd')

pkgver() {
    cd ${srcdir}/Labrador
    printf "1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd ${srcdir}/Labrador/Desktop_Interface
    patch -p0 -i ../../labrador-install.patch
}

build() {
    cd ${srcdir}/Labrador/Desktop_Interface
    qmake -makefile Labrador.pro
    make
}

package() {
    cd ${srcdir}/Labrador/Desktop_Interface
    make INSTALL_ROOT=${pkgdir} install
    mkdir -p ${pkgdir}/usr/share/doc/EspoTek-Labrador
    cp ../../Labrador_pinout.png ${pkgdir}/usr/share/doc/EspoTek-Labrador/
    cp ../{pinout.svg,README.md} ${pkgdir}/usr/share/doc/EspoTek-Labrador/
    ln -s /usr/bin/EspoTek-Labrador/Labrador ${pkgdir}/usr/bin/labrador
    rm ${pkgdir}/usr/bin/EspoTek-Labrador/firmware/{dfu-programmer.exe,flash.bat,wipe.bat}
}
