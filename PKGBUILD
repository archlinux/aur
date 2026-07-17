# Maintainer: Uladzislau Bolbas <cmrtumilovic@gmail.com>

pkgname=gisp
pkgver=1.2
pkgrel=1
pkgdesc="File encryption utility using XChaCha20-Poly1305 and Argon2id"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://savannah.nongnu.org/projects/gisp"
license=('GPL-3.0-or-later')
depends=('libsodium')
makedepends=('gcc' 'make' 'gettext' 'texinfo' 'pkgconf')
install="$pkgname.install"
# Signed release tarball from Savannah (verified against the maintainer's key).
source=("https://download.savannah.nongnu.org/releases/$pkgname/$pkgname-$pkgver.tar.gz"
        "https://download.savannah.nongnu.org/releases/$pkgname/$pkgname-$pkgver.tar.gz.asc")
sha256sums=('0053ea8d3a3dc18d5db08594e7c9fd5dab3275c2ab6b58b999a64bd946532563'
            'SKIP')
validpgpkeys=('CAD6600A6D1987A35977DAC769C78665ADF4D655')

build() {
  cd "$pkgname-$pkgver"
  # The tarball is a "make dist" product: configure and Makefile.in are already
  # generated, so no autotools bootstrap is needed.
  ./configure --prefix=/usr
  make
}

check() {
  cd "$pkgname-$pkgver"
  make check
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  # The info "dir" index is owned by the system, not by this package; the
  # gisp.install scriptlet registers gisp.info instead.
  rm -f "$pkgdir/usr/share/info/dir"
}
