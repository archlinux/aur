# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=desktop-file-utils-git
pkgver=0.26.r5.g56d220d
pkgrel=2
pkgdesc="Command line utilities for working with desktop entries"
arch=('i686' 'x86_64')
url="https://www.freedesktop.org/wiki/Software/desktop-file-utils/"
license=('GPL')
depends=('glibc' 'glib2')
makedepends=('git')
provides=("desktop-file-utils=$pkgver")
conflicts=('desktop-file-utils')
source=("git+https://gitlab.freedesktop.org/xdg/desktop-file-utils.git"
        "update-desktop-database.hook::https://gitlab.archlinux.org/archlinux/packaging/packages/desktop-file-utils/-/raw/main/update-desktop-database.hook")
sha256sums=('SKIP'
            'SKIP')


pkgver() {
  cd "desktop-file-utils"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "desktop-file-utils"

  NOCONFIGURE=1 ./autogen.sh
  ./configure \
    --prefix="/usr"
  make
}

package() {
  cd "desktop-file-utils"

  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/update-desktop-database.hook" -t "$pkgdir/usr/share/libalpm/hooks"
}
