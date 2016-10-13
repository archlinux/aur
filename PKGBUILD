# Maintainer: David Parrish <daveparrish@tutanota.com>

pkgname=diffutils-git-patched-exclude-directory
pkgver=3.5.r7.g84387b8
pkgrel=1
pkgdesc='Utility programs used for creating patch files, including exclude directory feature'
arch=('i686' 'x86_64')
url='http://www.gnu.org/software/diffutils'
license=('GPL3')
depends=('libsigsegv')
makedepends=('gperf')
provides=('diffutils')
conflicts=('diffutils')
source=("${pkgname}::git+git://git.savannah.gnu.org/diffutils.git"
            'exclude-directory.patch')
sha256sums=('SKIP'
            '97ac78bc61718cba9ae0387b9882042a4e59086f14c8964c75aa467d68e5de34')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  msg 'Applying exclude directory patch ...'
  patch -d "$pkgname" -p1 <exclude-directory.patch

  cd "$pkgname"

  msg 'Bootstrapping diffutils ...'
  ./bootstrap
}

build() {
  cd "$pkgname"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$pkgname"
  make check
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:	
