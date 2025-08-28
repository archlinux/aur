# Maintainer: aquova <mail at aquova dot net>

pkgname="gearcoleco"
pkgver=1.5.3
pkgrel=1
pkgdesc="ColecoVision emulator"
url="https://github.com/drhelius/Gearcoleco"
arch=("x86_64")
license=("GPL3")
depends=('gtk3' 'sdl2')
source=(
    "${url}/archive/refs/tags/${pkgver}.tar.gz"
    "gearcoleco.desktop"
)
sha256sums=(
    "4a4e865737c15b713b0de9bd80136a02a26ef9b16d09b61830fc421f38c49595"
    "b6470e30ab22f01a4819d80015c1892bda401be4684931d8d573a640dc71dd80"
)

build() {
    # Temporary change to fix a build error from an invalid sdl2-compat flag
    # See https://github.com/drhelius/Gearboy/issues/194 for more details
    sed -i '54s/static-libs/libs/' $srcdir/Gearcoleco-${pkgver}/platforms/desktop-shared/Makefile.common
    cd $srcdir/Gearcoleco-${pkgver}/platforms/linux
    make
}

package() {
    cd $srcdir/Gearcoleco-${pkgver}/platforms
    mkdir -p $pkgdir/opt/gearcoleco
    install -Dm755 linux/gearcoleco $pkgdir/opt/gearcoleco
    install -Dm644 gamecontrollerdb.txt $pkgdir/opt/gearcoleco
    mkdir -p $pkgdir/usr/bin
    ln -s /opt/gearcoleco/gearcoleco $pkgdir/usr/bin/gearcoleco
    install -Dm644 $srcdir/gearcoleco.desktop $pkgdir/usr/share/applications/gearcoleco.desktop
}
