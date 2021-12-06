# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=cpio-git
pkgver=2.13.r15.g86dacfe
pkgrel=1
pkgdesc="Utility that copy files into or out of a cpio or tar archive"
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/cpio/"
license=('GPL')
depends=('glibc')
makedepends=('git' 'rsync')
provides=('cpio')
conflicts=('cpio')
source=("git+https://git.savannah.gnu.org/git/cpio.git"
        "gettext-version.patch")
sha256sums=('SKIP'
            '90ed0528fcc541ab83b3d9c97522bf7b8196a2da8dd60278656158806ee23599')


prepare() {
  cd "cpio"

  patch -Np1 -i "$srcdir/gettext-version.patch"
}

pkgver() {
  cd "cpio"

  git describe --long --tags | sed 's/^release_//;s/\([^-]*-g\)/r\1/;s/-/./g;s/_/./g'
}

build() {
  cd "cpio"

  ./bootstrap
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "cpio"

  make check
}

package() {
  cd "cpio"

  make DESTDIR="$pkgdir" install

  rm -rf "$pkgdir/usr/libexec"
  rm -rf "$pkgdir/usr/share/man/man8"
}
