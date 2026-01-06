# ex-maintainer: Sergey A <murlakatamenka@disroot.org>

# shellcheck shell=bash
# shellcheck disable=SC2034,SC2164

pkgname=falcond
pkgver=1.2.3
pkgrel=2
pkgdesc='Advanced Linux gaming performance daemon'
arch=('x86_64')
url='https://github.com/PikaOS-Linux/falcond'
license=('MIT')
makedepends=('zig>=0.14')
depends=(falcond-profiles scx-scheds power-profiles-daemon)
conflicts=("$pkgname-bin" "$pkgname-git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=('327fbdf18832cae126bd343ece008a1ed1c4581b10ffdd74bb50233e96802a3c')

build() {
  cd "$pkgname-$pkgver"

  source "./pika-build-config/amd64-v3.sh"
  echo "$PIKA_BUILD_ARCH" >pika-build-arch
  cd falcond

  zig build -Doptimize=ReleaseFast
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm 755 falcond/zig-out/bin/falcond \
    -t "$pkgdir/usr/bin"

  install -Dm 644 falcond/debian/falcond.service \
    -t "$pkgdir/usr/lib/systemd/system"

  install -Dm 644 LICENSE \
    -t "$pkgdir/usr/share/licenses/${pkgname}"
}
