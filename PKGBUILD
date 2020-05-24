# Maintainer: Qirui Wang <wqr.prg@gmail.com>

_name=openrsync
pkgname="$_name-git"
pkgver=0.5.0.r111.g8b61216
pkgrel=1
pkgdesc="BSD-licensed implementation of rsync"
arch=('x86_64')
url="https://github.com/kristapsdz/openrsync"
license=('ISC')
depends=('glibc')
makedepends=('git')
provides=("$_name")
conflicts=("$_name")
source=("git+https://github.com/kristapsdz/$_name.git")
sha256sums=('SKIP')

prepare() {
  cd "$_name"

  # Remove forced debug
  sed -i 's/CFLAGS="${CFLAGS} -g /CFLAGS="${CFLAGS} /' configure

  # LDFLAGS
  sed -i 's/$(CC) -o $@ /$(CC) $(LDFLAGS) -o $@ /' Makefile

  # Fix install permissions
  sed -i 's/"${INSTALL} -m 0555"/"${INSTALL} -m755"/' configure
  sed -i 's/"${INSTALL} -m 0444"/"${INSTALL} -m644"/' configure
}

pkgver() {
  cd "$_name"
  git describe --long --tags | sed 's/^VERSION_//;s/\([^-]*-g\)/r\1/;s/[_-]/./g'
}

build() {
  cd "$_name"
  ./configure LDFLAGS="$LDFLAGS" MANDIR=/usr/share/man PREFIX=/usr
  make
}

package() {
  cd "$_name"
  make DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/licence"
}
