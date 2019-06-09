# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=fuse3-git
pkgver=3.5.0.r15.g63c1145
pkgrel=1
pkgdesc="The reference implementation of the Linux FUSE (Filesystem in userspace) interface"
arch=('i686' 'x86_64')
url="https://github.com/libfuse/libfuse"
license=('GPL2' 'LGPL2')
depends=('glibc')
makedepends=('git' 'meson' 'pkgconf')
provides=('fuse3' 'fuse-common')
conflicts=('fuse3' 'fuse-common')
options=('staticlibs')
backup=('etc/fuse.conf')
source=("git+https://github.com/libfuse/libfuse.git"
        "fuse.conf::https://git.archlinux.org/svntogit/packages.git/plain/trunk/fuse.conf?h=packages/fuse3")
sha256sums=('SKIP'
            'SKIP')


pkgver() {
  cd "libfuse"

  git describe --long --tags | sed 's/^fuse-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "libfuse"

  meson \
    --buildtype=plain \
    --prefix="/usr" \
    --sbindir="bin" \
    --default-library both \
    "_build"
  ninja -C "_build"
}

package() {
  cd "libfuse"

  DESTDIR="$pkgdir" meson install -C "_build"
  install -Dm644 "$srcdir/fuse.conf" -t "$pkgdir/etc"

  # static device nodes are handled by udev
  rm -r "$pkgdir/dev"

  # Remove init script in wrong path
  rm -r "$pkgdir/etc/init.d"
}
