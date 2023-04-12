# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=pkg-config-git
pkgver=0.29.2.r1.g2dd2b19
pkgrel=3
pkgdesc="A system for managing library compile/link flags"
arch=('i686' 'x86_64')
url="https://www.freedesktop.org/wiki/Software/pkg-config/"
license=('GPL2')
depends=('glibc' 'glib2')
makedepends=('git')
provides=("pkg-config=$pkgver" 'pkgconfig')
conflicts=('pkg-config' 'pkgconfig')
source=("git+https://anongit.freedesktop.org/git/pkg-config.git"
        "0001-Workaround-error-m4_copy.patch")
sha256sums=('SKIP'
            '03e1c1a997590b82c0922fca86c7be5ee85d04181c6f2ce020bdbe53c7f1b47b')


prepare() {
  cd "pkg-config"

  patch -Np1 -i "$srcdir/0001-Workaround-error-m4_copy.patch"
}

pkgver() {
  cd "pkg-config"

  git describe --long --tags | sed 's/^pkg-config-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "pkg-config"

  ./autogen.sh \
    --no-configure
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "pkg-config"

  make check
}

package() {
  cd "pkg-config"

  make DESTDIR="$pkgdir" install
}
