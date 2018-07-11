# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=wireguard-module
pkgver=0.0.20180708
pkgrel=1
pkgdesc="Fast, modern, secure VPN tunnel (kernel module)"
arch=('i686' 'x86_64')
url="https://www.wireguard.com/"
license=('GPL')
makedepends=('linux-headers' 'xz')
provides=('WIREGUARD-MODULE')
conflicts=('WIREGUARD-MODULE')
source=("https://git.zx2c4.com/WireGuard/snapshot/WireGuard-$pkgver.tar"{.xz,.asc})
sha256sums=('5e38d554f7d1e3a64e3a5319ca1a3b790c84ed89c896586c490a93ac1f953a91'
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
