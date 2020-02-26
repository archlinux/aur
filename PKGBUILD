# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Alad Wenter <alad@archlinux.org>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Daniel Plaza <daniel.plaza.espi@gmail.com>
pkgname=pcsclite-nopy
_pkgname=pcsclite
pkgver=1.8.26
pkgrel=1
pkgdesc="PC/SC Architecture smartcard middleware library (no python)"
arch=('x86_64' 'i686')
url='https://pcsclite.apdu.fr/'
license=('BSD')
depends=('systemd')
makedepends=('pkg-config' 'python')
optdepends=('python: to use pcsc-spy tool')
options=('!docs')
validpgpkeys=('F5E11B9FFE911146F41D953D78A1B4DFE8F9C57E') # Ludovic Rousseau <rousseau@debian.org>
source=("https://pcsclite.apdu.fr/files/pcsc-lite-${pkgver}.tar.bz2")
sha256sums=('3eb7be7d6ef618c0a444316cf5c1f2f9d7227aedba7a192f389fe3e7c0dfbbd9')
provides=($_pkgname=$pkgver-$pkgrel)
conflicts=($_pkgname)

build() {
  cd "pcsc-lite-$pkgver"

  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --enable-filter \
    --enable-ipcdir=/run/pcscd \
    --enable-libudev \
    --enable-usbdropdir=/usr/lib/pcsc/drivers \
    --with-systemdsystemunitdir=/usr/lib/systemd/system

  make
}

package() {
  cd "pcsc-lite-$pkgver"
  make DESTDIR="$pkgdir" install

  install -D -m644 "$srcdir/pcsc-lite-$pkgver/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -d "$pkgdir/usr/lib/pcsc/drivers"
}
