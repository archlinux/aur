# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=wireguard-module
pkgver=0.0.20180718
pkgrel=1
pkgdesc="Fast, modern, secure VPN tunnel (kernel module)"
arch=('i686' 'x86_64')
url="https://www.wireguard.com/"
license=('GPL')
depends=('linux>=3.10')
makedepends=('linux-headers>=3.10' 'xz')
provides=('WIREGUARD-MODULE')
conflicts=('WIREGUARD-MODULE')
source=("https://git.zx2c4.com/WireGuard/snapshot/WireGuard-$pkgver.tar"{.xz,.asc})
sha256sums=('083c093a6948c8d38f92e7ea5533f9ff926019f24dc2612ea974851ed3e24705'
            'SKIP')
validpgpkeys=('AB9942E6D4A4CFC3412620A749FC7012A5DE03AE')  # Jason A. Donenfeld <Jason@zx2c4.com>


build() {
  cd "WireGuard-$pkgver/src"

  make module
}

package() {
  cd "WireGuard-$pkgver/src"

  _kernver=$(pacman -Q linux-headers | grep -Po '(?<= )\d+\.\d+')
  _extramodules="/usr/lib/modules/extramodules-$_kernver-ARCH"

  find './' -name '*.ko' -exec xz -0 --force {} \;
  install -Dm644 'wireguard.ko.xz' "$pkgdir/$_extramodules/wireguard.ko.xz"
}
