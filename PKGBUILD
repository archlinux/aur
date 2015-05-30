# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=rhash-git
pkgver=1.3.3.r9.gbf59ce0
pkgrel=1
pkgdesc='Utility for verifying hash sums (SFV, CRC, etc) - development version'
arch=('i686' 'x86_64')
url='http://rhash.anz.ru/?l=en'
license=('custom' 'MIT')
conflicts=("rhash")
provides=("rhash")
depends=('glibc')
backup=('etc/rhashrc')
#options=('staticlibs')
source=("git+https://github.com/rhash/rhash.git")
md5sums=('SKIP')

pkgver() {
  cd rhash
  git describe --long | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
  make -C rhash ADDCFLAGS="$CFLAGS" ADDLDFLAGS="$LDFLAGS" build-shared lib-static
}

check() {
  make -C rhash test-shared
}

package() {
  cd rhash

  # program
  make PREFIX=/usr DESTDIR="$pkgdir" install-shared
  # library
  make -C librhash PREFIX=/usr DESTDIR="$pkgdir" install-headers install-lib-shared install-lib-static
  # license
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/rhash/LICENSE
}
