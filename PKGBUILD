# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer: Simon Conseil <contact+aur at saimon dot org>
# Contributor: damir <damir@archlinux.org>
# Contributor: Kevin Edmonds <edmondskevin@hotmail.com>
# Contributor: John Karahalis <john.karahalis@gmail.com>

pkgname=libmtp-git
pkgver=1.1.22.r76.gdb70734
pkgrel=1
pkgdesc="Library implementation of the Media Transfer Protocol"
arch=('i686' 'x86_64')
url="https://libmtp.sourceforge.net/"
license=('LGPL-2.1-or-later')
depends=('glibc' 'libgcrypt' 'libusb')
makedepends=('git' 'doxygen')
provides=("libmtp=$pkgver")
conflicts=('libmtp')
options=('staticlibs')
source=("git+https://github.com/libmtp/libmtp.git")
sha256sums=('SKIP')


pkgver() {
  cd "libmtp"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "libmtp"

  yes n | NOCONFIGURE=1 ./autogen.sh
  CFLAGS="$CFLAGS -ffat-lto-objects" \
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "libmtp"

  #make check
}

package() {
  cd "libmtp"

  make DESTDIR="$pkgdir" install

  # Install man page
  cp -r "doc/man" "$pkgdir/usr/share/man"
}
