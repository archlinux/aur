# Mantainer: Andy Kluger <gmail: andykluger>
# Contributor: Black_Codec <orso.f.regna@gmail.com>
# Contributor: Silvio Knizek <killermoehre@gmx.net>
# Contributor: Xavier Devlamynck <magicrhesus@ouranos.be>

pkgname=megafuse-git
pkgver=r149.50bc488
pkgrel=1
pkgdesc="Mount your MEGA cloud storage with fuse"
arch=('i686' 'x86_64')
license=('GPL2')
url="https://github.com/matteoserva/MegaFuse"
depends=('crypto++' 'freeimage' 'fuse')
makedepends=('git')
conflicts=('megafuse')
provides=('megafuse')
source=("git://github.com/matteoserva/MegaFuse.git")
md5sums=("SKIP")

pkgver() {
  cd "MegaFuse"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "MegaFuse/src"
  sed -i -e 's/<unistd.h>/<unistd.h>\n#include <cmath>/' file_cache_row.cpp
}

build() {
  cd "MegaFuse"
  case ${CARCH} in
     x86_64 )
           sed -i -e 's/CPPFLAGS = /CPPFLAGS = -m64 /' Makefile
           ;;
  esac
  make
}

package() {
  cd "MegaFuse"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/MegaFuse"
  mkdir -p "$pkgdir/usr/lib/systemd/system"
  mkdir -p "$pkgdir/usr/lib/systemd/user"
  cp "MegaFuse" "$pkgdir/usr/bin/"
  cp "megafuse.conf" "$pkgdir/usr/share/MegaFuse/"
  cp "megafuse@.service" "$pkgdir/usr/lib/systemd/system/"
  cp "megafuse.service" "$pkgdir/usr/lib/systemd/user/"
}
