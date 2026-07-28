# Maintainer: Haram Choi <altitudinem at google dot com>
pkgname=linux-fireface-mixer
pkgver=0.4.0
pkgrel=1
pkgdesc="GUI mixer and headless OSC daemon for RME Fireface 400 on Linux"
arch=('x86_64')
url="https://github.com/oudeis01/linux-fireface-mixer"
license=('GPL3')
depends=('alsa-lib' 'libx11' 'libxrandr' 'libxinerama' 'libxcursor' 'libxi' 'systemd-libs' 'liblo' 'snd-firewire-ctl-services')
makedepends=('cmake')
optdepends=('linux-totalmix-web-remote: web remote control from phones/tablets over the LAN')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fdb2e2924a6f7206c0906504d464b3e4918b40092489584fcd8a22fbc66a3047')

build() {
  cd "$pkgname-$pkgver"
  mkdir -p build
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        ..
  make
}

package() {
  cd "$pkgname-$pkgver/build"
  
  install -Dm755 totalmixer_gui "$pkgdir/usr/bin/totalmixer_gui"
  install -Dm755 totalmixer "$pkgdir/usr/bin/totalmixer"

  install -Dm644 "$srcdir/$pkgname-$pkgver/packaging/totalmixer-daemon.service" \
      "$pkgdir/usr/lib/systemd/user/totalmixer-daemon.service"

  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" \
      "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/$pkgname-$pkgver/README.md" \
      "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "$srcdir/$pkgname-$pkgver/README-kr.md" \
      "$pkgdir/usr/share/doc/$pkgname/README-kr.md"
}
