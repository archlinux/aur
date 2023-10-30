# Maintainer: Bitals <me at bitals dot xyz>
# Contributor: fabillo <fabillo@archlinux.org>

pkgname=intiface-central
pkgver=2.5.0
pkgrel=1
pkgdesc="Intiface Central (Buttplug Frontend) Application for Desktop and Mobile "
arch=('x86_64')
url="https://intiface.com/central/"
license=('GPL3')
depends=('gtk3' 'openssl' 'bash' 'hicolor-icon-theme')
makedepends=('rust' 'flutter' 'cmake' 'ninja')
source=("$pkgname-$pkgver.tar.gz::https://github.com/intiface/intiface-central/archive/refs/tags/v$pkgver.tar.gz" "intiface-engine-flutter-bridge-license.md::https://raw.githubusercontent.com/intiface/$pkgname/v$pkgver/intiface-engine-flutter-bridge/LICENSE.md" 'intiface_central.desktop' 'run_intiface_central')
sha512sums=('cbfd10535751fde52ab78774f4b568f87019417b29a4a6e0a554f12383f363ba5236725cf56d1ff969c2ccbe923fcee433b74fb46c57e3f36c5b3fa88020ebaf'
  'f8ea2b3c07735021cd574e868f8433ed378049dbe42346d04c7488a62c28b267fdac04ce8a93ad9b01d1dc5fb7c32e6bbc5a35d1c03a84f440938d84b998853d'
  'c1b76c63dbd74d9cdebe1a73ca6de4504e987ee262a5cf060e3b7e955096fa183215ff086faa8d4078fc6e6886d5c1f4e87952c443e1bd8b901615e9e2311505'
  'c12f219a3de9b1587473c56bf999a0320980c9e4c9dcffa0b656fd82e1bd33e110054b52f6f6cade9815e222041f021c82ab8f0729bf21f75545b5d3fa096e32'
)

prepare() {
    flutter config --enable-linux-desktop
}

build() {
    cd "$pkgname-$pkgver"
    flutter build linux --release
}

package() {
    install -Dm755 "run_intiface_central" "$pkgdir/usr/lib/intiface_central/run_intiface_central"
    install -Dm644 "intiface_central.desktop" "$pkgdir/usr/share/applications/intiface_central.desktop"
    install -Dm644 "intiface-engine-flutter-bridge-license.md" "$pkgdir/usr/share/licenses/$pkgname/intiface-engine-flutter-bridge-license.md"

    cd "$srcdir/$pkgname-$pkgver/build/linux/x64/release/bundle/"
    pwd
    install -Dm755 "intiface_central" "$pkgdir/usr/lib/intiface_central/intiface_central"
    cp -r "data" "$pkgdir/usr/lib/intiface_central/data"
    cp -r "lib" "$pkgdir/usr/lib/intiface_central/lib"
    install -Dm644 "data/flutter_assets/assets/icons/intiface_central_icon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/intiface_central.png"
}