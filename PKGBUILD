# Maintainer: aquova <mail at aquova dot net>

pkgname="gearboy"
pkgver=3.7.3
pkgrel=1
pkgdesc="Game Boy / Gameboy Color emulator"
url="https://github.com/drhelius/Gearboy"
arch=("x86_64")
license=("GPL3")
depends=('gtk3' 'sdl2')
source=(
    "${url}/archive/refs/tags/${pkgver}.tar.gz"
    "gearboy.desktop"
)
sha256sums=(
    "d8fb5f229addbfce51fb341db2c341666f343eebdbbf23b52bb47b7c62bc1fd6"
    "14488a013717c4d59eabd11dd852c167fc7d9eff702a2691f1089317faaf0f24"
)

build() {
    # Temporary change to fix a build error from an invalid sdl2-compat flag
    # See https://github.com/drhelius/Gearboy/issues/194 for more details
    sed -i '55s/static-libs/libs/' $srcdir/Gearboy-${pkgver}/platforms/desktop-shared/Makefile.common
    cd $srcdir/Gearboy-${pkgver}/platforms/linux
    make
}

package() {
    cd $srcdir/Gearboy-${pkgver}/platforms
    mkdir -p $pkgdir/opt/gearboy
    install -Dm755 linux/gearboy $pkgdir/opt/gearboy
    install -Dm644 gamecontrollerdb.txt $pkgdir/opt/gearboy
    mkdir -p $pkgdir/usr/bin
    ln -s /opt/gearboy/gearboy $pkgdir/usr/bin/gearboy
    install -Dm644 $srcdir/gearboy.desktop $pkgdir/usr/share/applications/gearboy.desktop
}
