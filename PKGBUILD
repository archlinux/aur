# Maintainer: aquova <mail at aquova dot net>

pkgname="gearsystem"
pkgver=3.8.4
pkgrel=1
pkgdesc="Sega Master System / Game Gear / SG-1000 Emulator"
url="https://github.com/drhelius/Gearsystem"
arch=("x86_64")
license=("GPL3")
depends=('gtk3' 'sdl2')
source=(
    "${url}/archive/refs/tags/${pkgver}.tar.gz"
    "gearsystem.desktop"
)
sha256sums=(
    "7f2ff14522f0dae8ad02a35a23e6a46fd537fd3989f0a546a4b206107f843dfa"
    "ca638acc5479345aa40fa2baae5e98ebbf97cf6080365e49e11c574dd690f4d1"
)

build() {
    # Temporary change to fix a build error from an invalid sdl2-compat flag
    # See https://github.com/drhelius/Gearboy/issues/194 for more details
    sed -i '55s/static-libs/libs/' $srcdir/Gearsystem-${pkgver}/platforms/desktop-shared/Makefile.common
    cd $srcdir/Gearsystem-${pkgver}/platforms/linux
    make
}

package() {
    cd $srcdir/Gearsystem-${pkgver}/platforms
    mkdir -p $pkgdir/opt/gearsystem
    install -Dm755 linux/gearsystem $pkgdir/opt/gearsystem
    install -Dm644 gamecontrollerdb.txt $pkgdir/opt/gearsystem
    mkdir -p $pkgdir/usr/bin
    ln -s /opt/gearsystem/gearsystem $pkgdir/usr/bin/gearsystem
    install -Dm644 $srcdir/gearsystem.desktop $pkgdir/usr/share/applications/gearsystem.desktop
}
