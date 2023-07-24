# Maintainer: lod <aur@cyber-anlage.de>
# Contributer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
# Contributer: Julian Xhokaxhiu <info@julianxhokaxhiu.com>

pkgname=ncam-git
pkgver=f6f9d0cd
pkgrel=1
pkgdesc="Open Source Conditional Access Module software"
url="https://github.com/fairbird/NCam"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=('GPL3')
depends=('libusb' 'openssl' 'glibc' 'pcsclite')
makedepends=('git')
optdepends=('ccid: PC/SC reader generic dsudriver')
provides=('ncam')
backup=('etc/ncam/ncam.conf')
source=("$pkgname::git+https://github.com/fairbird/NCam.git"
        'ncam.service'
        'ncam.sysusers')
b2sums=('SKIP'
        '20dce0bc4dcdfd702af529c3e7176c647b99f9f2953fe5923eba6576a86cb91e2272a677faf6836ea634d23701308b215edffb8a41dd5996ac8a691fa9a6a74c'
        '3956ad1798949ad13710e446929e7c5bd344b080d38d7f08ad38df6199e19f5d1878651d64614651a851dce57610b478273535fd9f3b3680a6dbe87a835e3ecc')

pkgver() {
  cd $pkgname
  printf "%s" $(git rev-parse --short HEAD)
}
 
build() {
  cd $pkgname

  make allyesconfig

  make CONF_DIR=/etc/ncam \
       USE_SSL=1 \
       USE_LIBUSB=1 \
       USE_PCSC=1 \
       NCAM_BIN=ncam \
       LIST_SMARGO_BIN=list_smargo \
       EXTRA_CC_WARN=-w
}

package() {
  cd $pkgname
  
  #binaries
  install -Dm755 ncam $pkgdir/usr/bin/ncam
  install -Dm755 list_smargo $pkgdir/usr/bin/list_smargo
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
