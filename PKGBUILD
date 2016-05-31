# Maintainer: Devin J. Pohly <djpohly+arch@gmail.com>
pkgname=piuio-dkms-git
_pkgname=piuio
pkgver=1.0.r0.gc270904
pkgrel=1
pkgdesc="Kernel driver for the PIUIO arcade input device (with DKMS)"
arch=('i686' 'x86_64')
url="https://github.com/djpohly/$_pkgname"
license=('GPL2')
makedepends=('git')
depends=('dkms')
provides=('piuio')
conflicts=('piuio')
source=("git+https://github.com/djpohly/$_pkgname.git" 'dkms.conf')
sha256sums=('SKIP'
            '030ffe1732d95095df5e8db4316b0c4dbfa3566394ea56f6bd6d67d0665e804c')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_pkgname/mod"

  # Install and update DKMS config
  install -Dm644 "$srcdir/dkms.conf" "$pkgdir/usr/src/$_pkgname-$pkgver/dkms.conf"
  sed -i -e "s/@_PKGNAME@/$_pkgname/g" -e "s/@PKGVER@/$pkgver/g" \
    "$pkgdir/usr/src/$_pkgname-$pkgver/dkms.conf"

  # Install sources
  install -m644 -t "$pkgdir/usr/src/$_pkgname-$pkgver/" Makefile piuio.c
}

# vim:set ts=2 sw=2 et:
