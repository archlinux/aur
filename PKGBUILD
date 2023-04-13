# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=wireguard-module-git
pkgver=1.0.20220627.r2.g3d3c92b
pkgrel=1
pkgdesc="Fast, modern, secure VPN tunnel (kernel module)"
arch=('i686' 'x86_64')
url="https://www.wireguard.com/"
license=('GPL')
depends=('linux>=3.10')
makedepends=('git' 'linux-headers>=3.10')
provides=("wireguard-module=$pkgver" 'WIREGUARD-MODULE')
conflicts=('wireguard-module' 'WIREGUARD-MODULE')
source=("git+https://git.zx2c4.com/wireguard-linux-compat")
sha256sums=('SKIP')


pkgver() {
  cd "wireguard-linux-compat"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "wireguard-linux-compat/src"

  make module
}

package() {
  cd "wireguard-linux-compat/src"

  DEPMOD="true" make module-install INSTALL_MOD_PATH="$pkgdir/usr"
  find "$pkgdir/usr" -name 'modules.*' -exec rm {} \;
}
