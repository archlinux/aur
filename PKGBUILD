# Maintainer: Bitals <me at bitals dot xyz>
# Contributor: fabillo <fabillo@archlinux.org>

pkgname=intiface-central
pkgver=2.6.0
pkgrel=1
pkgdesc="Intiface Central (Buttplug Frontend) Application for Desktop and Mobile "
arch=('x86_64')
url="https://intiface.com/central/"
license=('GPL-3.0-only')
depends=('gtk3' 'openssl' 'bash' 'hicolor-icon-theme')
makedepends=('rust' 'flutter-tool' 'flutter-target-linux' 'cmake' 'ninja')
source=("$pkgname-$pkgver.tar.gz::https://github.com/intiface/intiface-central/archive/refs/tags/v$pkgver.tar.gz" "intiface-engine-flutter-bridge-license.md::https://raw.githubusercontent.com/intiface/$pkgname/v$pkgver/intiface-engine-flutter-bridge/LICENSE.md" 'intiface_central.desktop' 'run_intiface_central')
sha512sums=('c060e2c5efdb315690011976c84fa918446d219f11ace4ed0445fd8ad233884b0c892d57309f793b852d5301cad7b3e44e0a9a0628f0587ab00d2a2c28552f6b'
  'f8ea2b3c07735021cd574e868f8433ed378049dbe42346d04c7488a62c28b267fdac04ce8a93ad9b01d1dc5fb7c32e6bbc5a35d1c03a84f440938d84b998853d'
  '42eefd4638e0206a9fd6d5c1c833b19ca04bf23b209bd6b71a0bd3fa2a34791aa39f479a53fe19842b1e74006acc44d4e9b4a3428fb6edadaefda4f75a45eb58'
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
