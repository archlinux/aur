# Maintainer: David Parrish <daveparrish@tutanota.com>

pkgname=diffutils-patched-exclude-directory-git
pkgver=3.7.r11.g3600e8d
pkgrel=1
pkgdesc='Utility programs used for creating patch files, including exclude directory feature'
arch=('i686' 'x86_64')
url='http://www.gnu.org/software/diffutils'
license=('GPL3')
depends=('libsigsegv')
makedepends=('gperf' 'git' 'help2man' 'rsync' 'wget')
provides=('diffutils')
conflicts=('diffutils')
source=("${pkgname}::git+git://git.savannah.gnu.org/diffutils.git"
            'exclude-directory.patch')
sha256sums=('SKIP'
            'f13ddfff73dd85a8051c9196cecd900162ce496f924b60bee7ec086871c4d572')

pkgver() {
  cd "$pkgname" || exit
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  msg 'Applying exclude directory patch ...'
  patch -d "$pkgname" -p1 <exclude-directory.patch

  cd "$pkgname" || exit

  # Bootstrap diffutils
  ./bootstrap
}

build() {
  cd "$pkgname" || exit
  ./configure --prefix=/usr
  make
}

check() {
  cd "$pkgname" || exit
  make check
}

package() {
  cd "$pkgname" || exit
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
