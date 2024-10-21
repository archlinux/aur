# Maintainer: lod <aur@cyber-anlage.de>
# Contributer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
# Contributer: Julian Xhokaxhiu <info@julianxhokaxhiu.com>

pkgname=ncam-git
pkgver=0e88b8d9
pkgrel=1
pkgdesc="Open Source Conditional Access Module software"
url="https://github.com/fairbird/NCam"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=('GPL-3.0-only')
depends=('curl' 'libusb' 'openssl' 'glibc' 'pcsclite')
makedepends=('git' 'cmake' 'ninja')
optdepends=('ccid: PC/SC reader generic dsudriver')
provides=('ncam')
backup=('etc/ncam/ncam.conf')
source=("$pkgname::git+https://github.com/fairbird/NCam.git"
        'ncam.service'
        'ncam.sysusers')
b2sums=('SKIP'
        '8c06c8c22090b5c9ece7fa72af78e05ac79d41e3df7697901f530e844b6bca3d8c73fd6a80584a1640504d410edbff32d88cdeac8db35f88cf321e3f7c6d2bb0'
        '3956ad1798949ad13710e446929e7c5bd344b080d38d7f08ad38df6199e19f5d1878651d64614651a851dce57610b478273535fd9f3b3680a6dbe87a835e3ecc')

pkgver() {
  cd $pkgname
  printf "%s" $(git rev-parse --short HEAD)
}
 
build() {
  cd $pkgname
  mkdir -p build

  cmake \
    -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DDEFAULT_CS_CONFDIR=/etc/ncam \
    -DUSE_SSL=ON \
    -DUSE_LIBUSB=ON \
    -DUSE_PCSC=ON \
    -DWITH_SIGNING=OFF \
    -G Ninja

  ninja -C build
}

package() {
  cd $pkgname
  
  #binaries
  install -Dm755 build/ncam $pkgdir/usr/bin/ncam
  install -Dm755 build/utils/list_smargo $pkgdir/usr/bin/list_smargo
  #config examples
  install -Dm644 Distribution/doc/example/ncam.conf -t $pkgdir/etc/ncam/
  install -Dm644 Distribution/doc/example/* -t $pkgdir/usr/share/doc/ncam/
  #man-pages
  install -Dm644 Distribution/doc/man/*.1 -t $pkgdir/usr/share/man/man1
  install -Dm644 Distribution/doc/man/*.5 -t $pkgdir/usr/share/man/man5
  #service and sysuser
  install -Dm644 $srcdir/ncam.service $pkgdir/usr/lib/systemd/system/ncam.service
  install -Dm644 $srcdir/ncam.sysusers $pkgdir/usr/lib/sysusers.d/ncam.conf
}
