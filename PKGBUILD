# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=wireguard-module-git
pkgver=0.0.20191012.r2.g21df5a5
pkgrel=1
pkgdesc="Fast, modern, secure VPN tunnel (kernel module)"
arch=('i686' 'x86_64')
url="https://www.wireguard.com/"
license=('GPL')
depends=('linux>=3.10')
makedepends=('git' 'linux-headers>=3.10' 'xz')
provides=('WIREGUARD-MODULE')
conflicts=('WIREGUARD-MODULE')
source=("git+https://git.zx2c4.com/WireGuard")
sha256sums=('SKIP')


pkgver() {
  cd "WireGuard"

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "WireGuard/src"

  make module
}

package() {
  cd "WireGuard/src"

  _kernver=$(</usr/src/linux/version)

  find './' -name '*.ko' -exec xz -0 --force {} \;
  install -Dm644 "wireguard.ko.xz" -t "$pkgdir/usr/lib/modules/$_kernver/extramodules"
}
