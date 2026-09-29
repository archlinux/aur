# Maintainer: Johannes Schriewer <hallo@dunkelstern.de
pkgname=veilamp
pkgver=0.3.2
pkgrel=1
pkgdesc="Veilamp is a Winamp-inspired player with veilid peer to peer sharing between friends"
arch=('x86_64')
url="https://veilamp.com/"
license=('MIT')
depends=('alsa-lib' 'webkit2gtk-4.1')
makedepends=('nodejs' 'npm' 'rust')
options=(!lto)
source=(
  "https://gitlab.com/wrewtopia-labs-group/Veilamp/-/archive/v$pkgver/Veilamp-v$pkgver.tar.bz2"
  "veilamp.desktop"
)
sha512sums=('c89dd5046683192ea990799f91d5939a4e86ae397c79c775297dd279407caf6f25280f5a65238241ba287d77ba458029ebbec49ba51314be7b5cab6e784b9b96'
            'f2d18f72244b7d838f2d4d3233e972380f14146a9e11aff1655c380b1ccb6839a1c76d692816d4772e447b51058f141d6e4b80454266f0d68c6a55bc6afe4660')

prepare() {
    ln -sf $srcdir/Veilamp-v$pkgver $srcdir/veilamp
}

build() {
    cd $srcdir/veilamp/app/veilamp
    npm install
    npm run tauri build -- --no-bundle
}

package() {
    cd $srcdir/veilamp/target/release
    mkdir -p $pkgdir/usr/bin
    cp veilamp $pkgdir/usr/bin/

    mkdir -p $pkgdir/usr/share/applications
    cp $srcdir/veilamp.desktop $pkgdir/usr/share/applications

    cd $srcdir/veilamp/app/veilamp/src-tauri/icons
    mkdir -p $pkgdir/usr/share/icons/hicolor/{128x128,32x32,64x64}/apps
    cp 32x32.png $pkgdir/usr/share/icons/hicolor/32x32/apps/veilamp.png
    cp 64x64.png $pkgdir/usr/share/icons/hicolor/64x64/apps/veilamp.png
    cp 128x128.png $pkgdir/usr/share/icons/hicolor/128x128/apps/veilamp.png
}

