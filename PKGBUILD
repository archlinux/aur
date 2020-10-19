# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=pciutils-git
pkgver=3.7.0.r15.ge12bd01
pkgrel=1
pkgdesc="Programs for inspecting and manipulating configuration of PCI devices"
arch=('i686' 'x86_64')
url="https://mj.ucw.cz/sw/pciutils/"
license=('GPL2')
depends=('glibc' 'sh' 'hwids' 'kmod')
makedepends=('git')
provides=('pciutils')
conflicts=('pciutils')
options=('staticlibs')
source=("git+https://git.kernel.org/pub/scm/utils/pciutils/pciutils.git")
sha256sums=('SKIP')


pkgver() {
  cd "pciutils"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "pciutils"

  make \
    OPT="$CFLAGS" \
    SHARED=no \
    ZLIB=no
  cp "lib/libpci.a" "$srcdir"

  make clean
  make \
    OPT="$CFLAGS" \
    SHARED=yes \
    ZLIB=no
}

package() {
  cd "pciutils"

  make \
    DESTDIR="$pkgdir" \
    PREFIX="/usr" \
    SBINDIR="/usr/bin" \
    SHAREDIR="/usr/share/hwdata" \
    SHARED=yes \
    ZLIB=no \
    install \
    install-lib

  install -Dm644 "$srcdir/libpci.a" -t "$pkgdir/usr/lib"

  # supplied by hwids package
  rm -rf "$pkgdir/usr"/{bin/update-pciids,share/{hwdata,man/man8/update-pciids.8}}
}
