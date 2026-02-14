# Maintainer: Bitals <me at bitals dot xyz>
# Contributor: fabillo <fabillo@archlinux.org>

pkgname=intiface-central
pkgver=3.0.1
pkgrel=1
pkgdesc="Intiface Central (Buttplug Frontend) Application for Desktop and Mobile "
arch=('x86_64')
url="https://intiface.com/central/"
license=('GPL-3.0-only')
depends=('gtk3' 'openssl' 'bash' 'hicolor-icon-theme' 'libayatana-appindicator')
makedepends=('rustup' 'fvm' 'cmake' 'ninja' 'unzip')
source=("buttplug::git+https://github.com/buttplugio/buttplug#commit=1c5dbb5c9c8e7f04afe57c67a4924d240be73890"
    "buttplug_dart::git+https://github.com/buttplugio/buttplug_dart#commit=6d91665a3e5faa389e9a626c9b0bb79c6f126d57"
    "$pkgname::git+https://github.com/intiface/intiface-central#tag=v${pkgver}+37"
    "intiface-engine-flutter-bridge-license.md::https://raw.githubusercontent.com/intiface/$pkgname/v$pkgver/intiface-engine-flutter-bridge/LICENSE.md"
    'intiface_central.desktop'
    'run_intiface_central')
sha512sums=('SKIP'
    'SKIP'
    'SKIP'
    'f8ea2b3c07735021cd574e868f8433ed378049dbe42346d04c7488a62c28b267fdac04ce8a93ad9b01d1dc5fb7c32e6bbc5a35d1c03a84f440938d84b998853d'
    '3163ea9db8867daf0fe35580ebbbce966b4a783462a149d5a3a6aea04145262fbbd3aaf3ce82c5addf0ff9ca7a7424daab7e564f72106083b1ba3605d02996de'
    'c12f219a3de9b1587473c56bf999a0320980c9e4c9dcffa0b656fd82e1bd33e110054b52f6f6cade9815e222041f021c82ab8f0729bf21f75545b5d3fa096e32'
)

prepare() {
    cd "$srcdir/$pkgname"
    sed -i "s/PRIVATE -Wall -Werror/PRIVATE -Wno-error/g" ./linux/CMakeLists.txt
    rustup set profile minimal
    rustup toolchain install stable
    rustup override set stable
    fvm use 3.38.9 --force
    fvm flutter config --enable-linux-desktop
}

build() {
    cd "$srcdir/$pkgname"
    fvm flutter build linux --release
}

package() {
    install -Dm755 "run_intiface_central" "$pkgdir/usr/lib/intiface_central/run_intiface_central"
    install -Dm644 "intiface_central.desktop" "$pkgdir/usr/share/applications/intiface_central.desktop"
    install -Dm644 "intiface-engine-flutter-bridge-license.md" "$pkgdir/usr/share/licenses/$pkgname/intiface-engine-flutter-bridge-license.md"

    cd "$srcdir/$pkgname/build/linux/x64/release/bundle/"
    install -Dm755 "intiface_central" "$pkgdir/usr/lib/intiface_central/intiface_central"
    cp -r "data" "$pkgdir/usr/lib/intiface_central/data"
    cp -r "lib" "$pkgdir/usr/lib/intiface_central/lib"
    install -Dm644 "data/flutter_assets/assets/icons/intiface_central_icon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/intiface_central.png"
}
