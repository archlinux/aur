# Maintainer: a821 at (nospam) mail de
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Johannes Löthberg

pkgname=rhash-git
pkgver=1.4.5.r19.ge3c4c8c
pkgrel=1
pkgdesc='Utility for verifying hash sums of files'
arch=('x86_64')
url='https://github.com/rhash/rhash'
license=('0BSD')
conflicts=("rhash")
provides=("rhash")
depends=('glibc')
makedepends=('git')
backup=('etc/rhashrc')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd rhash
  git describe --long | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
  cd rhash
  ./configure --prefix=/usr --sysconfdir=/etc --extra-cflags="$CFLAGS" --extra-ldflags="$LDFLAGS"
  make
}

check() {
  make -C rhash test-shared
}

package() {
  cd rhash

  # program
  make DESTDIR="$pkgdir" install
  # library
  make -C librhash DESTDIR="$pkgdir" install-lib-headers install-so-link
  # license
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
