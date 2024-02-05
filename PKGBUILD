# Maintainer: Bitals <me at bitals dot xyz>
# Contributor: fabillo <fabillo@archlinux.org>

pkgname=intiface-central
pkgver=2.5.5
pkgrel=1
pkgdesc="Intiface Central (Buttplug Frontend) Application for Desktop and Mobile "
arch=('x86_64')
url="https://intiface.com/central/"
license=('GPL-3.0-only')
depends=('gtk3' 'openssl' 'bash' 'hicolor-icon-theme')
makedepends=('rust' 'flutter' 'cmake' 'ninja')
source=("$pkgname-$pkgver.tar.gz::https://github.com/intiface/intiface-central/archive/refs/tags/v$pkgver.tar.gz" "intiface-engine-flutter-bridge-license.md::https://raw.githubusercontent.com/intiface/$pkgname/v$pkgver/intiface-engine-flutter-bridge/LICENSE.md" 'intiface_central.desktop' 'run_intiface_central')
sha512sums=('434ed5f1380326b634678a47f84042c6507c7bf96f996611f38f8e6b0ef2bf4a8b25a6f963f90f1ee9c0f5a3c3ae49eafe3bafef9909500ee36cd3129e2a188a'
  'f8ea2b3c07735021cd574e868f8433ed378049dbe42346d04c7488a62c28b267fdac04ce8a93ad9b01d1dc5fb7c32e6bbc5a35d1c03a84f440938d84b998853d'
  'a0face6d05c990186b04e89bad719aab755acae75eb9f89afe6d1288183cd76ccedccbc299b571fd23a76edcb35c2d7e6ce1f0e57416ade179379327f74f0497'
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