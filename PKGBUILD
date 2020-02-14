# Maintainer: Myrddin Wyllt <darknesseatsall at aim dot com>

pkgname=openrgb-git
_title=OpenRGB
pkgver=r247.fd59f83
pkgrel=1
pkgdesc='Configuration utility for RGB lights supporting motherboards, RAM, & peripherals'
arch=('x86_64')
url='https://gitlab.com/CalcProgrammer1/OpenRGB'
license=('GPL2')
depends=('qt5-base' 'libusb' 'hidapi')
optdepends=('')
makedepends=('git' 'make')
conflicts=('openrgb')
provides=('openrgb')
source=("$_title::git+https://gitlab.com/CalcProgrammer1/$_title.git"
        'openrgb.desktop')
sha256sums=('SKIP'
            '4cfa7e03450ff79d98b382e8fd82cf697f0a9d1180566f3287c35c6841bb5464')

pkgver() {
    cd $_title
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    mkdir $srcdir/build && cd $_title
    git submodule update --init --recursive
    cd ../build && qmake ../$_title/$_title.pro
}

build() {
    make -C build -j$(($(nproc)+1))
}

package() {
    cd $srcdir/build
    install -Dm755 $_title $pkgdir/usr/bin/openrgb
    install -Dm644 ../$_title/qt/$_title.png $pkgdir/usr/share/pixmaps/openrgb.png
    install -Dm644 -t $pkgdir/usr/share/applications ../openrgb.desktop
}
