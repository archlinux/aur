# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Alad Wenter <alad@archlinux.org>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Daniel Plaza <daniel.plaza.espi@gmail.com>
pkgname=pcsclite-nopy
_pkgname=pcsclite
pkgver=1.9.5
pkgrel=1
pkgdesc="PC/SC Architecture smartcard middleware library (no python)"
arch=('x86_64' 'i686')
url='https://pcsclite.apdu.fr/'
license=('BSD')
depends=('systemd' 'libsystemd.so' 'libudev.so')
makedepends=('pkg-config' 'python')
optdepends=('python: to use pcsc-spy tool')
provides=($_pkgname=$pkgver-$pkgrel 'libpcsclite.so' 'libpcscspy.so')
options=('!docs')
validpgpkeys=('F5E11B9FFE911146F41D953D78A1B4DFE8F9C57E') # Ludovic Rousseau <rousseau@debian.org>
source=("https://pcsclite.apdu.fr/files/pcsc-lite-${pkgver}.tar.bz2")
sha256sums=('9ee3f9b333537562177893559ad4f7b8d5c23ebe828eef53056c02db14049d08')
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

  install -D -m0644 "$srcdir/pcsc-lite-$pkgver/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -d "$pkgdir/usr/lib/pcsc/drivers"
}
