# Maintainer: lod <aur@cyber-anlage.de>
# Contributer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
# Contributer: Julian Xhokaxhiu <info@julianxhokaxhiu.com>

pkgname=ncam-git
pkgver=e358cb4e
pkgrel=1
pkgdesc="Open Source Conditional Access Module software"
url="https://github.com/fairbird/NCam"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=('GPL-3.0-only')
depends=('curl' 'libusb' 'openssl' 'glibc' 'pcsclite')
makedepends=('git' 'cmake' 'ninja')
optdepends=('ccid: PC/SC reader generic dsudriver')
provides=('ncam')
install=ncam.install
backup=('etc/ncam/ncam.conf')
source=("$pkgname::git+https://github.com/fairbird/NCam.git"
        'ncam.service'
        'ncam.sysusers')
b2sums=('SKIP'
        'd6963810aa162367324fcbe01a021bb5bd60f4d37b7caa946630dceb23fa9f9ec342763f40a2a146a10d1c509db793f80e5824ad9777532781a1fe55ed13288b'
        '0bb278e4a12cdd235b63bc4a9516a61eaa40444ac44e0c920a1c716b2890525c40e28f03bfd90878d5fa539d17ccb88781c72d81dcf57f5fb7558f7d8d6a7a64')

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
