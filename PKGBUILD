# Maintainer: Matt Coffin <mcoffin13@gmail.com>

pkgname=bzip2-git
pkgver=r66.ad723d6
pkgrel=3
pkgdesc="A parallel, SMP-based, bzip2-compatible compression utility"
arch=('i686' 'x86_64')
url="https://sourceware.org/bzip2/"
license=('custom')
depends=('glibc')
makedepends=('perl' 'git' 'meson' 'ninja')
provides=('bzip2')
conflicts=('bzip2')

_gitname="bzip2"
source=($_gitname'::git+https://gitlab.com/federicomenaquintero/bzip2.git#branch=master')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_gitname"
  meson \
    --prefix=/usr \
    --buildtype release \
    builddir
  ninja -C builddir
}

check() {
  cd "$srcdir/$_gitname"
  meson test -C builddir --print-errorlogs
}

package() {
  cd "$srcdir/$_gitname"
  DESTDIR="$pkgdir" meson install -C builddir

  install -D -m644 -t "$pkgdir/usr/share/licenses/$pkgname" ./COPYING

  cd "$pkgdir/usr/lib"
  if [ ! -e libbz2.so.1.0 ]; then
    ln -s libbz2.so.1 libbz2.so.1.0
  fi
}
