# Maintainer: Steffen Hansen <steffengrundsoe@gmail.com>
pkgname=quickgui
pkgver=1.2.4
pkgrel=2
pkgdesc="A Flutter frontend for quickget and quickemu"
arch=('x86_64')
url="https://github.com/quickgui/quickgui"
license=('unknown')
depends=('quickemu' 'zenity')
makedepends=('flutter' 'cmake' 'ninja' 'clang')
provides=("$pkgname")
conflicts=("$pkgname")
source=("$pkgname-$pkgver.tar.xz"::"https://github.com/quickgui/quickgui/archive/refs/tags/v$pkgver.tar.gz"
        'package_info_plus.patch')
sha256sums=('97fa5e3541dd45ed8e4f215dacf1824d59a8624baf7bc8d1106f46b6731d5d05'
            '153f90a1b1b7cb9cd8b7b3943c0fedc3fb37279157688fc39f8f3cb6c3cd4ff2')

prepare() {
  patch -d "$pkgname-$pkgver" -Np1 < "$srcdir/package_info_plus.patch"
}

build() {
  cd "$pkgname-$pkgver"

  flutter build linux --release
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 build/linux/x64/release/bundle/quickgui "$pkgdir/opt/$pkgname/quickgui"
  install -Dm644 assets/resources/quickgui.desktop "${pkgdir}/usr/share/applications/quickgui.desktop"
  install -Dm644 assets/resources/quickgui_512.png "${pkgdir}/usr/share/icons/quickgui_512.png"

  cp -R build/linux/x64/release/bundle/data "$pkgdir/opt/$pkgname"
  cp -R build/linux/x64/release/bundle/lib "$pkgdir/opt/$pkgname"

  install -d "$pkgdir/usr/bin/"
  ln -s /opt/$pkgname/quickgui "$pkgdir/usr/bin/quickgui"
}
