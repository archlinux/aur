# Maintainer: Haram Choi <altitudinem at google dot com>
pkgname=linux-fireface-mixer
pkgver=0.3.0
pkgrel=1
pkgdesc="GUI mixer and headless OSC daemon for RME Fireface 400 on Linux"
arch=('x86_64')
url="https://github.com/oudeis01/linux-fireface-mixer"
license=('GPL3')
depends=('alsa-lib' 'libx11' 'libxrandr' 'libxinerama' 'libxcursor' 'libxi' 'systemd-libs' 'liblo' 'snd-firewire-ctl-services')
makedepends=('cmake')
optdepends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c4a4b454a91318c251aaaf2a9e500d86850bed47fe5652dbaad6ecbcba3c30b2')

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
  install -Dm755 totalmixer_cli "$pkgdir/usr/bin/totalmixer_cli"
  install -Dm755 totalmixer-daemon "$pkgdir/usr/bin/totalmixer-daemon"

  install -Dm644 "$srcdir/$pkgname-$pkgver/packaging/totalmixer-daemon.service" \
      "$pkgdir/usr/lib/systemd/user/totalmixer-daemon.service"

  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" \
      "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/$pkgname-$pkgver/README.md" \
      "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "$srcdir/$pkgname-$pkgver/README-kr.md" \
      "$pkgdir/usr/share/doc/$pkgname/README-kr.md"
}
