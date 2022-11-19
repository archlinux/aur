# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=fuse3-git
pkgver=3.12.0.r2.g7776639
pkgrel=1
pkgdesc="The reference implementation of the Linux FUSE (Filesystem in userspace) interface"
arch=('i686' 'x86_64')
url="https://github.com/libfuse/libfuse"
license=('GPL2' 'LGPL')
depends=('glibc')
makedepends=('git' 'meson' 'pkgconf' 'udev')
provides=("fuse3=$pkgver" 'fuse-common')
conflicts=('fuse3' 'fuse-common')
options=('staticlibs')
backup=('etc/fuse.conf')
source=("git+https://github.com/libfuse/libfuse.git")
sha256sums=('SKIP')


pkgver() {
  cd "libfuse"

  git describe --long --tags | sed 's/^fuse-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "libfuse"

  meson setup \
    --buildtype=plain \
    --prefix="/usr" \
    --sbindir="bin" \
    --default-library both \
    "_build"
  meson compile -C "_build"
}

package() {
  cd "libfuse"

  meson install -C "_build" --destdir "$pkgdir"
  install -Dm644 "util/fuse.conf" -t "$pkgdir/etc"

  # static device nodes are handled by udev
  rm -r "$pkgdir/dev"

  # Remove init script in wrong path
  rm -r "$pkgdir/etc/init.d"
}
