# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=hardinfo
pkgver=0.5.1.816.g877ea2b
_commit=877ea2bc7777626c6fe77b6934a09261f1f1409e
pkgrel=2
pkgdesc="A system information and benchmark tool."
arch=('x86_64' 'i686')
url="https://github.com/lpereira/hardinfo"
license=('GPL2')
depends=('gtk2')
makedepends=('cmake' 'git')
source=($pkgname::git+https://github.com/lpereira/hardinfo#commit=$_commit)
sha1sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long | sed "s/^release-//;s/^0.5-/0.5.1-/;s/-/./g"
}

prepare() {
  cd ${pkgname}
  git submodule update --init
  mkdir -p build
}

build() {
  cd ${pkgname}/build
  CFLAGS+=' -fcommon' # https://wiki.gentoo.org/wiki/Gcc_10_porting_notes/fno_common
  cmake \
    -DHARDINFO_GTK3=0 \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    ..
  make
}

package() {
  cd ${pkgname}/build
  make DESTDIR="${pkgdir}" install
}
